# 🔌 ROUTING PROTOCOL: AI Agent Integration Guide

> **Purpose:** This document tells any AI agent how to use the Agentic Expert System. Drop this folder into any project, point your AI model at this file, and it will know how to route queries through 112+ expert perspectives across 16 core domains — plus any project-specific custom agents.

**Domain numbering note:** The core set is **16 universal domains**, numbered contiguously **D01–D16**. Project-specific custom agents are registered under `parliament/Custom-Agents/` and referenced as **C1, C2, C3...** (not as additional core domains).

---

## Quick Start (For AI Agents)

```
YOU ARE AN AI AGENT THAT HAS BEEN GIVEN ACCESS TO THIS SYSTEM.

YOUR ROLE: Route the user's development queries through the Agentic Expert System
to produce higher-quality, multi-perspective recommendations.

CRITICAL RULE: Resolve all file paths referenced in this system as local file paths
relative to the Agentic-Expert-System/ directory in the user's project.

STEP 1: Read .agents/workflows/Expert system.md — this is the workflow orchestrator
        and primary entry point for layer routing and memory management.
STEP 2: Read parliament/SYSTEM_MANIFESTO.md to understand the system's identity.
STEP 3: Read parliament/HANDLER_AGENT.md to understand orchestration protocol.
STEP 4: Check parliament/Custom-Agents/AGENT_REGISTRY.md for active custom agents.
STEP 5: For each user query, follow the workflow orchestrator's routing protocol.
STEP 6: Consult relevant domain files (compressed or full) based on layer selection.
STEP 7: Synthesize using the parliamentary debate pipeline.
STEP 8: Present the final recommendation in the required format.

YOUR FIRST ACTION: Read .agents/workflows/Expert system.md completely.
It is your operating manual and determines which layer to invoke.
```

---

## System Architecture Overview

```
User Query
    │
    ▼
┌──────────────────────┐
│  WORKFLOW ORCHESTRATOR │  ← .agents/workflows/Expert system.md
│  (Entry Point)        │
└──────┬───────────────┘
       │ CDRS scoring → selects layer
       ▼
┌──────────────────────────────────────────────────┐
│  LAYER 1: COMPRESSED DOMAINS (domains/)           │
│  16 compressed files (~500 tokens each, ~10K total)│
│  Handles routine queries on any model             │
├──────────────────────────────────────────────────┤
│  LAYER 1.5: COMPRESSED + PRIMARY FULL DOMAIN      │
│  16 compressed + 1 full domain file (~28K total)  │
│  Default for non-trivial queries (CDRS 3-5)       │
├──────────────────────────────────────────────────┤
│  LAYER 2: FULL PARLIAMENT (parliament/)           │
│  All full domain files + HANDLER_AGENT.md         │
│  112+ voices for major decisions (CDRS ≥6)        │
│                                                   │
│  Clusters: Strategy (S) / Technical (T) / Human (H)│
│  (See full domain headers for cluster assignment) │
├──────────────────────────────────────────────────┤
│         + CUSTOM DOMAIN AGENTS (optional)         │
│  Project-specific experts (C1, C2, C3...)         │
│  Each joins its declared Cluster Affinity         │
│  Created from Custom-Agents/CUSTOM_AGENT_TEMPLATE │
└──────────────────────────────────────────────────┘
       │
       ▼ Parliamentary Debate Pipeline (Layer 2)
┌──────────────────────────────────────────────────┐
│  Tier 0: Per-Domain Internal Debate (7 roles)     │
│  Tier 1: Domain Assessment Summaries (×16)        │
│  Tier 2: Cluster Synthesis (×3)                   │
│  Tier 3: Final Recommendation (×1)                │
└──────────────────────────────────────────────────┘
       │
       ▼
   Recommendation with Implementation Direction
```

---

## File Map

