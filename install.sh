#!/usr/bin/env bash
set -euo pipefail

# Agentic Expert System for Development — Multi-Agent Installer
# Installs the expert system for Claude Code, Cursor, Windsurf, Cline,
# Copilot, Continue, Aider, Roo Code, or all detected agents.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ─── Agent detection ───────────────────────────────────────────────

declare -A AGENTS_FOUND

detect_agents() {
  # Claude Code
  if [ -d "${HOME}/.claude" ] || command -v claude &>/dev/null; then
    AGENTS_FOUND[claude]=1
  fi

  # Cursor
  if [ -d "${HOME}/.cursor" ] || [ -d "${HOME}/Library/Application Support/Cursor" ] || [ -d "${HOME}/.config/Cursor" ]; then
    AGENTS_FOUND[cursor]=1
  fi

  # Windsurf / Codeium
  if [ -d "${HOME}/.codeium" ] || [ -d "${HOME}/.windsurf" ]; then
    AGENTS_FOUND[windsurf]=1
  fi

  # Cline
  if [ -d "${HOME}/Documents/Cline" ] || [ -d "${HOME}/.cline" ]; then
    AGENTS_FOUND[cline]=1
  fi

  # GitHub Copilot
  if [ -d "${HOME}/.config/github-copilot" ] || command -v gh &>/dev/null; then
    AGENTS_FOUND[copilot]=1
  fi

  # Continue
  if [ -d "${HOME}/.continue" ]; then
    AGENTS_FOUND[continue]=1
  fi

  # Aider
  if command -v aider &>/dev/null || [ -f "${HOME}/.aider.conf.yml" ]; then
    AGENTS_FOUND[aider]=1
  fi

  # Roo Code
  if [ -d "${HOME}/.roo" ]; then
    AGENTS_FOUND[roo]=1
  fi
}

# ─── Install functions ─────────────────────────────────────────────

fix_line_endings() {
  find "$1" -name "*.md" -exec sed -i 's/\r$//' {} + 2>/dev/null || true
}

# Builds the routing instruction block that tells any agent how to use the system.
# $1 = path to the directory where domain files are stored
routing_instructions() {
  local DOMAINS_PATH="$1"
  cat <<'INST'
# Agentic Expert System for Development

You have access to a multi-domain parliamentary expert system with 78 perspectives across 13 domains.

## How to Use
1. Read ROUTING_PROTOCOL.md for query classification and routing rules.
2. Read HANDLER_AGENT.md for the full orchestration protocol.
3. Route queries to relevant Domain files based on PDRS scoring.
4. Only load the 2-4 domain files relevant to each query, never all 13 at once.
5. After major decisions, log to Knowledge-Vault/session_logs.md.

## Domains (loaded on demand)
- Domain 1: Startup Strategy | Domain 2: Market Intelligence
- Domain 3: Infrastructure | Domain 4: Developer Cognition
- Domain 5: AI Integration | Domain 6: Product Design
- Domain 7: Open Source & Tooling | Domain 8: Systems UX
- Domain 9: Mathematics & Algorithms | Domain 10: Security
- Domain 11: Internal Systems & DevOps | Domain 12: Complexity Reduction
- Domain 13: Unconventional Strategies

## Workflows
- /expert-system — Route any query through the parliamentary debate
- /session-planning — Break epics into isolated build sessions
- /librarian — Consolidate session memory into permanent files

## Key Rules
- Minimum 2 primary domains per query
- Wildcards (1.5x vote weight) participate in every debate
- Dissent is never silenced — always log minority opinions
- Every recommendation must include concrete implementation steps
- Generic advice = rejected (if it could apply to any project, it's slop)
INST
}

install_claude() {
  echo "  Installing for Claude Code..."
  local DIR="${HOME}/.claude/skills/expert-system"
  mkdir -p "${DIR}/domains" "${DIR}/knowledge-vault" "${DIR}/custom-agents" "${DIR}/workflows"
  cp "${SCRIPT_DIR}/.claude/skills/expert-system/SKILL.md" "${DIR}/SKILL.md"
  cp "${SCRIPT_DIR}"/Domain_*.md "${DIR}/domains/"
  cp "${SCRIPT_DIR}"/Knowledge-Vault/*.md "${DIR}/knowledge-vault/"
  cp "${SCRIPT_DIR}"/Custom-Agents/*.md "${DIR}/custom-agents/"
  cp "${SCRIPT_DIR}"/agents/workflows/*.md "${DIR}/workflows/"
  fix_line_endings "${DIR}"
  echo "    -> ${DIR}/"
  echo "    Usage: /expert-system <query>"
}

install_cursor() {
  echo "  Installing for Cursor..."
  local DIR=".cursor/rules"
  mkdir -p "${DIR}"
  {
    echo "---"
    echo 'description: "Agentic Expert System — 78 perspectives, 13 domains, parliamentary debate for development queries"'
    echo "globs: \"*\""
    echo "alwaysApply: false"
    echo "---"
    echo ""
    routing_instructions "${SCRIPT_DIR}"
  } > "${DIR}/expert-system.mdc"
  fix_line_endings "${DIR}"
  echo "    -> ${DIR}/expert-system.mdc"
}

install_windsurf() {
  echo "  Installing for Windsurf..."
  local DIR=".windsurf/rules"
  mkdir -p "${DIR}"
  routing_instructions "${SCRIPT_DIR}" > "${DIR}/expert-system.md"
  fix_line_endings "${DIR}"
  echo "    -> ${DIR}/expert-system.md"
}

install_cline() {
  echo "  Installing for Cline..."
  local DIR=".clinerules"
  mkdir -p "${DIR}"
  routing_instructions "${SCRIPT_DIR}" > "${DIR}/expert-system.md"
  fix_line_endings "${DIR}"
  echo "    -> ${DIR}/expert-system.md"
}

install_copilot() {
  echo "  Installing for GitHub Copilot..."
  local DIR=".github/instructions"
  mkdir -p "${DIR}"
  {
    echo "---"
    echo 'applyTo: "**/*"'
    echo "---"
    echo ""
    routing_instructions "${SCRIPT_DIR}"
  } > "${DIR}/expert-system.instructions.md"
  fix_line_endings "${DIR}"
  echo "    -> ${DIR}/expert-system.instructions.md"
}

