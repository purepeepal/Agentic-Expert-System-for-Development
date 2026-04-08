param (
    [Parameter(Mandatory=$true)]
    [string]$SourcePath,
    
    [Parameter(Mandatory=$true)]
    [string]$TargetPath
)

# Function to clean markdown bolding
function Clean-MarkdownBolding {
    param ([string]$Text)
    return ($Text -replace '\*\*', '' -replace '__', '').Trim()
}

# Function to safely parse JSON or return default
function Get-SafeJsonContent {
    param ([string]$File, [string]$DefaultContent)
    if (Test-Path $File) {
        try {
            return (Get-Content $File -Raw | ConvertFrom-Json)
        } catch {
            Write-Warning "Failed to parse $File, using default."
            return (ConvertFrom-Json $DefaultContent)
        }
    }
    return (ConvertFrom-Json $DefaultContent)
}

# Arrays to track migrations
$MigratedDecisions = @()
$MigratedDirectives = @()
$ModelMigrated = $false

Write-Host "Starting migration from $SourcePath to $TargetPath..."

# --- 1. Process Decisions ---
$DecisionsDir = Join-Path $SourcePath "decisions"
$DecisionsFile = Join-Path $TargetPath "decisions.json"

if (Test-Path $DecisionsDir) {
    Write-Host "Processing decisions..."
    
    # Initialize or load target JSON using ordered hashtables for proper serialization
    $TargetData = [ordered]@{ "decisions" = @() }
    if (Test-Path $DecisionsFile) {
        try {
            $RawData = Get-Content $DecisionsFile -Raw | ConvertFrom-Json
            if ($null -ne $RawData.decisions) {
                # Convert CustomObjects to HashTables for easier manipulation
                foreach ($item in $RawData.decisions) {
                    $hashtable = [ordered]@{}
                    foreach ($prop in $item.psobject.properties) {
                        $hashtable[$prop.Name] = $prop.Value
                    }
                    $TargetData["decisions"] += $hashtable
                }
            }
        } catch { Write-Warning "Target decisions.json corrupt. Overwriting." }
    }

    $MdFiles = Get-ChildItem -Path $DecisionsDir -Filter "*.md" | Where-Object { $_.Name -notmatch "^\." }
    
    foreach ($File in $MdFiles) {
        $Content = Get-Content $File.FullName
        $DecisionId = $File.Name.Replace('.md', '')
        
        # Check if already migrated
        $exists = $false
        foreach ($existing in $TargetData["decisions"]) {
             if ($existing.id -eq $DecisionId) { $exists = $true; break }
        }
        if ($exists) { Write-Host "Skipping $DecisionId (already migrated)"; continue }
        
        # Parse content
        $Title = ""
        $Metadata = @{}
        $BodyStart = 0
        
        for ($i=0; $i -lt $Content.Length; $i++) {
            $Line = $Content[$i].Trim()
            if ([string]::IsNullOrWhiteSpace($Line)) { continue }
            
            if ($Line -match '^#\s+(.+)$') {
                $Title = $matches[1]
            }
            elseif ($Line -match '^(?:\*\*)?([^:*]+)(?:\*\*)?:\s*(.+)$') {
                $key = Clean-MarkdownBolding $matches[1]
                $val = Clean-MarkdownBolding $matches[2]
                $Metadata[$key] = $val
                $BodyStart = $i + 1
            }
            elseif ($Line -match '^##') {
                break
            }
        }
        
        $Body = ($Content[$BodyStart..($Content.Length-1)] -join "`n").Trim()
        
        $TitleStr = $Title -replace 'DECISION:\s*', '' -replace 'Decision:\s*', ''
        $DateStr = if ($Metadata.ContainsKey("Date")) { $Metadata["Date"] } else { (Get-Date).ToString('yyyy-MM-dd') }
        $StatusStr = if ($Metadata.ContainsKey("Status")) { $Metadata["Status"] } else { 'Archived (Migrated)' }
        
        $DomainsArr = @()
        if ($Metadata.ContainsKey("Domains Involved")) { $DomainsStr = $Metadata["Domains Involved"] }
        elseif ($Metadata.ContainsKey("Domains")) { $DomainsStr = $Metadata["Domains"] }
        else { $DomainsStr = $null }
        
        if ($null -ne $DomainsStr) {
            $matched = [regex]::Matches($DomainsStr, 'D?\d+')
            foreach ($m in $matched) {
                $num = $m.Value
                if ($num -match '^\d+$') { $num = "D$num" }
                if ($DomainsArr -notcontains $num) { $DomainsArr += $num }
            }
        }
        
        # Build ordered hashtable for JSON creation
        $DecisionObj = [ordered]@{
            "id" = $DecisionId
            "title" = $TitleStr
            "date" = $DateStr
            "status" = $StatusStr
            "domains" = $DomainsArr
            "content" = $Body
        }
        
        # Explicitly assign array element 
        $TargetData["decisions"] += $DecisionObj
        $MigratedDecisions += $DecisionId
    }
    
    $TargetData | ConvertTo-Json -Depth 5 -Compress | Out-File -FilePath "$DecisionsFile.tmp" -Encoding utf8
    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
    [System.IO.File]::WriteAllText($DecisionsFile, (Get-Content "$DecisionsFile.tmp" -Raw), $Utf8NoBomEncoding)
    Remove-Item "$DecisionsFile.tmp"
    Write-Host "Migrated $($MigratedDecisions.Count) decisions."
} else {
    Write-Host "Decisions directory not found."
}

