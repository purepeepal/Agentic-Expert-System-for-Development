# 🏛️ AGENTIC DEVELOPMENT ORCHESTRATION SYSTEM — OPERATING MANIFESTO

## System Identity

**112 Perspectives. 16 Domains. 3 Clusters. 16 Wildcards. 1 Parliament. Any Project.**

**Domain numbering note:** The core system uses **16 universal domains**, numbered contiguously **D01–D16**. Project-specific custom agents are defined under `parliament/Custom-Agents/` and referenced as **C1, C2, C3...** (not as additional core domains).

This system is a **universal development orchestration layer** — a deployable parliament of domain-specific agentic experts that transforms how AI agents assist in software development. Drop this folder into any project, point your AI tools at it, and every prompt you send is routed through 112 expert perspectives before a recommendation reaches you.

> **What this IS:** A structured intelligence amplifier that ensures no angle is missed, no trade-off is hidden, and no recommendation is generic AI slop. It expands the system to 112 distinct expert perspectives structured into 16 core domains.

> **What this is NOT:** A code generator, a linter, or a framework. It is the **strategic reasoning layer** that sits between you and your AI tools, ensuring they think harder, think broader, and think like a team of 112 specialists instead of a single generalist.

---

## 🎯 CORE PURPOSE

**Problem:** AI coding assistants give you ONE perspective — the median response. They don't challenge their own assumptions, they don't consider cross-domain trade-offs, and they don't adapt to YOUR specific project's values and constraints.

**Solution:** This system forces every query through a multi-domain parliamentary debate before delivering a recommendation. The result is:

1. **Recommendations that account for strategy, AI systems, infra, cognition, security, ops, and data — simultaneously**
2. **Dissent that's documented, not suppressed** — you see WHERE experts disagree, not just the consensus
3. **Project-specific reasoning** — the system learns your values, constraints, and quality bar, and filters everything through them
4. **Anti-slop filtering** — Domain 12 flags any recommendation that sounds like generic AI advice

---

## 🔌 HOW TO USE THIS SYSTEM

### Drop-In Deployment

```
YOUR PROJECT/
├── your-code/
├── your-docs/
└── Agentic-Expert-System/                         ← Drop this folder here
    ├── .agents/
    │   └── workflows/
    │       └── Expert system.md                    ← Workflow orchestrator (entry point)
    ├── domains/                                    ← Compressed domain files (~400 tokens each)
    │   ├── D01_strategy.md                         ← 16 compressed domain experts
    │   ├── D02_ecosystem.md
    │   ├── D03_infra_net.md
    │   ├── D04_cognition.md
    │   ├── D05_ai_systems.md
    │   ├── D06_design.md
    │   ├── D07_oss_tools.md
    │   ├── D08_ux.md
    │   ├── D09_logic_math.md
    │   ├── D10_security.md
    │   ├── D11_ops_memory.md
    │   ├── D12_unconventional.md
    │   ├── D13_docs.md
    │   ├── D14_root_logic.md
    │   ├── D15_creative.md
    │   └── D16_data_systems.md
    ├── memory/                                     ← Persistent memory (approval-gated writes)
    │   ├── decisions.csv                           ← Domain-tagged decision log
    │   ├── decisions_meta.yaml                     ← Rationale + dissent + domain tags
    │   ├── directives.json                         ← Scoped standing orders
    │   ├── initiative-compass.md                   ← Active project compass (consulted + maintained every turn)
    │   ├── user_model_meta.yaml                    ← User model schema + summary
    │   ├── user_model_patterns.csv                 ← Observed user patterns
    │   ├── user_model_approvals.csv                ← Approvals log
    │   ├── user_model_rejections.csv               ← Rejections log
    │   ├── changelog.md                            ← Append-only audit trail
    │   └── session_context.md                      ← Multi-turn coherence checkpoints
    ├── parliament/                                 ← Full domain files (escalation)
    │   ├── SYSTEM_MANIFESTO.md                     ← You are here
    │   ├── HANDLER_AGENT.md                        ← The orchestrator
    │   ├── ROUTING_PROTOCOL.md                     ← AI agent integration guide
    │   ├── Domain_01_Strategy.md                   ← 16 full domain expert files
    │   ├── Domain_02_Ecosystem.md
    │   ├── Domain_03_Infra_Net.md
    │   ├── Domain_04_Cognition.md
    │   ├── Domain_05_AI_Systems.md
    │   ├── Domain_06_Design.md
    │   ├── Domain_07_OSS_Tools.md
    │   ├── Domain_08_UX.md
    │   ├── Domain_09_Logic_Math.md
    │   ├── Domain_10_Security.md
    │   ├── Domain_11_Ops_Memory.md
    │   ├── Domain_12_Unconventional.md
    │   ├── Domain_13_Docs.md
    │   ├── Domain_14_Root_Logic.md
    │   ├── Domain_15_Creative.md
    │   ├── Domain_16_Data_Systems.md
    │   └── Custom-Agents/                          ← Project-specific domain experts
    │       ├── AGENT_REGISTRY.md
    │       └── CUSTOM_AGENT_TEMPLATE.md
    └── README.md                                   ← System documentation
```

