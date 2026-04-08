# 📐 CUSTOM AGENT TEMPLATE

> **Purpose:** Use this template to create project-specific domain agents that extend the 16 core domains with expertise the core system doesn't cover. Custom agents participate in the parliamentary debate pipeline alongside core domains.

---

## When to Create a Custom Agent

Create a custom agent when your project requires **specialized domain expertise** that spans BEYOND what the 16 core domains provide. The core system covers general development concerns (architecture, security, UX, algorithms, etc.), but project-specific domains need project-specific agents.

**Examples of when custom agents are needed:**

| Project Type | Custom Agent Needed | Why Core Domains Aren't Enough |
|-------------|--------------------|-----------------------------|
| EdTech platform | Learning Science & Pedagogy | Core Domain 4 covers developer cognition, not educational theory |
| Healthcare app | Clinical & Regulatory Compliance | Core Domain 10 covers general security, not HIPAA/HL7/FHIR |
| FinTech product | Financial Regulation & Risk | Core domains don't cover SEC, PCI-DSS, or financial modeling |
| Game development | Game Design & Player Psychology | Core Domain 6 covers product design, not game loop theory |
| E-commerce | Commerce & Conversion Optimization | Core domains don't cover payment flows, cart psychology, or fulfillment |
| IoT/Embedded | Hardware-Software Interface | Core Domain 3 covers cloud infra, not embedded constraints |
| Legal tech | Legal Domain & Compliance | No core domain covers jurisdiction-specific legal reasoning |
| Audio/Music app | Audio Engineering & Psychoacoustics | No core domain covers signal processing or music theory |

