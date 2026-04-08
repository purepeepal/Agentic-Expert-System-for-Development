import os
import sys
import json
import re
from datetime import datetime
import glob
import argparse

def ensure_list(data, key):
    if key not in data:
        data[key] = []
    elif not isinstance(data[key], list):
        data[key] = [data[key]]

def clean_markdown_bolding(text):
    """Remove ** or __ from text"""
    return re.sub(r'[*_]{2}', '', text).strip()

def parse_markdown_yaml_like_header(content):
    """Extract metadata from the top of the markdown file (e.g., **Date:** YYYY-MM-DD)."""
    metadata = {}
    lines = content.split('\n')
    body_start = 0
    
    for i, line in enumerate(lines):
        line = line.strip()
        if not line or line.startswith('# '):
            continue
            
        # Match pattern like: **Date:** 2026-03-07
        match = re.match(r'^(?:\*\*)?([^:*]+)(?:\*\*)?:\s*(.+)$', line)
        if match:
            key = match.group(1).strip()
            val = match.group(2).strip()
            # Clean up value if it has markdown formatting
            val = clean_markdown_bolding(val)
            metadata[key] = val
            body_start = i + 1
        elif line.startswith('##'):
             break # Reached the body content
             
    # Extract the title from the first heading 1
    title_match = re.search(r'^#\s+(.+)$', content, re.MULTILINE)
    title = title_match.group(1).strip() if title_match else ""
    
    body = "\n".join(lines[body_start:]).strip()
    return title, metadata, body

def process_decisions(source_dir, target_dir):
    decisions_dir = os.path.join(source_dir, "decisions")
    target_file = os.path.join(target_dir, "decisions.json")
    
    if not os.path.exists(decisions_dir):
        print(f"Source decisions directory not found: {decisions_dir}")
        return []
        
    try:
        with open(target_file, 'r', encoding='utf-8') as f:
            target_data = json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        target_data = {"decisions": []}
        
    ensure_list(target_data, "decisions")
    
    md_files = glob.glob(os.path.join(decisions_dir, "*.md"))
    migrated_ids = []
    
    for filepath in md_files:
        filename = os.path.basename(filepath)
        if filename.startswith('.'):
            continue
            
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
            
        title, metadata, body = parse_markdown_yaml_like_header(content)
        
        # Generate an ID from the filename
        decision_id = filename.replace('.md', '')
        
        # Check if already exists
        if any(d.get('id') == decision_id for d in target_data['decisions']):
            print(f"Skipping already mapped decision: {decision_id}")
            continue
            
        # Parse domains string into list if possible
        domains_str = metadata.get('Domains Involved', metadata.get('Domains', ''))
        domains = []
        if domains_str:
            # Extract domain numbers or codes
            domains = re.findall(r'D?\d+', domains_str)
            # Standardize to D1, D2 etc if just numbers
            domains = [f"D{d}" if d.isdigit() else d for d in domains]
            
        decision_obj = {
            "id": decision_id,
            "title": title.replace('DECISION: ', '').replace('Decision: ', '').strip(),
            "date": metadata.get('Date', datetime.now().strftime('%Y-%m-%d')),
            "status": metadata.get('Status', 'Archived (Migrated)'),
            "domains": domains if domains else [],
            "content": body
        }
        
        target_data['decisions'].append(decision_obj)
        migrated_ids.append(decision_id)
        
    with open(target_file, 'w', encoding='utf-8') as f:
        json.dump(target_data, f, indent=2)
        
    print(f"Migrated {len(migrated_ids)} decisions.")
    return migrated_ids