| File | Purpose | When to Read |
|------|---------|-------------|
| [.agents/workflows/Expert system.md](../.agents/workflows/Expert%20system.md) | Workflow orchestrator, layer routing, CDRS, memory | **First — your entry point** |
| [parliament/SYSTEM_MANIFESTO.md](SYSTEM_MANIFESTO.md) | System identity, principles, structure | Sets context for full parliament |
| [parliament/HANDLER_AGENT.md](HANDLER_AGENT.md) | Orchestration protocol, routing rules, modes | Your operating manual for Layer 2 |
| [domains/D01_strategy.md](../domains/D01_strategy.md) | Compressed: Business strategy, viability | Layer 1 — always loaded |
| [domains/D02_ecosystem.md](../domains/D02_ecosystem.md) | Compressed: Market analysis, competition | Layer 1 — always loaded |
| [domains/D03_infra_net.md](../domains/D03_infra_net.md) | Compressed: Infrastructure, networks, scalability | Layer 1 — always loaded |
| [domains/D04_cognition.md](../domains/D04_cognition.md) | Compressed: Cognition, psychology, cognitive load | Layer 1 — always loaded |
| [domains/D05_ai_systems.md](../domains/D05_ai_systems.md) | Compressed: AI systems, RAG, cost/latency | Layer 1 — always loaded |
| [domains/D06_design.md](../domains/D06_design.md) | Compressed: Product/visual design, accessibility | Layer 1 — always loaded |
| [domains/D07_oss_tools.md](../domains/D07_oss_tools.md) | Compressed: OSS, tooling, dependency health | Layer 1 — always loaded |
| [domains/D08_ux.md](../domains/D08_ux.md) | Compressed: Systems UX, information architecture | Layer 1 — always loaded |
| [domains/D09_logic_math.md](../domains/D09_logic_math.md) | Compressed: Logic, algorithms, complexity | Layer 1 — always loaded |
| [domains/D10_security.md](../domains/D10_security.md) | Compressed: Security, cryptography, trust | Layer 1 — always loaded |
| [parliament/Domain_11_Ops_Memory.md](Domain_11_Ops_Memory.md) | Full: Ops & Memory | Layer 1.5 (primary) or Layer 2 |
| [domains/D12_unconventional.md](../domains/D12_unconventional.md) | Compressed: Creative disruption, anti-slop | Layer 1 — always loaded |
| [domains/D13_docs.md](../domains/D13_docs.md) | Compressed: Documentation and onboarding | Layer 1 — always loaded |
| [domains/D14_root_logic.md](../domains/D14_root_logic.md) | Compressed: Root-cause reasoning and first principles | Layer 1 — always loaded |
| [domains/D15_creative.md](../domains/D15_creative.md) | Compressed: Creative engagement and trends | Layer 1 — always loaded |
| [domains/D16_data_systems.md](../domains/D16_data_systems.md) | Compressed: Data systems, dataflow, migrations | Layer 1 — always loaded |
| [domains/cross_domain_matrix.md](../domains/cross_domain_matrix.md) | CDRS calibration: 20 high-frequency domain pairs, Quadrant A/B/C conflict map, baseline CDRS by primary domain | Step 2b — read during CDRS computation |
| [parliament/Domain_01_Strategy.md](Domain_01_Strategy.md) | Full: Project Strategy & Viability | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_02_Ecosystem.md](Domain_02_Ecosystem.md) | Full: Ecosystem & Competitive Intelligence | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_03_Infra_Net.md](Domain_03_Infra_Net.md) | Full: Infrastructure & Networks | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_04_Cognition.md](Domain_04_Cognition.md) | Full: Developer Cognition & Psychology | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_05_AI_Systems.md](Domain_05_AI_Systems.md) | Full: AI Systems & Intelligence | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_06_Design.md](Domain_06_Design.md) | Full: Product Design | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_07_OSS_Tools.md](Domain_07_OSS_Tools.md) | Full: OSS & Tooling | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_08_UX.md](Domain_08_UX.md) | Full: Systems & UX | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_09_Logic_Math.md](Domain_09_Logic_Math.md) | Full: Logic & Complexity | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_10_Security.md](Domain_10_Security.md) | Full: Security & Trust | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_11_Ops_Memory.md](Domain_11_Ops_Memory.md) | Full: Ops & Memory | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_12_Unconventional.md](Domain_12_Unconventional.md) | Full: Unconventional Strategies | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_13_Docs.md](Domain_13_Docs.md) | Full: Documentation | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_14_Root_Logic.md](Domain_14_Root_Logic.md) | Full: Root Logic | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_15_Creative.md](Domain_15_Creative.md) | Full: Creative Direction | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_16_Data_Systems.md](Domain_16_Data_Systems.md) | Full: Data Systems | Layer 1.5 (primary) or Layer 2 |
| [memory/](../memory/) | Persistent memory (decisions, directives, user model) | Every session — loaded by orchestrator |
| [parliament/Custom-Agents/](Custom-Agents/) | Custom domain agents for project-specific expertise | On startup — check AGENT_REGISTRY.md |
| [parliament/Custom-Agents/AGENT_REGISTRY.md](Custom-Agents/AGENT_REGISTRY.md) | Master index of all custom agents | Before routing — load active agents |
| [parliament/Custom-Agents/CUSTOM_AGENT_TEMPLATE.md](Custom-Agents/CUSTOM_AGENT_TEMPLATE.md) | Template for creating new custom agents | When user needs project-specific expertise |
| [memory/initiative-compass.md](../memory/initiative-compass.md) | Active project compass | Every session — loaded by orchestrator |

