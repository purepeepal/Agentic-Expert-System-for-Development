# 🔌 ROUTING PROTOCOL: AI Agent Integration Guide

> **Purpose:** This document tells any AI agent how to use the Agentic Expert System. Drop this folder into any project, point your AI model at this file, and it will know how to route queries through 78+ expert perspectives across 13 core domains — plus any project-specific custom agents.

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
│  13 compressed files (~500 tokens each, ~8K total)│
│  Handles routine queries on any model             │
├──────────────────────────────────────────────────┤
│  LAYER 1.5: COMPRESSED + PRIMARY FULL DOMAIN      │
│  13 compressed + 1 full domain file (~28K total)  │
│  Default for non-trivial queries (CDRS 3-5)       │
├──────────────────────────────────────────────────┤
│  LAYER 2: FULL PARLIAMENT (parliament/)           │
│  All full domain files + HANDLER_AGENT.md         │
│  78+ voices for major decisions (CDRS ≥6)         │
│                                                   │
│  Cluster S (Strategy):     1, 2, 5, 13           │
│  Cluster T (Technical):    3, 7, 9, 10, 11       │
│  Cluster H (Human):        4, 6, 8, 12           │
├──────────────────────────────────────────────────┤
│         + CUSTOM DOMAIN AGENTS (optional)         │
│  Project-specific experts (C1, C2, C3...)         │
│  Each joins its declared Cluster Affinity         │
│  Created from Custom-Agents/CUSTOM_AGENT_TEMPLATE │
└──────────────────────────────────────────────────┘
       │
       ▼ Parliamentary Debate Pipeline (Layer 2)
┌──────────────────────────────────────────────────┐
│  Tier 0: Per-Domain Internal Debate (6 voices)    │
│  Tier 1: Domain Assessment Summaries (×13)        │
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
| [domains/D03_infrastructure.md](../domains/D03_infrastructure.md) | Compressed: Cloud, deployment, scalability | Layer 1 — always loaded |
| [domains/D04_cognition.md](../domains/D04_cognition.md) | Compressed: Developer psychology, cognitive load | Layer 1 — always loaded |
| [domains/D05_ai_integration.md](../domains/D05_ai_integration.md) | Compressed: AI/ML integration, LLMs | Layer 1 — always loaded |
| [domains/D06_product_design.md](../domains/D06_product_design.md) | Compressed: Visual design, accessibility | Layer 1 — always loaded |
| [domains/D07_open_source.md](../domains/D07_open_source.md) | Compressed: Code quality, OSS, tooling | Layer 1 — always loaded |
| [domains/D08_systems_ux.md](../domains/D08_systems_ux.md) | Compressed: Information architecture, UX | Layer 1 — always loaded |
| [domains/D09_mathematics.md](../domains/D09_mathematics.md) | Compressed: Algorithms, data structures | Layer 1 — always loaded |
| [domains/D10_security.md](../domains/D10_security.md) | Compressed: Security, cryptography, trust | Layer 1 — always loaded |
| [domains/D11_devops.md](../domains/D11_devops.md) | Compressed: CI/CD, monitoring, DevOps | Layer 1 — always loaded |
| [domains/D12_complexity.md](../domains/D12_complexity.md) | Compressed: Simplification, technical debt | Layer 1 — always loaded |
| [domains/D13_unconventional.md](../domains/D13_unconventional.md) | Compressed: Creative disruption, anti-slop | Layer 1 — always loaded |
| [parliament/Domain_01_Strategy.md](Domain_01_Strategy.md) | Full: Project Strategy & Viability | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_02_Ecosystem.md](Domain_02_Ecosystem.md) | Full: Ecosystem & Competitive Intelligence | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_03_Infrastructure.md](Domain_03_Infrastructure.md) | Full: Infrastructure & Architecture | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_04_Cognition.md](Domain_04_Cognition.md) | Full: Developer Cognition & Psychology | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_05_AI_Integration.md](Domain_05_AI_Integration.md) | Full: AI Integration & Intelligent Tooling | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_06_Product_Design.md](Domain_06_Product_Design.md) | Full: Product Design | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_07_Open_Source.md](Domain_07_Open_Source.md) | Full: Open Source & Industry Tooling | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_08_Systems_UX.md](Domain_08_Systems_UX.md) | Full: Systems & UX Design | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_09_Mathematics.md](Domain_09_Mathematics.md) | Full: Mathematics & Algorithms | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_10_Security.md](Domain_10_Security.md) | Full: Security & Trust | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_11_DevOps.md](Domain_11_DevOps.md) | Full: Internal Systems & DevOps | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_12_Complexity.md](Domain_12_Complexity.md) | Full: Complexity Reduction | Layer 1.5 (primary) or Layer 2 |
| [parliament/Domain_13_Unconventional.md](Domain_13_Unconventional.md) | Full: Unconventional Strategies | Layer 1.5 (primary) or Layer 2 |
| [memory/](../memory/) | Persistent memory (decisions, directives, user model) | Every session — loaded by orchestrator |
| [parliament/Custom-Agents/](Custom-Agents/) | Custom domain agents for project-specific expertise | On startup — check AGENT_REGISTRY.md |
| [parliament/Custom-Agents/AGENT_REGISTRY.md](Custom-Agents/AGENT_REGISTRY.md) | Master index of all custom agents | Before routing — load active agents |
| [parliament/Custom-Agents/CUSTOM_AGENT_TEMPLATE.md](Custom-Agents/CUSTOM_AGENT_TEMPLATE.md) | Template for creating new custom agents | When user needs project-specific expertise |
| [parliament/Knowledge-Vault/](Knowledge-Vault/) | Parliament reference templates | For full parliament sessions |
| [initiative-compass.md](../initiative-compass.md) | Active project compass | Every session — loaded by orchestrator |