# --- 2. Process Directives ---
$DirectivesDir = Join-Path $SourcePath "directives"
$DirectivesFile = Join-Path $TargetPath "directives.json"

if (Test-Path $DirectivesDir) {
    Write-Host "Processing directives..."
    
    $TargetData = [ordered]@{ "directives" = @() }
    if (Test-Path $DirectivesFile) {
        try {
            $RawData = Get-Content $DirectivesFile -Raw | ConvertFrom-Json
            if ($null -ne $RawData.directives) {
                foreach ($item in $RawData.directives) {
                    $hashtable = [ordered]@{}
                    foreach ($prop in $item.psobject.properties) {
                        $hashtable[$prop.Name] = $prop.Value
                    }
                    $TargetData["directives"] += $hashtable
                }
            }
        } catch { Write-Warning "Target directives.json corrupt. Overwriting." }
    }

    $MdFiles = Get-ChildItem -Path $DirectivesDir -Filter "*.md" | Where-Object { $_.Name -notmatch "^\." }
    
    foreach ($File in $MdFiles) {
        $Content = Get-Content $File.FullName
        $DirectiveId = $File.Name.Replace('.md', '')
        
        $exists = $false
        foreach ($existing in $TargetData["directives"]) {
             if ($existing.id -eq $DirectiveId) { $exists = $true; break }
        }
        if ($exists) { continue }
        
        # Parse content
        $Title = ""
        $Metadata = @{}
        $BodyStart = 0
        
        for ($i=0; $i -lt $Content.Length; $i++) {
            $Line = $Content[$i].Trim()
            if ([string]::IsNullOrWhiteSpace($Line)) { continue }
            
            if ($Line -match '^#\s+(.+)$') {
                $Title = $matches[1]
            }
            elseif ($Line -match '^(?:\*\*)?([^:*]+)(?:\*\*)?:\s*(.+)$') {
                $key = Clean-MarkdownBolding $matches[1]
                $val = Clean-MarkdownBolding $matches[2]
                $Metadata[$key] = $val
                $BodyStart = $i + 1
            }
            elseif ($Line -match '^##') {
                break
            }
        }
        
        $Body = ($Content[$BodyStart..($Content.Length-1)] -join "`n").Trim()
        
        $TitleStr = $Title -replace 'DIRECTIVE:\s*', '' -replace 'Directive:\s*', ''
        $DateStr = if ($Metadata.ContainsKey("Date")) { $Metadata["Date"] } else { (Get-Date).ToString('yyyy-MM-dd') }
        $StatusStr = if ($Metadata.ContainsKey("Status")) { $Metadata["Status"] } else { 'Active' }
        
        $DirectiveObj = [ordered]@{
            "id" = $DirectiveId
            "title" = $TitleStr
            "status" = $StatusStr
            "created" = $DateStr
            "content" = $Body
        }
        
        $TargetData["directives"] += $DirectiveObj
        $MigratedDirectives += $DirectiveId
    }
    
    $TargetData | ConvertTo-Json -Depth 5 -Compress | Out-File -FilePath "$DirectivesFile.tmp" -Encoding utf8
    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
    [System.IO.File]::WriteAllText($DirectivesFile, (Get-Content "$DirectivesFile.tmp" -Raw), $Utf8NoBomEncoding)
    Remove-Item "$DirectivesFile.tmp"
    Write-Host "Migrated $($MigratedDirectives.Count) directives."
} else {
    Write-Host "Directives directory not found."
}