---

## How to Route a Query

### Step 1: Classify the Query

Read the user's message and identify its primary concern. Use this classification matrix:

| Query Category | Primary Domain(s) | Secondary Domain(s) |
|---------------|-------------------|---------------------|
| **"Should we build this?"** | 1 (Strategy) | 2 (Ecosystem), 14 (Root Logic) |
| **"How should we architect this?"** | 3 (Infra & Networks) | 16 (Data Systems), 11 (Ops) |
| **"How should we design this?"** | 6 (Design), 8 (UX) | 4 (Cognition) |
| **"Is this code good?"** | 14 (Root Logic) | 9 (Logic & Complexity), 7 (OSS & Tooling) |
| **"Should we use AI for this?"** | 5 (AI Systems) | 9 (Logic & Complexity), 3 (Infra & Networks) |
| **"Is this secure?"** | 10 (Security) | 3 (Infra & Networks), 11 (Ops) |
| **"Is this too complex?"** | 9 (Logic & Complexity) | 14 (Root Logic), 7 (OSS & Tooling) |
| **"What algorithm should we use?"** | 9 (Logic & Complexity) | 16 (Data Systems), 5 (AI Systems) |
| **"How do we deploy this?"** | 11 (Ops) | 3 (Infra & Networks), 10 (Security) |
| **"How do users experience this?"** | 8 (UX) | 4 (Cognition), 6 (Design) |
| **"What's the market opportunity?"** | 2 (Ecosystem) | 1 (Strategy), 15 (Creative) |
| **"Give me something creative"** | 15 (Creative) | 12 (Unconventional), 6 (Design) |
| **"Full review / audit"** | ALL 16 + custom agents | — |
| **"I need [domain] expertise"** | Create custom agent | Use CUSTOM_AGENT_TEMPLATE.md |

### Step 2: Check for Custom Agents

If `parliament/Custom-Agents/AGENT_REGISTRY.md` contains active agents:
1. Include them in the PDRS scoring pool
2. Use the Extended PDRS formula (see HANDLER_AGENT.md → Custom Agent Discovery & Routing)
3. Custom agents with PDRS ≥ 0.7 become primary participants

### Step 3: Consult Domain Agents

For each relevant domain (core + custom):
1. Read the domain agent file (compressed for Layer 1/1.5, full for Layer 2)
2. Apply its Assessment Protocol to the query
3. Consider all perspectives (including the Wildcard)
4. Generate a Domain Assessment Summary (DAS)

### Step 4: Synthesize via Clusters

Group domain assessments by cluster:
- **Cluster S** (Strategy): Domains 1, 2, 5, 12, 14
- **Cluster T** (Technical): Domains 3, 7, 9, 10, 11, 16
- **Cluster H** (Human): Domains 4, 6, 8, 13, 15

Generate a Cluster Synthesis (CS) for each involved cluster.

### Step 5: Final Recommendation

Combine cluster syntheses into a single recommendation that includes:
1. **Recommendation** — What to do
2. **Consensus Level** — How much agreement across perspectives
3. **Key Dissents** — Important disagreements to note
4. **Implementation Direction** — Concrete next steps
5. **Risk Assessment** — What could go wrong

---

## Modes of Operation

The Handler Agent supports 4 modes. Select based on user need:

