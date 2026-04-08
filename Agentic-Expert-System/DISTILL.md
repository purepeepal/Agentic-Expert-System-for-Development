# DISTILL — Domain Compression Guide

How to re-generate compressed domain files when parliament/ source files change.

**Domain numbering note:** The core system intentionally uses a non-contiguous domain index. **D12** (Complexity) was merged into **D09 (Logic & Complexity)**. The **16 universal core domains** remain **D01–D16**. Project-specific custom agents live under `parliament/Custom-Agents/` and are referenced as **C1, C2, C3...** (not as additional D-domains).

---

## When to Run

Re-distill a domain when:
- You edit any `parliament/Domain_XX_*.md` file
- You add a new custom domain via `parliament/Custom-Agents/`
- A compressed file in `domains/` feels stale or misaligned with its source

**Staleness detection**: Compare modification dates. If `parliament/Domain_XX.md` is newer than `domains/DXX.md`, that domain needs re-distillation.

---

## The Distillation Prompt

Give this prompt to your LLM (use any capable model with sufficient context window) along with the full domain file:

```
Compress the following domain expert file into a ~500-token compressed domain reference.

MANDATORY STRUCTURE (7 sections, in this order):
1. **Identity** — Role name, 1-sentence mission, expertise keywords
2. **The 7-Role Model (Condensed)** — List all 7 roles: Vision Anchor (Arbiter), Novel Creator, Deep Researcher, Future-Proofing Visionary, Destroyer, Maintainer, Wildcard. Include short role descriptors.
3. **Cross-Domain Veto Conditions** — Minimum 4. These are non-negotiable blockers that MUST be surfaced when triggered, regardless of which domain is primary
4. **Cross-Domain Override Triggers** — Minimum 4. Query topics that pull this domain into any analysis even when it's not primary
5. **Perspectives (Arbiter Prompts)** — Reasoning prompts (not rules). Each is a lens to reason through, written as a question or challenge
6. **⚖️ Vision Anchor & 🃏 Wildcard** — Extract BOTH the Vision Anchor AND the Wildcard with explicit, executable instructions. These are required for Layer 0.75 assembly.
7. **Decision Framework** — 3-5 highest-signal heuristics for this domain, written as action prompts

COMPRESSION PRIORITY (what to keep when space is tight):
1. Cross-Domain Veto Conditions (NEVER cut)
2. Cross-Domain Override Triggers (NEVER cut)
3. Vision Anchor Value Instruction + Wildcard Challenge Instruction
4. The 7-Role Model (Condensed)
5. Reasoning Perspectives as Prompts
6. Domain Identity

DISCARD: Assessment checklists, scoring rubrics, biographical character details, internal procedures, worked examples, lengthy rationale.

CRITICAL RULES:
- Perspectives must be reasoning PROMPTS, not declarative rules
- Vision Anchor must have an explicit value-protection instruction (actionable)
- Wildcard must have an explicit paradigm-challenging instruction (actionable)
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

## The 7-Role Model (Condensed)
1. **Vision Anchor (Arbiter):** [Unbiased protector/judge of project values]
2. **Novel Creator:** [Original solution generator]
3. **Deep Researcher:** [Evidence/benchmarks/rigor]
4. **Future-Proofing Visionary:** [Long-horizon scaling & evolution]
5. **Destroyer:** [Stress-tests failure modes]
6. **Maintainer:** [Operational/maintenance realism]
7. **Wildcard:** [Contrarian paradigm challenger]

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

## Perspectives (Arbiter Prompts)
1. [Reasoning prompt as question or challenge]
2. [Reasoning prompt as question or challenge]
3. [Reasoning prompt as question or challenge]
4. [Reasoning prompt as question or challenge]

## ⚖️ Vision Anchor: [Character Name]
> [1-sentence persona description]

**Value instruction:** [Explicit instruction on how this anchor protects project values]

## 🃏 Wildcard: [Character Name]
> [1-sentence persona description]

**Challenge instruction:** [Explicit instruction on what this wildcard must question]

## Decision Framework
- [Heuristic 1 as action prompt]
- [Heuristic 2 as action prompt]
- [Heuristic 3 as action prompt]
```

---

## Custom Agent Distillation (Compressed Custom Domains)

Custom agents can also be "distilled" into compressed references for quick routing. These are stored in `domains/` as **DC** files.

**Naming convention:**
- Source: `parliament/Custom-Agents/Custom_C1_*.md` → Compressed: `domains/DC1_*.md`
- Use `DC[N]` to match `C[N]` (e.g., `C3` → `DC3_*`)

**Structure:** Use the same 7-section structure above (Identity → 7-Role Model → Vetoes → Triggers → Prompts → Anchor/Wildcard → Decision Framework), with these additions:
- In **Identity**, include `**Custom Domain ID:** C[N]` and `**Cluster Affinity:** ...`.
- Custom distillations MAY retain project-specific triggers/assumptions (they are not required to be universal).

---

## Validation Checklist

After generating a compressed file, verify:

- [ ] **Word count**: 450-550 words (check with word count tool)
- [ ] **Veto conditions**: At least 4 present, using "VETO if..." format
- [ ] **Override triggers**: At least 4 present, using "Activate when..." format
- [ ] **Vision Anchor & Wildcard**: Both have named characters and explicit value/challenge instructions
- [ ] **Perspectives**: Written as reasoning prompts (questions/challenges), NOT declarative rules
- [ ] **Core domains only:** No project-specific content (file is universal, works for any project)
- [ ] **Custom agents only:** Triggers and vetoes remain specific and actionable (do not over-generalize)
- [ ] **7 sections present**: Identity, 7-Role Model, Vetoes, Triggers, Perspectives, Anchors/Wildcards, Decision Framework

### Special Cases

Domains D10 (Security), D09 (Logic & Complexity), and D12 (Unconventional) carry extra cross-domain weight. These should have:
- [ ] **6 veto conditions** (instead of the standard 4-5)
- [ ] **6 override triggers** (instead of the standard 4-5)

---

## File Naming Convention

| Source (parliament/) | Compressed (domains/) |
|---|---|
| `Domain_01_Strategy.md` | `D01_strategy.md` |
| `Domain_02_Ecosystem.md` | `D02_ecosystem.md` |
| `Domain_03_Infra_Net.md` | `D03_infra_net.md` |
| `Domain_04_Cognition.md` | `D04_cognition.md` |
| `Domain_05_AI_Systems.md` | `D05_ai_systems.md` |
| `Domain_06_Design.md` | `D06_design.md` |
| `Domain_07_OSS_Tools.md` | `D07_oss_tools.md` |
| `Domain_08_UX.md` | `D08_ux.md` |
| `Domain_09_Logic_Math.md` | `D09_logic_math.md` |
| `Domain_10_Security.md` | `D10_security.md` |
| `Domain_11_Ops_Memory.md` | `D11_ops_memory.md` |
| `Domain_12_Unconventional.md` | `D12_unconventional.md` |
| `Domain_13_Docs.md` | `D13_docs.md` |
| `Domain_14_Root_Logic.md` | `D14_root_logic.md` |
| `Domain_15_Creative.md` | `D15_creative.md` |
| `Domain_16_Data_Systems.md` | `D16_data_systems.md` |