# --- 3. Process User Model ---
$UserModelFile = Join-Path $SourcePath "user-model.md"
$TargetModelFile = Join-Path $TargetPath "user_model.json"

if (Test-Path $UserModelFile) {
    Write-Host "Processing User Model..."
    
    $defaultJson = @'
{
  "user_model": {
    "decision_patterns": [],
    "approval_signals": [],
    "rejection_signals": [],
    "correction_patterns": [],
    "communication_preferences": {
      "detail_level": null,
      "format": null,
      "decision_format": null,
      "question_tolerance": null
    },
    "quality_axes": [],
    "anti_preferences": []
  }
}
'@
    # Setup base structure as nested hashtables
    $TargetData = [ordered]@{
        "user_model" = [ordered]@{
            "decision_patterns" = @()
            "approval_signals" = @()
            "rejection_signals" = @()
            "correction_patterns" = @()
            "communication_preferences" = [ordered]@{
                 "detail_level" = $null
                 "format" = $null
                 "decision_format" = $null
                 "question_tolerance" = $null
            }
            "quality_axes" = @()
            "anti_preferences" = @()
        }
    }
    
    # Try merging with existing, skipping complex property copy for simplicity, we assume we overwrite arrays
    # In a perfect world we'd deeply merge, but replacing lists from MD is acceptable for a 1-time migrate.
    
    $Content = Get-Content $UserModelFile -Raw
    $Sections = $Content -split '(?m)^##\s+'
    
    foreach ($Section in $Sections[1..($Sections.Length-1)]) {
        $Lines = $Section -split "`n"
        $SectionTitle = $Lines[0].Trim()
        
        $TableRows = @()
        $ListItems = @()
        $InTable = $false
        
        for ($i=1; $i -lt $Lines.Length; $i++) {
            $LineStr = $Lines[$i].Trim()
            if ($LineStr -match '^\|(.+)\|$') {
                 if ($LineStr -match '---') { continue }
                 $InTable = $true
                 $Cols = ($matches[1] -split '\|').Trim()
                 $TableRows += ,$Cols  # Add as array literal
            }
            elseif ($LineStr -match '^- (.+)' -and -not $InTable) {
                 $ListItems += $matches[1].Trim()
            }
            elseif ([string]::IsNullOrWhiteSpace($LineStr)) {
                 $InTable = $false
            }
        }
        
        # Remove headers
        if ($TableRows.Count -gt 0 -and $TableRows[0][0] -match '(?i)^(pattern|approved|rejected|corrected from|aspect|quality dimension)$') {
             $TableRows = $TableRows[1..($TableRows.Count-1)]
        }
        
        if ($SectionTitle -eq "Decision Patterns" -and $null -ne $TableRows) {
             foreach ($row in $TableRows) {
                 if ($row.Length -ge 3) {
                     $TargetData["user_model"]["decision_patterns"] += [ordered]@{
                         "pattern" = $row[0]; "evidence" = $row[1]; "confidence" = $row[2]
                     }
                 }
             }
        }
        elseif ($SectionTitle -eq "Approval Signals" -and $null -ne $TableRows) {
             foreach ($row in $TableRows) {
                 if ($row.Length -ge 4) {
                     $TargetData["user_model"]["approval_signals"] += [ordered]@{
                         "signal" = $row[0]; "date" = $row[1]; "context" = $row[2]; "inference" = $row[3]
                     }
                 }
             }
        }
        elseif ($SectionTitle -eq "Rejection Signals" -and $null -ne $TableRows) {
             foreach ($row in $TableRows) {
                 if ($row.Length -ge 4) {
                     $TargetData["user_model"]["rejection_signals"] += [ordered]@{
                         "signal" = $row[0]; "date" = $row[1]; "context" = $row[2]; "inference" = $row[3]
                     }
                 }
             }
        }
        elseif ($SectionTitle -eq "Correction Patterns" -and $null -ne $TableRows) {
             foreach ($row in $TableRows) {
                 if ($row.Length -ge 4 -and $row[0] -notmatch "Awaiting observations") {
                     $TargetData["user_model"]["correction_patterns"] += [ordered]@{
                         "from" = $row[0]; "to" = $row[1]; "date" = $row[2]; "inference" = $row[3]
                     }
                 }
             }
        }
        elseif ($SectionTitle -eq "Communication Preferences" -and $null -ne $TableRows) {
             foreach ($row in $TableRows) {
                 if ($row.Length -ge 2) {
                     $Key = ($row[0].ToLower() -replace '\s+', '_' -replace '\*\*', '').Trim()
                     $Val = $row[1]
                     if ($TargetData["user_model"]["communication_preferences"].Contains($Key)) {
                          $TargetData["user_model"]["communication_preferences"][$Key] = $Val
                     }
                 }
             }
        }
        elseif ($SectionTitle -eq "Quality Axes" -and $null -ne $TableRows) {
             foreach ($row in $TableRows) {
                 if ($row.Length -ge 3) {
                     $TargetData["user_model"]["quality_axes"] += [ordered]@{
                         "dimension" = ($row[0] -replace '\*\*', '').Trim(); "standard" = $row[1]; "evidence" = $row[2]
                     }
                 }
             }
        }
        elseif ($SectionTitle -eq "Anti-Preferences" -and $null -ne $ListItems) {
             foreach ($item in $ListItems) {
                 $TargetData["user_model"]["anti_preferences"] += $item
             }
        }
    }
    
    $TargetData | ConvertTo-Json -Depth 5 -Compress | Out-File -FilePath "$TargetModelFile.tmp" -Encoding utf8
    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
    [System.IO.File]::WriteAllText($TargetModelFile, (Get-Content "$TargetModelFile.tmp" -Raw), $Utf8NoBomEncoding)
    Remove-Item "$TargetModelFile.tmp"
    
    $ModelMigrated = $true
    Write-Host "Migrated User Model."
}

