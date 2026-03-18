---
description: Migrate Knowledge-Vault Markdown files to memory JSON architecture
---
# Knowledge Vault to Memory Migration Workflow

This workflow executes the migration of legacy Markdown-based Knowledge-Vault files into the new structured JSON `memory` architecture. It ensures no data or context is lost during the transition and logs all writes to the memory changelog.

## Prerequisites
- Windows PowerShell

## Execution Steps

1. Run the migration script with your specific source and target paths:
   ```powershell
   powershell.exe -ExecutionPolicy Bypass -File ".agents\scripts\migrate_knowledge_to_memory.ps1" -SourcePath "Knowledge-Vault" -TargetPath "memory"
   ```

2. Verify the output in the console. It will indicate how many decisions, directives, and user model observations were migrated.

3. Check `memory/changelog.md` to ensure the audit trail was successfully written.

## Deprecation Notice
After verifying the migration:
- The `Knowledge-Vault` folder is considered deprecated.
- It is NOT automatically deleted by this script to preserve it as a reference, but you should not write new data to it.
- All new AI agents should read and write to the `.json` files in the `memory` folder.