install_continue() {
  echo "  Installing for Continue..."
  local DIR=".continue/rules"
  mkdir -p "${DIR}"
  routing_instructions "${SCRIPT_DIR}" > "${DIR}/expert-system.md"
  fix_line_endings "${DIR}"
  echo "    -> ${DIR}/expert-system.md"
}

install_aider() {
  echo "  Installing for Aider..."
  routing_instructions "${SCRIPT_DIR}" > "CONVENTIONS.md"
  # Add read directive to .aider.conf.yml if not already there
  if [ -f ".aider.conf.yml" ]; then
    if ! grep -q "CONVENTIONS.md" ".aider.conf.yml" 2>/dev/null; then
      echo "read: CONVENTIONS.md" >> ".aider.conf.yml"
    fi
  else
    echo "read: CONVENTIONS.md" > ".aider.conf.yml"
  fi
  fix_line_endings "."
  echo "    -> CONVENTIONS.md + .aider.conf.yml"
}

install_roo() {
  echo "  Installing for Roo Code..."
  local DIR=".roo/rules"
  mkdir -p "${DIR}"
  routing_instructions "${SCRIPT_DIR}" > "${DIR}/expert-system.md"
  fix_line_endings "${DIR}"
  echo "    -> ${DIR}/expert-system.md"
}

# ─── Main ──────────────────────────────────────────────────────────

echo ""
echo "=== Agentic Expert System for Development ==="
echo "    78 perspectives | 13 domains | 3 clusters"
echo ""

detect_agents

if [ ${#AGENTS_FOUND[@]} -eq 0 ]; then
  echo "No supported AI coding agents detected."
  echo ""
  echo "Supported: Claude Code, Cursor, Windsurf, Cline, GitHub Copilot,"
  echo "           Continue, Aider, Roo Code"
  echo ""
  echo "You can also use: npx skills add $(basename "$(git -C "${SCRIPT_DIR}" remote get-url origin 2>/dev/null | sed 's/.*github.com[:/]//' | sed 's/.git$//')" 2>/dev/null || echo "owner/repo")"
  exit 1
fi

echo "Detected agents:"
for agent in "${!AGENTS_FOUND[@]}"; do
  echo "  [x] ${agent}"
done
echo ""

# If argument passed, install only that agent
if [ $# -gt 0 ]; then
  case "$1" in
    claude)   install_claude ;;
    cursor)   install_cursor ;;
    windsurf) install_windsurf ;;
    cline)    install_cline ;;
    copilot)  install_copilot ;;
    continue) install_continue ;;
    aider)    install_aider ;;
    roo)      install_roo ;;
    all)
      for agent in "${!AGENTS_FOUND[@]}"; do
        install_"${agent}"
      done
      ;;
    *)
      echo "Unknown agent: $1"
      echo "Options: claude cursor windsurf cline copilot continue aider roo all"
      exit 1
      ;;
  esac
else
  # Interactive selection
  echo "Which agents would you like to install for?"
  echo ""
  echo "  1) All detected agents"
  idx=2
  declare -a agent_list
  for agent in "${!AGENTS_FOUND[@]}"; do
    echo "  ${idx}) ${agent}"
    agent_list+=("${agent}")
    ((idx++))
  done
  echo ""
  read -r -p "Choose (1-$((idx-1)), or comma-separated like 2,3): " choice

  if [ "${choice}" = "1" ]; then
    for agent in "${!AGENTS_FOUND[@]}"; do
      install_"${agent}"
    done
  else
    IFS=',' read -ra selections <<< "${choice}"
    for sel in "${selections[@]}"; do
      sel=$(echo "${sel}" | tr -d ' ')
      local_idx=$((sel - 2))
      if [ "${local_idx}" -ge 0 ] && [ "${local_idx}" -lt "${#agent_list[@]}" ]; then
        install_"${agent_list[${local_idx}]}"
      else
        echo "  Skipping invalid selection: ${sel}"
      fi
    done
  fi
fi

echo ""
echo "Done."
echo ""
echo "Tip: You can also install via npx (supports 40+ agents):"
echo "  npx skills add $(basename "$(git -C "${SCRIPT_DIR}" remote get-url origin 2>/dev/null | sed 's/.*github.com[:/]//' | sed 's/.git$//')" 2>/dev/null || echo "owner/repo")"
echo ""
