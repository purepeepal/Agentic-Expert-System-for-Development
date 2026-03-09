# 📋 CUSTOM AGENT REGISTRY

> **Purpose:** Master index of all project-specific custom domain agents. The Handler Agent reads this file to discover custom agents and include them in PDRS routing. When you create a new custom agent, register it here.

---

## How Custom Agents Work

1. You identify a domain expertise gap that the 13 core domains don't cover
2. You create a custom agent using `CUSTOM_AGENT_TEMPLATE.md`
3. You register it in this file (below)
4. The Handler Agent automatically discovers it and includes it in PDRS routing
5. Custom agents participate in parliamentary debate alongside core domains

---

## Active Custom Agents

> Add one row per custom agent. The Handler Agent scans this table for routing.

| ID | Name | File | Cluster Affinity | Consultation Triggers | Status |
|----|------|------|------------------|-----------------------|--------|
| *No custom agents registered yet* | | | | | |

<!-- 
EXAMPLE ROW (uncomment and modify when adding your first custom agent):
| C1 | Learning Science & Pedagogy | Custom-Agents/Custom_C1_EdTech_Learning_Science.md | Human (H) | Educational content design, learning outcome measurement, pedagogical strategy, adaptive learning, assessment design | Active |
-->

---

## Registration Protocol

When adding a new custom agent:

```
STEP 1: CREATE the agent file using CUSTOM_AGENT_TEMPLATE.md
        File naming: Custom_C[N]_[Short_Name].md
        Place in: Custom-Agents/ directory

STEP 2: REGISTER in the table above with:
        - ID: C[N] (sequential: C1, C2, C3...)
        - Name: Human-readable domain name
        - File: Relative path to the agent file
        - Cluster Affinity: Strategy (S), Technical (T), or Human (H)
        - Consultation Triggers: Comma-separated keywords/phrases that activate this agent
        - Status: Active / Inactive / Draft

STEP 3: VERIFY the agent file passes the readiness checklist:
        □ 5 named perspectives + 1 Wildcard (1.5x vote weight)
        □ Clear mandate and consultation triggers
        □ Defined relationship to core domains
        □ Assessment protocol with concrete checklists
        □ Rules with IF/THEN logic
        □ Cross-domain interface (offers and needs)
        □ Initiative alignment signals

STEP 4: TEST by routing a sample query that should activate this agent
        Confirm it appears in PDRS scoring for relevant queries
```

---

## How the Handler Routes to Custom Agents

The Handler Agent extends its PDRS scoring to include custom agents:

```
EXTENDED PDRS FOR CUSTOM AGENTS:

  For each registered custom agent C:
    PDRS(C) = KEYWORD_MATCH(C) × 0.25      ← Higher keyword weight (custom = specific)
            + DOMAIN_SCOPE_FIT(C) × 0.30
            + CORE_DOMAIN_REFERRAL(C) × 0.20  ← Core domain says "this needs custom expertise"
            + INITIATIVE_ALIGNMENT(C) × 0.15
            + WILDCARD_RELEVANCE(C) × 0.10

  ROUTING THRESHOLDS (same as core domains):
    PDRS ≥ 0.7  → PRIMARY (full debate)
    PDRS 0.4-0.69 → SECONDARY (focused input)
    PDRS 0.2-0.39 → ADVISORY
    PDRS < 0.2  → SILENT

  CLUSTER INTEGRATION:
    Custom agents join their declared Cluster Affinity for Tier 2 synthesis.
    A custom agent with Cluster Affinity "Human (H)" contributes its DAS
    to the Human Cluster Summary alongside Domains 4, 6, 8, and 12.

  PERSPECTIVE COUNT:
    Each custom agent adds 6 perspectives (5 + 1 Wildcard).
    System total = 78 (core) + 6 × [number of active custom agents].
```

---

## Lifecycle Management

```
CREATION:   User identifies expertise gap → Creates agent from template → Registers here
ACTIVATION: Status set to "Active" → Handler includes in PDRS routing
DRAFT:      Status set to "Draft" → Handler ignores (agent under development)
DEACTIVATION: Status set to "Inactive" → Handler ignores but file preserved
ARCHIVAL:   Move to Custom-Agents/archived/ → Remove from registry table
EVOLUTION:  Custom agent can be promoted to core domain if it proves universally useful
```

---

## Guidelines: Custom vs. Core

| Situation | Action |
|-----------|--------|
| Need is specific to THIS project type | Create custom agent |
| Need would benefit ALL projects | Propose as core domain addition |
| Need overlaps heavily with a core domain | Modify Initiative Compass, don't create custom |
| Need is a one-time question | Just ask — don't agent-ify it |
| Need will persist across many queries for this project | Create custom agent |
| Multiple custom agents start overlapping | Merge them |
| A custom agent is useful across 3+ different projects | Promote to core domain |

---

**Registry Version:** 1.0  
**Total Active Custom Agents:** 0  
**Last Updated:** Template