# --- 4. Update Changelog ---
if ($MigratedDecisions.Count -gt 0 -or $MigratedDirectives.Count -gt 0 -or $ModelMigrated) {
    $ChangelogFile = Join-Path $TargetPath "changelog.md"
    $Timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm")
    
    $Entries = @()
    foreach ($d in $MigratedDecisions) {
        $Entries += "### [$Timestamp] - WRITE`n- **Type:** decision`n- **ID:** $d`n- **Summary:** Migrated from old Markdown architecture.`n- **Source:** Migration Script`n"
    }
    foreach ($d in $MigratedDirectives) {
        $Entries += "### [$Timestamp] - WRITE`n- **Type:** directive`n- **ID:** $d`n- **Summary:** Migrated from old Markdown architecture.`n- **Source:** Migration Script`n"
    }
    if ($ModelMigrated) {
        $Entries += "### [$Timestamp] - UPDATE`n- **Type:** user_model`n- **ID:** global`n- **Summary:** Migrated observations from old Markdown user-model.`n- **Source:** Migration Script`n"
    }
    
    if (Test-Path $ChangelogFile) {
        $Content = Get-Content $ChangelogFile -Raw
        if ($Content -match '(?s)(.*?---)(.*)') {
            $NewContent = "$($matches[1])`n`n$($Entries -join "`n")$($matches[2])"
        } else {
            $NewContent = "$Content`n`n$($Entries -join "`n")"
        }
        $NewContent | Out-File -FilePath $ChangelogFile -Encoding utf8
    } else {
        $NewContent = "# Memory Changelog`n`n---`n`n$($Entries -join "`n")"
        $NewContent | Out-File -FilePath $ChangelogFile -Encoding utf8
    }
    Write-Host "Updated changelog."
}

Write-Host "Migration complete."