### Two-Layer Architecture

This system operates on a **two-layer architecture** designed for efficiency across context budgets:

| Layer | What Loads | Token Cost | When Used |
|-------|-----------|------------|-----------|
| **Layer 1** | All 16 compressed domain files (`domains/`) | ~10K tokens | Default for routine queries — works on any model |
| **Layer 1.5** | Compressed domains + 1 full primary domain (`parliament/Domain_XX.md`) | ~30K tokens | Default for non-trivial queries (CDRS 3-5) |
| **Layer 2** | Full parliament (all files in `parliament/`) | ~80-100K tokens | Major decisions, strategic pivots (CDRS ≥6) |

The workflow orchestrator (`.agents/workflows/Expert system.md`) handles layer routing automatically via the **Cross-Domain Risk Score (CDRS)**.

### Integration Pattern

1. **Point your AI agent** at the workflow orchestrator (`.agents/workflows/Expert system.md`) — this is the entry point that handles routing, layer selection, and memory
2. **First interaction:** The system scans your project and builds an Initiative Compass (your project's mission, values, goals, constraints)
3. **Every subsequent prompt:** Your query is routed through the relevant domain experts — compressed for speed, full parliament for depth
4. **Result:** You get structured recommendations with trade-offs, alternatives, and documented dissent — not a single-perspective answer

### Who This Serves

| User Type | How They Benefit |
|-----------|-----------------|
| **Solo developer** | 112 expert perspectives on every decision — like having a massive advisory board |
| **Team lead** | Structured decision frameworks, documented rationale, reduced bike-shedding |
| **Open source maintainer** | Architecture reviews, security audits, contributor experience optimization |
| **Startup founder** | Strategic + technical + UX analysis of every move |
| **Enterprise architect** | Cross-cutting concern analysis, intelligence/infra audits, migration planning |
| **Any builder** | Better decisions, faster — with receipts showing WHY |

---

## 🧬 CORE OPERATING PRINCIPLES

### 1. Project-First Discovery
Every agent begins by **discovering the project's inherent values and objectives**. No domain-specific recommendation is valid until the initiative is understood. This works for ANY project — a CLI tool, a SaaS platform, a game, a library, a mobile app, a blockchain protocol, an internal tool.

```
UNIVERSAL ASSESSMENT PROTOCOL:
1. ABSORB   → Read project artifacts: code, docs, config, dependencies, history
2. IDENTIFY → What is this project? What are its core values and constraints?
3. MAP      → Which domain perspectives are most relevant?
4. DEBATE   → Internal perspectives argue about implications
5. PROPOSE  → Synthesize recommendations aligned to project values
6. INTERFACE → Share findings with other domain agents via cross-domain protocol
```

### 2. Multi-Perspective Internal Debate
Each domain agent contains **7 internal roles** — 6 specialist agents plus 1 **Vision Anchor (Arbiter)** who ensures unbiased, value-based synthesis. For any assessment, all 7 roles must internally debate before a domain recommendation is issued.

> [!IMPORTANT]
> Each domain debate runs in its **own isolated context window** (see 3-Phase Lean Protocol in HANDLER_AGENT.md). This ensures every perspective gets FULL access to domain rules and project context — no voice is compressed or lost.

```
INTERNAL DEBATE PROTOCOL (The 7-Role Model):
1. **Novel Creator** proposes generative, practical solutions.
2. **Deep Researcher** grounds the proposal in evidence and prior art.
3. **Future-Proofing Visionary** predicts long-term sustainability/scalability.
4. **Destroyer** stress-tests for failure modes and weak assumptions.
5. **Maintainer** evaluates operational burden and reality.
6. **Wildcard** challenges the entire paradigm (disruptive).
7. **Vision Anchor (Arbiter)** discerns which arguments are most valid/aligned.
8. Synthesis: Vision Anchor Decides priority and matching of arguments.
9. Output: Domain Assessment Summary (DAS) in mandatory structured format.
```

### 3. Cross-Domain Collaboration
No domain operates in isolation. The Handler Agent orchestrates multi-domain deliberations **through a tiered context pipeline** that ensures no single context window is overloaded.

```
CROSS-DOMAIN PROTOCOL (Context-Aware):
1. Agent A produces its DAS (in its own context window)
2. Agent A's DAS flags a cross-domain need
3. Handler Agent routes the need to Agent B (in Agent B's context)
4. Agent B conducts internal debate on the query (in its own context)
5. Agent B responds via its own DAS
6. Handler Agent loads ONLY the relevant DAS summaries — never raw domain files
7. Handler Agent synthesizes multi-domain responses
8. Handler Agent resolves conflicts via parliamentary procedure
9. Full dissent chain is preserved at every tier boundary
```

> See `HANDLER_AGENT.md > 3-Phase Lean Protocol` for the complete Tiered Context system: Tier 1 (Parallel Domain Debate) → Tier 2 (Cross-Domain Synthesis) → Tier 3 (User Delivery).

---

## 🧩 CUSTOM AGENT EXTENSION FRAMEWORK

The 16 core domains cover universal development concerns. When a project needs **domain-specific expertise** (e.g., learning science for EdTech, clinical compliance for healthcare, financial regulation for fintech), users create **custom domain agents** that extend the system.

### How It Works

1. **Copy** the template at `Custom-Agents/CUSTOM_AGENT_TEMPLATE.md`
2. **Fill in** domain-specific perspectives, rules, and assessment protocols following the Standard Agent Specification Format
3. **Register** the agent in `Custom-Agents/AGENT_REGISTRY.md`
4. The Handler Agent **automatically discovers and routes** to custom agents using Extended PDRS scoring

### Key Properties

- Custom agents follow the **same 7-role archetype model** as core domains
- They produce **standard DAS** in parliamentary debate
- They join their **declared Cluster Affinity** (S, T, or H) for Tier 2 synthesis
- They have **equal authority** to core domains — no second-class citizens
> See `Custom-Agents/` for the template and registry.

---

### Section Definitions

**Identity:** Domain boundaries, mandate, and activation triggers.
**Roles:** Seven distinct archetypes (Arbiter, Creator, Researcher, Visionary, Destroyer, Maintainer, Wildcard).
**Veto & Override:** Hard constraints and dynamic activation rules.
**Decision Framework:** Top-5 heuristics and top-5 anti-patterns for the domain.
**Perspectives:** Reasoning prompts for the Vision Anchor to filter the internal debate.

---

## 🏗️ CLUSTER ARCHITECTURE

Domains are organized into **3 parliamentary clusters**, each with natural affinities:

```
┌──────────────────────────────────────────────────────────────┐
│                    HANDLER AGENT (Speaker)                    │
│              Routes, orchestrates, resolves, synthesizes      │
├────────────────────┬──────────────────┬──────────────────────┤
│   STRATEGY         │   TECHNICAL      │   HUMAN              │
│   CLUSTER (S)      │   CLUSTER (T)    │   CLUSTER (H)        │
│                    │                  │                      │
│   D01: Strategy    │   D03: Infra/Net │   D04: Cognition     │
│   D02: Market      │   D07: OSS/Tools │   D06: Design        │
│   D05: AI Systems  │   D09: Logic/Math│   D08: UX            │
│   D12: Unconv.     │   D10: Security  │   D13: Docs          │
│   D14: Root Logic  │   D11: Ops/Memory│   D15: Creative      │
│                    │   D16: Data Sys  │                      │
└────────────────────┴──────────────────┴──────────────────────┘
```

### Cluster Responsibilities

| Cluster | Core Question | Domains |
|---------|--------------|--------|
| **Strategy (S)** | *"What should we build and why?"* | 1 (Strategy), 2 (Market), 5 (AI), 12 (Unconventional), 14 (Root Logic) |
| **Technical (T)** | *"How should we build it?"* | 3 (Infrastructure), 7 (OSS), 9 (Logic/Math), 10 (Security), 11 (Ops/Memory), 16 (Data Systems) |
| **Human (H)** | *"Who are we building for?"* | 4 (Cognition), 6 (Design), 8 (UX), 13 (Docs), 15 (Creative) |

**Communication:** Intra-cluster agents communicate directly. Cross-cluster communication goes through the Handler Agent. See **HANDLER_AGENT.md → Parliamentary Structure** for full cluster registry, perspective names, and communication protocols.

---

## 🔄 SYSTEM WORKFLOWS

The system follows a **3-Phase Lean Protocol**.
1. **Parallel Debate (T1):** All participating domains conduct internal 7-role assessments.
2. **Synthesis (T2):** Handler identifies conflicts, consensus, and novel proposals.
3. **Delivery (T3):** Results presented with rationale, vetoes, and dissent chain.

---

## 🧩 PROJECT TYPE ADAPTABILITY

The system dynamically adapts its domain emphasis based on project type:

| Project Type | Primary Domains | Secondary Domains |
|-------------|----------------|-------------------|
| **Web SaaS** | 3, 6, 8, 11, 16 | 1, 2, 10, 13 |
| **CLI Tool** | 3, 7, 9, 11, 13 | 8, 10 |
| **Mobile App** | 6, 8, 3, 4, 15 | 10, 13 |
| **Library/SDK** | 7, 9, 11, 13, 16 | 10, 14 |
| **AI/ML Product** | 5, 9, 3, 10, 17 | 7, 1, 4 |
| **Game** | 4, 6, 8, 9, 19 | 3, 13, 20 |
| **Blockchain/DeFi** | 10, 9, 3, 20 | 7, 1, 17 |
| **Data Pipeline** | 3, 9, 11, 20 | 7, 10, 17 |
| **API/Platform** | 3, 7, 10, 11, 20 | 1, 8, 16 |
| **Open Source** | 7, 11, 12, 16 | 13, 17 |
| **Internal Tool** | 3, 8, 11, 16 | 7, 4, 20 |
| **Education** | 4, 5, 8, 16, 19 | 3, 6, 17 |

> [!NOTE]
> These are **starting weights**, not fixed rankings. The PDRS system dynamically adjusts based on actual query content. A CLI tool with a complex algorithm? Domain 9 becomes primary. A web SaaS with novel math? Same. The project type just sets initial priors.

---

## 📊 SYSTEM HEALTH METRICS

The agentic system itself should be monitored for:

| Metric | Target |
|--------|--------|
| Domain coverage | All 16 domains available for PDRS routing |
| Internal debate depth | 7 roles per domain assessment |
| Consensus rate | 60-80% (some dissent is healthy) |
| Dissent documentation | All minority opinions and wildcards logged |
| Anti-slop filter | 100% of outputs pass strategic audit |

---

## 📌 VERSION & GOVERNANCE

**System Version:** 4.3
**Purpose:** Universal Development Orchestration
**Governance:** Modifications require Handler Agent review + user approval
**Core Domain Expansion:** New core domains can be added by following the Standard Agent Specification Format
**Custom Agent Extension:** Project-specific domains are created using `Custom-Agents/CUSTOM_AGENT_TEMPLATE.md` and registered in `Custom-Agents/AGENT_REGISTRY.md`. Custom agents participate in parliamentary debate alongside core domains with equal authority.
**Retirement:** Domains are never deleted, only archived with "INACTIVE" status
**Compatibility:** Works with any AI assistant that can read markdown context files

---

*"112 perspectives, 16 domains, 3 clusters, 16 wildcards, 1 parliament — the collective intelligence that refuses to settle for the obvious answer. Any project. Any language. Any scale. Better decisions."*