def process_directives(source_dir, target_dir):
    directives_dir = os.path.join(source_dir, "directives")
    target_file = os.path.join(target_dir, "directives.json")
    
    if not os.path.exists(directives_dir):
        print(f"Source directives directory not found: {directives_dir}")
        return []
        
    try:
        with open(target_file, 'r', encoding='utf-8') as f:
            target_data = json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        target_data = {"directives": []}
        
    ensure_list(target_data, "directives")
    
    md_files = glob.glob(os.path.join(directives_dir, "*.md"))
    migrated_ids = []
    
    for filepath in md_files:
        filename = os.path.basename(filepath)
        if filename.startswith('.'):
            continue
            
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
            
        title, metadata, body = parse_markdown_yaml_like_header(content)
        
        # Generate an ID from the filename
        directive_id = filename.replace('.md', '')
        
        # Check if already exists
        if any(d.get('id') == directive_id for d in target_data['directives']):
            print(f"Skipping already mapped directive: {directive_id}")
            continue
            
        # Ensure we capture context if it's there
        directive_obj = {
            "id": directive_id,
            "title": title.replace('DIRECTIVE: ', '').replace('Directive: ', '').strip(),
            "status": metadata.get('Status', 'Active'),
            "created": metadata.get('Date', datetime.now().strftime('%Y-%m-%d')),
            "content": body
        }
        
        target_data['directives'].append(directive_obj)
        migrated_ids.append(directive_id)
        
    with open(target_file, 'w', encoding='utf-8') as f:
        json.dump(target_data, f, indent=2)
        
    print(f"Migrated {len(migrated_ids)} directives.")
    return migrated_ids

def parse_markdown_tableRow(row):
    """Parse a markdown table row separated by pipes."""
    return [col.strip() for col in row.strip().strip('|').split('|')]

def process_user_model(source_dir, target_dir):
    source_file = os.path.join(source_dir, "user-model.md")
    target_file = os.path.join(target_dir, "user_model.json")
    
    if not os.path.exists(source_file):
        print(f"Source user-model.md not found: {source_file}")
        return False
        
    try:
        with open(target_file, 'r', encoding='utf-8') as f:
            target_data = json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        target_data = {
            "user_model": {
                "decision_patterns": [],
                "approval_signals": [],
                "rejection_signals": [],
                "correction_patterns": [],
                "communication_preferences": {
                    "detail_level": None,
                    "format": None,
                    "decision_format": None,
                    "question_tolerance": None
                },
                "quality_axes": [],
                "anti_preferences": []
            }
        }
    
    if "user_model" not in target_data:
         target_data["user_model"] = {}
         
    user_model = target_data["user_model"]
    
    # helper for ensuring lists
    for key in ["decision_patterns", "approval_signals", "rejection_signals", "correction_patterns", "quality_axes", "anti_preferences"]:
        if key not in user_model:
            user_model[key] = []
            
    if "communication_preferences" not in user_model:
        user_model["communication_preferences"] = {}
        
    with open(source_file, 'r', encoding='utf-8') as f:
        content = f.read()
        
    sections = re.split(r'^##\s+', content, flags=re.MULTILINE)
    
    for section in sections[1:]: # Skip the first chunk
        lines = section.split('\n')
        section_title = lines[0].strip()
        
        table_rows = []
        list_items = []
        
        in_table = False
        for line in lines[1:]:
            line_s = line.strip()
            if line_s.startswith('|'):
                if '---' in line_s: # skip header separator
                    continue
                in_table = True
                table_rows.append(parse_markdown_tableRow(line_s))
            elif line_s.startswith('- ') and not in_table:
                list_items.append(line_s[2:].strip())
            elif line_s == '':
                in_table = False
                
        # Remove headers from table rows if they exist
        if len(table_rows) > 0 and table_rows[0][0].lower() in ['pattern', 'approved', 'rejected', 'corrected from', 'aspect', 'quality dimension']:
            table_rows = table_rows[1:]
            
        if section_title == "Decision Patterns":
            for row in table_rows:
                if len(row) >= 3:
                     # Add uniquely
                     entry = {"pattern": row[0], "evidence": row[1], "confidence": row[2]}
                     if entry not in user_model["decision_patterns"]:
                        user_model["decision_patterns"].append(entry)
                        
        elif section_title == "Approval Signals":
            for row in table_rows:
                 if len(row) >= 4:
                     entry = {"signal": row[0], "date": row[1], "context": row[2], "inference": row[3]}
                     if entry not in user_model["approval_signals"]:
                        user_model["approval_signals"].append(entry)
                        
        elif section_title == "Rejection Signals":
            for row in table_rows:
                 if len(row) >= 4:
                     entry = {"signal": row[0], "date": row[1], "context": row[2], "inference": row[3]}
                     if entry not in user_model["rejection_signals"]:
                        user_model["rejection_signals"].append(entry)
                        
        elif section_title == "Correction Patterns":
            for row in table_rows:
                 if len(row) >= 4 and "Awaiting observations" not in row[0]:
                     entry = {"from": row[0], "to": row[1], "date": row[2], "inference": row[3]}
                     if entry not in user_model["correction_patterns"]:
                        user_model["correction_patterns"].append(entry)
                        
        elif section_title == "Communication Preferences":
            for row in table_rows:
                 if len(row) >= 2:
                     key = row[0].lower().replace(' ', '_').replace('**', '')
                     val = row[1]
                     if key in user_model["communication_preferences"]:
                         if not user_model["communication_preferences"][key]:
                             user_model["communication_preferences"][key] = val
                             
        elif section_title == "Quality Axes":
            for row in table_rows:
                 if len(row) >= 3:
                     entry = {"dimension": row[0].replace('**', ''), "standard": row[1], "evidence": row[2]}
                     if entry not in user_model["quality_axes"]:
                        user_model["quality_axes"].append(entry)
                        
        elif section_title == "Anti-Preferences":
            for item in list_items:
                if item not in user_model["anti_preferences"]:
                    user_model["anti_preferences"].append(item)
                    
    with open(target_file, 'w', encoding='utf-8') as f:
        json.dump(target_data, f, indent=2)
        
    print(f"Migrated user model data.")
    return True