**When NOT to create a custom agent:**
- The need is already covered by a core domain (just route there)
- The need is a one-off question (just ask, don't build an agent)
- The need is a variant of an existing domain (modify the core domain's Initiative Compass instead)

---

## Template: Copy Everything Below This Line

```markdown
# [EMOJI] CUSTOM DOMAIN AGENT: [DOMAIN NAME]

## Identity & Mandate

**Domain:** [What this agent specializes in — 1-2 lines of scope]
**Cluster Affinity:** [Strategy (S) / Technical (T) / Human (H) — which core cluster does this agent align with most?]
**Custom Domain ID:** C[N] (e.g., C1, C2, C3 — sequential custom numbering)
**Core Question:** *"[The fundamental question this domain answers]"*

**Mandate:** [2-3 sentences: What this agent ensures, what it prevents, what it optimizes for]

**When this agent MUST be consulted:**
- [Trigger 1]
- [Trigger 2]
- [Trigger 3]
- [Trigger 4]

**When this agent should defer:**
- [Condition] → [Which core domain handles it instead]
- [Condition] → [Which core domain handles it instead]

**Relationship to Core Domains:**
- **Extends:** [Which core domain(s) does this custom agent extend?]
- **Overlaps:** [Where does it share territory, and how is the boundary drawn?]
- **Depends on:** [Which core domains does it need input from?]

---

## 🗣️ Internal Perspectives

> Custom agents follow the same **7-Role Model** as core domains.
> Each role is a distinct lens with a clear mandate. Do not skip any role.

### 1. ⚖️ Vision Anchor (Arbiter) — [Name]
**Bias:** [Unbiased protector of this domain's values and constraints]
**Focuses on:** [What must remain true; what must not be violated]
**Catches what others miss:** [Silent value drift, misalignment with mission]
**Value instruction:** "[Explicit instruction on how this anchor protects project values]"

### 2. Novel Creator — [Name]
**Bias:** [Generates original, high-leverage approaches]
**Focuses on:** [New patterns, unconventional solutions, creative synthesis]
**Catches what others miss:** [Hidden leverage, novel combinations]
**Key principle:** "[One-sentence philosophy]"

### 3. Deep Researcher — [Name]
**Bias:** [Evidence, rigor, grounding in sources]
**Focuses on:** [Benchmarks, references, constraints, prior art]
**Catches what others miss:** [False claims, missing citations, outdated assumptions]
**Key principle:** "[One-sentence philosophy]"

### 4. Future-Proofing Visionary — [Name]
**Bias:** [Long-horizon resilience and evolution]
**Focuses on:** [Scale, maintenance trajectory, ecosystem shifts]
**Catches what others miss:** [Tomorrow's constraints, migration pain, lock-in]
**Key principle:** "[One-sentence philosophy]"

### 5. Destroyer — [Name]
**Bias:** [Stress-testing, failure modes, adversarial thinking]
**Focuses on:** [Edge cases, systemic risks, attack/failure paths]
**Catches what others miss:** [Hidden breakpoints, brittle assumptions]
**Key principle:** "[One-sentence philosophy]"

### 6. Maintainer — [Name]
**Bias:** [Operational realism and maintenance cost]
**Focuses on:** [Simplicity, debuggability, reliability, day-2 operations]
**Catches what others miss:** [Long-term burden, brittle processes, team friction]
**Key principle:** "[One-sentence philosophy]"

### 7. 🃏 Wildcard — [Name] (1.5x vote weight)
**Bias:** [Contrarian perspective that challenges domain orthodoxy]
**Mandate:** [What assumption this wildcard exists to question]
**Provocation examples:**
- "[Example challenge 1]"
- "[Example challenge 2]"
- "[Example challenge 3]"
**Challenge instruction:** "[Explicit instruction on what this wildcard must question]"

---

## 📋 Assessment Protocol

### First-Contact Evaluation: [Domain] Health Check

```
[ASSESSMENT AREA 1]:
  □ [Check item]
  □ [Check item]
  □ [Check item]

[ASSESSMENT AREA 2]:
  □ [Check item]
  □ [Check item]
  □ [Check item]

[ASSESSMENT AREA 3]:
  □ [Check item]
  □ [Check item]
  □ [Check item]
```

### Scoring Rubric

| Dimension | Score 1-3 (Critical) | Score 4-6 (Needs Work) | Score 7-9 (Strong) | Score 10 (Exemplary) |
|-----------|---------------------|----------------------|-------------------|---------------------|
| **[Dim 1]** | [Description] | [Description] | [Description] | [Description] |
| **[Dim 2]** | [Description] | [Description] | [Description] | [Description] |
| **[Dim 3]** | [Description] | [Description] | [Description] | [Description] |

---

## 📐 Rules & Workflows

### Rule [PREFIX]1: [Rule Name]
```
RULE: [Clear statement of the rule]

[Detailed rule logic, decision trees, IF/THEN statements]
```

### Rule [PREFIX]2: [Rule Name]
```
RULE: [Clear statement of the rule]

[Detailed rule logic]
```

> Add as many rules as needed. Use a consistent prefix (e.g., ED for EdTech, HC for Healthcare).

---

## 🔌 Cross-Domain Interface

### OFFERS to other domains:
- [What expertise/analysis this custom domain provides to core domains]

### NEEDS from other domains:
- [What this custom domain needs from specific core domains]

### Standard Query Format
```
TO Custom Domain C[N]:
  "[Template query]"
  Context: [what's needed]
  Constraints: [what applies]

FROM Custom Domain C[N]:
  Recommendation: [structured output]
  [Domain-specific output fields]
```

---

## 🎯 Initiative Alignment

### How This Domain Discovers Project Values:
```
SIGNALS:
  ├─ [Signal 1] → [What it reveals]
  ├─ [Signal 2] → [What it reveals]
  └─ [Signal 3] → [What it reveals]
```

---

## ⚡ Optimization Mandate

**What "optimal" means in this domain:** [Definition]

**Trade-off matrices:**
| Dimension | vs [Domain] Quality |
|-----------|---------------------|
| [Trade-off 1] | [How to balance] |
| [Trade-off 2] | [How to balance] |
```

---

## Registration

> After creating your custom agent, register it in `Custom-Agents/AGENT_REGISTRY.md` so the Handler Agent discovers and routes to it.

---

## Checklist: Is Your Custom Agent Ready?

```
□ Has 7 roles: Vision Anchor, Novel Creator, Deep Researcher, Future-Proofing Visionary, Destroyer, Maintainer, Wildcard (1.5x weight)
□ Has a clear mandate and consultation triggers
□ Defines relationship to core domains (extends, overlaps, depends)
□ Has an assessment protocol with concrete checklists
□ Has rules with IF/THEN logic (not just general advice)
□ Has cross-domain interface (offers and needs)
□ Has initiative alignment discovery signals
□ Registered in AGENT_REGISTRY.md
□ Would NOT be better served by modifying an existing core domain
```