---

## How to Route a Query

### Step 1: Classify the Query

Read the user's message and identify its primary concern. Use this classification matrix:

| Query Category | Primary Domain(s) | Secondary Domain(s) |
|---------------|-------------------|---------------------|
| **"Should we build this?"** | 1 (Strategy) | 2 (Market), 12 (Complexity) |
| **"How should we architect this?"** | 3 (Infrastructure) | 7 (Code), 11 (DevOps) |
| **"How should we design this?"** | 6 (Design), 8 (UX) | 4 (Cognition) |
| **"Is this code good?"** | 7 (Code Quality) | 9 (Algorithms), 12 (Complexity) |
| **"Should we use AI for this?"** | 5 (AI) | 9 (Algorithms), 3 (Infrastructure) |
| **"Is this secure?"** | 10 (Security) | 3 (Infrastructure), 11 (DevOps) |
| **"Is this too complex?"** | 12 (Complexity) | 7 (Code), 3 (Infrastructure) |
| **"What algorithm should we use?"** | 9 (Algorithms) | 5 (AI), 3 (Infrastructure) |
| **"How do we deploy this?"** | 11 (DevOps) | 3 (Infrastructure), 10 (Security) |
| **"How do users experience this?"** | 4 (Cognition), 8 (UX) | 6 (Design) |
| **"What's the market opportunity?"** | 2 (Market) | 1 (Strategy), 13 (Creative) |
| **"Give me something creative"** | 13 (Unconventional) | All domains as needed |
| **"Full review / audit"** | ALL 13 + custom agents | — |
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
- **Cluster S** (Strategy): Domains 1, 2, 5, 13
- **Cluster T** (Technical): Domains 3, 7, 9, 10, 11
- **Cluster H** (Human): Domains 4, 6, 8, 12

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

The system auto-adapts. See SYSTEM_MANIFESTO.md for the Project Type Adaptability matrix. Examples:
- **Web App** → Emphasizes Domains 3, 6, 7, 8, 10
- **CLI Tool** → Emphasizes Domains 4, 7, 9, 12
- **AI Product** → Emphasizes Domains 5, 9, 3, 10
- **Open Source Library** → Emphasizes Domains 7, 4, 12, 9
- **Startup MVP** → Emphasizes Domains 1, 2, 12, 7

### Context Window Optimization:

The two-layer architecture handles context window optimization automatically:

- **Layer 1 (~8K tokens):** All 13 compressed domains — works on any model including 7B parameters
- **Layer 1.5 (~28K tokens):** Compressed + 1 full primary domain — default for non-trivial queries
- **Layer 2 (~50-75K tokens):** Full parliament — for major decisions on frontier models

The workflow orchestrator selects the appropriate layer based on the Cross-Domain Risk Score (CDRS).

---

## Memory Protocol

The memory system stores persistent information across sessions:

| File | Purpose |
|------|---------|
| `memory/decisions.json` | Domain-tagged decisions with rationale |
| `memory/directives.json` | Scoped standing orders from the user |
| `memory/user_model.json` | User's decision patterns and preferences |
| `memory/changelog.md` | Append-only audit trail of all memory writes |
| `memory/session_context.md` | Multi-turn coherence checkpoints |
| `initiative-compass.md` | Project's mission, values, goals, constraints |

**On first session:** Populate `initiative-compass.md` via MODE C bootstrap.
**On subsequent sessions:** Read compass + user model + relevant decisions before responding.
**When decisions are made:** Store in `decisions.json` with domain tags — requires user confirmation.

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

The 13 core domains cover universal development concerns. When your project needs domain-specific expertise that the core system doesn't specialize in, you create **custom domain agents**.

### When to Create a Custom Agent

| Project Type | Suggested Custom Agent |
|-------------|----------------------|
| EdTech / e-learning | Learning Science & Pedagogy |
| Healthcare | Clinical Data & Regulatory Compliance |
| Fintech | Financial Regulation & Risk Modeling |
| Gaming | Game Design & Player Psychology |
| E-commerce | Commerce & Conversion Optimization |
| IoT / Embedded | Hardware-Software Interface |
| Legal Tech | Legal Reasoning & Compliance |
| Social Platform | Community Dynamics & Trust/Safety |

### How to Create One

1. Copy `parliament/Custom-Agents/CUSTOM_AGENT_TEMPLATE.md`
2. Fill in the template following the Standard Agent Specification Format
3. Register the agent in `parliament/Custom-Agents/AGENT_REGISTRY.md`
4. The Handler Agent will automatically discover and route to it

### How Custom Agents Integrate

- Custom agents follow the **same structure** as core domains (5 + 1 Wildcard perspectives)
- They produce **standard DAS** (Domain Assessment Summaries) in parliamentary debate
- They join their **declared Cluster Affinity** for Tier 2 synthesis
- They have **equal authority** to core domains — no second-class citizens
- They use the **Extended PDRS** formula for routing (see HANDLER_AGENT.md)

---

## Version

- **Protocol Version:** 2.0
- **Compatible with:** Agentic Expert System v2.0
- **Designed for:** Any AI model with file-reading capability and sufficient context window