def update_changelog(target_dir, migrated_decisions, migrated_directives, model_migrated):
    changelog_file = os.path.join(target_dir, "changelog.md")
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M")
    
    entries = []
    
    for d_id in migrated_decisions:
        entries.append(f"### [{timestamp}] — WRITE\n- **Type:** decision\n- **ID:** {d_id}\n- **Summary:** Migrated from old Markdown architecture.\n- **Source:** Migration Script\n")
        
    for d_id in migrated_directives:
        entries.append(f"### [{timestamp}] — WRITE\n- **Type:** directive\n- **ID:** {d_id}\n- **Summary:** Migrated from old Markdown architecture.\n- **Source:** Migration Script\n")
        
    if model_migrated:
        entries.append(f"### [{timestamp}] — UPDATE\n- **Type:** user_model\n- **ID:** global\n- **Summary:** Migrated observations from old Markdown user-model.\n- **Source:** Migration Script\n")
        
    if not entries:
        return
        
    # Append to top of changelog after the header
    try:
        with open(changelog_file, 'r', encoding='utf-8') as f:
            content = f.read()
            
        # find the hr ---
        parts = content.split('---', 1)
        if len(parts) > 1:
            new_content = parts[0] + "---\n\n" + "\n".join(entries) + parts[1]
        else:
            new_content = content + "\n\n" + "\n".join(entries)
            
        with open(changelog_file, 'w', encoding='utf-8') as f:
            f.write(new_content)
    except FileNotFoundError:
        print("Changelog file not found, creating one.")
        with open(changelog_file, 'w', encoding='utf-8') as f:
            f.write("# Memory Changelog\n\n---\n\n" + "\n".join(entries))

def main():
    parser = argparse.ArgumentParser(description="Migrate Knowledge-Vault Markdown to Memory JSON format.")
    parser.add_argument("--source", required=True, help="Path to the original Knowledge-Vault directory")
    parser.add_argument("--target", required=True, help="Path to the new memory directory")
    
    args = parser.parse_args()
    
    print(f"Starting migration from '{args.source}' to '{args.target}'...")
    
    decisions = process_decisions(args.source, args.target)
    directives = process_directives(args.source, args.target)
    model = process_user_model(args.source, args.target)
    
    if decisions or directives or model:
        update_changelog(args.target, decisions, directives, model)
        print("Migration complete. Check changelog.md for details.")
    else:
        print("No data migrated.")

if __name__ == "__main__":
    main()
