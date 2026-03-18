# DISTILL — Domain Compression Guide

How to re-generate compressed domain files when parliament/ source files change.

---

## When to Run

Re-distill a domain when:
- You edit any `parliament/Domain_XX_*.md` file
- You add a new custom domain via `parliament/Custom-Agents/`
- A compressed file in `domains/` feels stale or misaligned with its source

**Staleness detection**: Compare modification dates. If `parliament/Domain_XX.md` is newer than `domains/DXX.md`, that domain needs re-distillation.

---

## The Distillation Prompt

Give this prompt to your LLM (Opus or Sonnet recommended) along with the full domain file:

```
Compress the following domain expert file into a ~500-token compressed domain reference.

MANDATORY STRUCTURE (6 sections, in this order):
1. **Identity** — Role name, 1-sentence mission, expertise keywords
2. **Cross-Domain Veto Conditions** — Minimum 4. These are non-negotiable blockers that MUST be surfaced when triggered, regardless of which domain is primary
3. **Cross-Domain Override Triggers** — Minimum 4. Query topics that pull this domain into any analysis even when it's not primary
4. **Perspectives** — Reasoning prompts (not rules). Each is a lens to reason through, written as a question or challenge
5. **🃏 Wildcard: [Character Name]** — A contrarian persona with an explicit challenge instruction that MUST question the leading recommendation
6. **Decision Framework** — 3-5 highest-signal heuristics for this domain, written as action prompts

COMPRESSION PRIORITY (what to keep when space is tight):
1. Cross-Domain Veto Conditions (NEVER cut)
2. Cross-Domain Override Triggers (NEVER cut)
3. Wildcard Mandate + Challenge Instruction
4. Reasoning Perspectives as Prompts
5. Domain Identity

DISCARD: Assessment checklists, scoring rubrics, biographical character details, internal procedures, worked examples, lengthy rationale.

CRITICAL RULES:
- Perspectives must be reasoning PROMPTS, not declarative rules
- Wildcard must have an explicit challenge instruction, not just a name
- Veto conditions use imperative language: "VETO if..."
- Override triggers are topic-based: "Activate when query involves..."
- Target 450-550 words (~500 tokens)
```

---

## Mandatory Structure Template

Every compressed file must follow this exact structure:

```markdown
# DXX — [Domain Name]

**Role:** [Expert title]
**Mission:** [1 sentence]
**Expertise:** [comma-separated keywords]

## Cross-Domain Veto Conditions
- VETO if [condition 1]
- VETO if [condition 2]
- VETO if [condition 3]
- VETO if [condition 4]

## Cross-Domain Override Triggers
- Activate when query involves [topic 1]
- Activate when query involves [topic 2]
- Activate when query involves [topic 3]
- Activate when query involves [topic 4]

## Perspectives
1. [Reasoning prompt as question or challenge]
2. [Reasoning prompt as question or challenge]
3. [Reasoning prompt as question or challenge]
4. [Reasoning prompt as question or challenge]

## 🃏 Wildcard: [Character Name]
> [1-sentence persona description]

**Challenge instruction:** [Explicit instruction on what this wildcard must question]

## Decision Framework
- [Heuristic 1 as action prompt]
- [Heuristic 2 as action prompt]
- [Heuristic 3 as action prompt]
```

---

## Validation Checklist

After generating a compressed file, verify:

- [ ] **Word count**: 450-550 words (check with word count tool)
- [ ] **Veto conditions**: At least 4 present, using "VETO if..." format
- [ ] **Override triggers**: At least 4 present, using "Activate when..." format
- [ ] **Wildcard**: Has a named character AND an explicit challenge instruction
- [ ] **Perspectives**: Written as reasoning prompts (questions/challenges), NOT declarative rules
- [ ] **No project-specific content**: File is universal, works for any project
- [ ] **6 sections present**: Identity, Vetoes, Triggers, Perspectives, Wildcard, Decision Framework

### Special Cases

Domains D10 (Security), D12 (Complexity), and D13 (Unconventional) carry extra cross-domain weight. These should have:
- [ ] **6 veto conditions** (instead of the standard 4-5)
- [ ] **6 override triggers** (instead of the standard 4-5)

---

## File Naming Convention

| Source (parliament/) | Compressed (domains/) |
|---|---|
| `Domain_01_Strategy.md` | `D01_strategy.md` |
| `Domain_02_Ecosystem.md` | `D02_ecosystem.md` |
| `Domain_03_Infrastructure.md` | `D03_infrastructure.md` |
| `Domain_04_Cognition.md` | `D04_cognition.md` |
| `Domain_05_AI_Integration.md` | `D05_ai_integration.md` |
| `Domain_06_Product_Design.md` | `D06_product_design.md` |
| `Domain_07_Open_Source.md` | `D07_open_source.md` |
| `Domain_08_Systems_UX.md` | `D08_systems_ux.md` |
| `Domain_09_Mathematics.md` | `D09_mathematics.md` |
| `Domain_10_Security.md` | `D10_security.md` |
| `Domain_11_DevOps.md` | `D11_devops.md` |
| `Domain_12_Complexity.md` | `D12_complexity.md` |
| `Domain_13_Unconventional.md` | `D13_unconventional.md` |
