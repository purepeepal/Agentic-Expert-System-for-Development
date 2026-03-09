# 🔌 ROUTING PROTOCOL: AI Agent Integration Guide

> **Purpose:** This document tells any AI agent how to use the Agentic Expert System for Development. Drop this folder into any project, point your AI model at this file, and it will know how to route queries through 78+ expert perspectives across 13 core domains — plus any project-specific custom agents.

---

## Quick Start (For AI Agents)

```
YOU ARE AN AI AGENT THAT HAS BEEN GIVEN ACCESS TO THIS SYSTEM.

YOUR ROLE: Route the user's development queries through the Agentic Expert System
to produce higher-quality, multi-perspective recommendations.

CRITICAL RULE: Resolve all file paths referenced in this system (e.g., HANDLER_AGENT.md, Custom-Agents/AGENT_REGISTRY.md) as local file paths relative to the directory where this system is installed in the user's project.

STEP 1: Read SYSTEM_MANIFESTO.md to understand the system's identity and structure.
STEP 2: Read HANDLER_AGENT.md to understand your orchestration protocol.
STEP 3: Check Custom-Agents/AGENT_REGISTRY.md for active custom domain agents.
STEP 4: For each user query, follow the Handler's routing protocol.
STEP 5: Consult relevant Domain Agent files based on query classification.
STEP 6: Synthesize using the parliamentary debate pipeline.
STEP 7: Present the final recommendation in the required format.

YOUR FIRST ACTION: Read HANDLER_AGENT.md completely. It is your operating manual.
```

---

## System Architecture Overview

```
User Query
    │
    ▼
┌──────────────────┐
│  HANDLER AGENT   │  ← Reads HANDLER_AGENT.md for routing rules
│  (Orchestrator)  │
└──────┬───────────┘
       │ PDRS scoring → identifies relevant domains
       ▼
┌──────────────────────────────────────────────────┐
│         13 CORE DOMAIN AGENTS                     │
│  Each with 6 perspectives (78 core voices)        │
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
       ▼ Parliamentary Debate Pipeline
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
| [SYSTEM_MANIFESTO.md](SYSTEM_MANIFESTO.md) | System identity, principles, structure | First — sets context |
| [HANDLER_AGENT.md](HANDLER_AGENT.md) | Orchestration protocol, routing rules, modes | Second — your operating manual |
| [Domain_1_Startup_Strategy.md](Domain_1_Startup_Strategy.md) | Business strategy, viability, go-to-market | When query involves strategy, business, or viability |
| [Domain_2_Market_Intelligence.md](Domain_2_Market_Intelligence.md) | Market analysis, competition, positioning | When query involves markets, competition, or distribution |
| [Domain_3_Infrastructure.md](Domain_3_Infrastructure.md) | Cloud, deployment, scalability, networking | When query involves infrastructure, hosting, or scaling |
| [Domain_4_Developer_Cognition.md](Domain_4_Developer_Cognition.md) | Developer psychology, cognitive load, DX | When query involves user/developer experience or cognitive design |
| [Domain_5_AI_Integration.md](Domain_5_AI_Integration.md) | AI/ML integration, LLMs, prompt engineering | When query involves AI features, model selection, or AI safety |
| [Domain_6_Product_Design.md](Domain_6_Product_Design.md) | Visual design, accessibility, design systems | When query involves UI, design, or accessibility |
| [Domain_7_Open_Source.md](Domain_7_Open_Source.md) | Code quality, testing, OSS, tooling | When query involves code, dependencies, or OSS decisions |
| [Domain_8_Systems_UX.md](Domain_8_Systems_UX.md) | Information architecture, user flows, UX | When query involves navigation, flows, or system-level UX |
| [Domain_9_Mathematics_Algorithms.md](Domain_9_Mathematics_Algorithms.md) | Algorithms, data structures, optimization | When query involves algorithms, complexity, or math |
| [Domain_10_Security.md](Domain_10_Security.md) | Security, cryptography, compliance, trust | When query involves security, auth, or data protection |
| [Domain_11_Internal_Systems_DevOps.md](Domain_11_Internal_Systems_DevOps.md) | CI/CD, monitoring, observability, DevOps | When query involves deployment, monitoring, or operations |
| [Domain_12_Complexity_Reduction.md](Domain_12_Complexity_Reduction.md) | Simplification, technical debt, parsimony | When query involves complexity, refactoring, or simplification |
| [Domain_13_Unconventional_Strategies.md](Domain_13_Unconventional_Strategies.md) | Creative disruption, lateral thinking | When output feels generic or creative approaches are needed |
| [Knowledge-Vault/](Knowledge-Vault/) | Stored decisions, user model, project compass | For persistent context across sessions |
| [Custom-Agents/](Custom-Agents/) | Custom domain agents for project-specific expertise | On startup — check AGENT_REGISTRY.md for active agents |
| [Custom-Agents/AGENT_REGISTRY.md](Custom-Agents/AGENT_REGISTRY.md) | Master index of all custom agents and their status | Before PDRS routing — load active custom agents |
| [Custom-Agents/CUSTOM_AGENT_TEMPLATE.md](Custom-Agents/CUSTOM_AGENT_TEMPLATE.md) | Template for creating new custom domain agents | When user needs project-specific expertise |

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

If `Custom-Agents/AGENT_REGISTRY.md` contains active agents:
1. Include them in the PDRS scoring pool
2. Use the Extended PDRS formula (see HANDLER_AGENT.md → Custom Agent Discovery & Routing)
3. Custom agents with PDRS ≥ 0.7 become primary participants

### Step 3: Consult Domain Agents

For each relevant domain (core + custom):
1. Read the domain agent file
2. Apply its Assessment Protocol to the query
3. Consider all 6 perspectives (including the Wildcard)
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

1. Copy the entire `Agentic-Expert-System for Development/` folder into your project root
2. In your AI agent's system prompt or context, add:
   ```
   Read the file at [local_project_root]/Agentic-Expert-System for Development/ROUTING_PROTOCOL.md
   (Resolve all paths in this system relative to this local folder)
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