| Mode | When to Use | What It Does |
|------|-------------|-------------|
| **MODE A** | Default. User has a specific question. | Full parliamentary debate → recommendation |
| **MODE B** | User wants a broad assessment. | All-domain audit → health report |
| **MODE C** | System is learning about the project. | Discovery → populate Initiative Compass |
| **MODE D** | User is exploring, not deciding. | Exploration → options with trade-offs |

---

## Drop-In Deployment Guide

### For a New Project:

1. Copy the entire `Agentic-Expert-System/` folder into your project root
2. In your AI agent's system prompt or context, add:
   ```
   Read the file at [local_project_root]/Agentic-Expert-System/.agents/workflows/Expert system.md
   (Resolve all paths in this system relative to the Agentic-Expert-System/ folder)
   for instructions on how to use the multi-expert development orchestration system.
   ```
3. The system will bootstrap itself via MODE C on first interaction

### For Different Project Types:

The system auto-adapts domain emphasis based on project type. See **SYSTEM_MANIFESTO.md → Project Type Adaptability** for the full matrix.

### Context Window Optimization:

The two-layer architecture handles context window optimization automatically:

- **Layer 1 (~8K tokens):** All 16 compressed domains — designed to fit smaller context budgets
- **Layer 1.5 (~28K tokens):** Compressed + 1 full primary domain — default for non-trivial queries
- **Layer 2 (~50-75K tokens):** Full parliament — for major decisions on frontier models

The workflow orchestrator selects the appropriate layer based on the Cross-Domain Risk Score (CDRS).

---

## Memory Protocol

The memory system stores persistent information across sessions:

| File | Purpose |
|------|---------|
| `memory/decisions.csv` | Domain-tagged decisions (append-only, approval-gated) |
| `memory/decisions_meta.yaml` | Decision rationale + dissent + domain tags |
| `memory/directives.json` | Scoped standing orders from the user (approval-gated) |
| `memory/user_model_meta.yaml` | User model schema + summary |
| `memory/user_model_patterns.csv` | Observed decision/communication patterns |
| `memory/user_model_approvals.csv` | Approvals (what the user said yes to) |
| `memory/user_model_rejections.csv` | Rejections (what the user said no to) |
| `memory/changelog.md` | Append-only audit trail of all memory writes |
| `memory/session_context.md` | Multi-turn coherence checkpoints |
| `memory/initiative-compass.md` | Project's mission, values, goals, constraints |

**On first session:** Populate `memory/initiative-compass.md` via MODE C bootstrap.
**On subsequent sessions:** Read compass + user model + relevant decisions before responding.
**During normal operation:** Actively maintain the compass:
- Consult it at the start of every turn (mission/constraints/non-negotiables/quality bar minimum)
- Run recommendation alignment checks against it
- When the user introduces new objectives, constraints, values, or non-negotiables, propose a minimal compass update
- Apply compass updates only with explicit user confirmation and log updates to `memory/changelog.md`
- Periodically re-validate compass accuracy (single confirmation question when drift is suspected)
**When decisions are made:** Store in `memory/decisions.csv` (+ `memory/decisions_meta.yaml`) with domain tags — requires user confirmation.

---

## Anti-Patterns (What NOT to Do)

```
✗ DON'T load full parliament files for routine queries (use compressed domains)
✗ DON'T skip the Wildcard perspective in any domain (they prevent groupthink)
✗ DON'T present domain-internal debate to the user (synthesize first)
✗ DON'T ignore dissenting opinions (they contain risk signals)
✗ DON'T give recommendations without Implementation Direction
✗ DON'T assume project type — discover it via MODE C or context
✗ DON'T write to memory without user confirmation
✗ DON'T create a custom agent for something a core domain already handles well
✗ DON'T skip custom agent discovery — always check AGENT_REGISTRY.md on startup
```

---

## Custom Domain Agents

See **SYSTEM_MANIFESTO.md → Custom Agent Extension Framework** for when and how to create custom agents. See **HANDLER_AGENT.md → Custom Agent Discovery & Routing** for Extended PDRS scoring and routing integration.

**Quick reference:** Copy `parliament/Custom-Agents/CUSTOM_AGENT_TEMPLATE.md`, register in `parliament/Custom-Agents/AGENT_REGISTRY.md`. Custom agents have equal authority to core domains.

---

## Version

- **Protocol Version:** 2.0
- **Compatible with:** Agentic Expert System v2.0
- **Designed for:** Any AI model with file-reading capability and sufficient context window
