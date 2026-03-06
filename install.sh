#!/usr/bin/env bash
set -euo pipefail

# Agentic Expert System for Development — Claude Code Skill Installer
# Installs the expert system as a Claude Code skill at ~/.claude/skills/

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="${HOME}/.claude/skills"
SKILL_DIR="${SKILLS_DIR}/expert-system"

echo "Installing Agentic Expert System as Claude Code skill..."
echo ""

# Create skill directories
mkdir -p "${SKILL_DIR}/domains"
mkdir -p "${SKILL_DIR}/knowledge-vault"
mkdir -p "${SKILL_DIR}/custom-agents"

# Copy main skill file
cp "${SCRIPT_DIR}/expert-system.md" "${SKILLS_DIR}/expert-system.md"

# Copy domain files
cp "${SCRIPT_DIR}"/Domain_*.md "${SKILL_DIR}/domains/"

# Copy knowledge vault templates
cp "${SCRIPT_DIR}"/Knowledge-Vault/*.md "${SKILL_DIR}/knowledge-vault/"

# Copy custom agent templates
cp "${SCRIPT_DIR}"/Custom-Agents/*.md "${SKILL_DIR}/custom-agents/"

echo "Installed to:"
echo "  Skill file:      ${SKILLS_DIR}/expert-system.md"
echo "  Domain files:    ${SKILL_DIR}/domains/ (13 files)"
echo "  Knowledge Vault: ${SKILL_DIR}/knowledge-vault/"
echo "  Custom Agents:   ${SKILL_DIR}/custom-agents/"
echo ""
echo "Usage: Type /expert-system before any query in Claude Code"
echo ""
echo "Done."