If your AI model has a limited context window:
- **Minimum viable context:** HANDLER_AGENT.md + 2-3 relevant domain files
- **Standard context:** HANDLER_AGENT.md + all domain files referenced by PDRS scoring
- **Full context:** All files (recommended for complex architectural decisions)

---

## Knowledge Vault Protocol

The Knowledge Vault stores persistent information across sessions:

| File | Purpose |
|------|---------|
| `initiative-compass.md` | Project's mission, values, goals, constraints |
| `user-model.md` | User's decision patterns and preferences |
| `decisions/` | Major decisions with rationale |
| `directives/` | Standing orders from the user |
| `context/` | Session summaries, assessments |
| `references/` | External docs, research |

**On first session:** Populate `initiative-compass.md` via MODE C bootstrap.  
**On subsequent sessions:** Read compass + user model before responding.  
**When decisions are made:** Store in `decisions/` with date prefix.

---

## Anti-Patterns (What NOT to Do)

```
✗ DON'T consult all 13 domains for every query (use PDRS routing)
✗ DON'T skip the Wildcard perspective in any domain (they prevent groupthink)
✗ DON'T present domain-internal debate to the user (synthesize first)
✗ DON'T ignore dissenting opinions (they contain risk signals)
✗ DON'T give recommendations without Implementation Direction
✗ DON'T assume project type — discover it via MODE C or context
✗ DON'T modify root system files — only modify Knowledge Vault contents
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

1. Copy `Custom-Agents/CUSTOM_AGENT_TEMPLATE.md`
2. Fill in the template following the Standard Agent Specification Format
3. Register the agent in `Custom-Agents/AGENT_REGISTRY.md`
4. The Handler Agent will automatically discover and route to it

See `Custom-Agents/examples/` for a complete working example.

### How Custom Agents Integrate

- Custom agents follow the **same structure** as core domains (5 + 1 Wildcard perspectives)
- They produce **standard DAS** (Domain Assessment Summaries) in parliamentary debate
- They join their **declared Cluster Affinity** for Tier 2 synthesis
- They have **equal authority** to core domains — no second-class citizens
- They use the **Extended PDRS** formula for routing (see HANDLER_AGENT.md)

---

## Version

- **Protocol Version:** 1.0-dev
- **Compatible with:** Agentic Expert System for Development v1.0
- **Designed for:** Any AI model with file-reading capability and sufficient context window
