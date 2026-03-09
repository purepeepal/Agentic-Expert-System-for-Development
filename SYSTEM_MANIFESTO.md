# 🏛️ AGENTIC DEVELOPMENT ORCHESTRATION SYSTEM — OPERATING MANIFESTO

## System Identity

**78+ Perspectives. 13+ Domains. 3 Clusters. 13+ Wildcards. 1 Parliament. Any Project.**

This system is a **universal development orchestration layer** — a deployable parliament of domain-specific agentic experts that transforms how AI agents assist in software development. Drop this folder into any project, point your AI tools at it, and every prompt you send is routed through 78 expert perspectives before a recommendation reaches you.

> **What this IS:** A structured intelligence amplifier that ensures no angle is missed, no trade-off is hidden, and no recommendation is generic AI slop.

> **What this is NOT:** A code generator, a linter, or a framework. It is the **strategic reasoning layer** that sits between you and your AI tools, ensuring they think harder, think broader, and think like a team of 78 specialists instead of a single generalist.

---

## 🎯 CORE PURPOSE

**Problem:** AI coding assistants give you ONE perspective — the median response. They don't challenge their own assumptions, they don't consider cross-domain trade-offs, and they don't adapt to YOUR specific project's values and constraints.

**Solution:** This system forces every query through a multi-domain parliamentary debate before delivering a recommendation. The result is:

1. **Recommendations that account for architecture, security, UX, strategy, complexity, and unconventional alternatives — simultaneously**
2. **Dissent that's documented, not suppressed** — you see WHERE experts disagree, not just the consensus
3. **Project-specific reasoning** — the system learns your values, constraints, and quality bar, and filters everything through them
4. **Anti-slop filtering** — Domain 13 flags any recommendation that sounds like generic AI advice

---

## 🔌 HOW TO USE THIS SYSTEM

### Drop-In Deployment

```
YOUR PROJECT/
├── your-code/
├── your-docs/
├── Agentic-Expert-System for Development/    ← Drop this folder here
│   ├── SYSTEM_MANIFESTO.md                    ← You are here
│   ├── HANDLER_AGENT.md                       ← The orchestrator
│   ├── ROUTING_PROTOCOL.md                    ← How to connect AI agents
│   ├── Domain_1_Project_Strategy.md           ← 13 domain experts
│   ├── Domain_2_Ecosystem_Intelligence.md
│   ├── Domain_3_Infrastructure.md
│   ├── Domain_4_Developer_Cognition.md
│   ├── Domain_5_AI_Integration.md
│   ├── Domain_6_Product_Design.md
│   ├── Domain_7_Open_Source.md
│   ├── Domain_8_Systems_UX.md
│   ├── Domain_9_Mathematics_Algorithms.md
│   ├── Domain_10_Security.md
│   ├── Domain_11_Internal_Systems_DevOps.md
│   ├── Domain_12_Complexity_Reduction.md
│   ├── Domain_13_Unconventional_Strategies.md
│   ├── Knowledge-Vault/                       ← Persistent project memory
│   │   ├── VAULT_INDEX.md
│   │   ├── initiative-compass.md
│   │   ├── user-model.md
│   │   ├── decisions/
│   │   ├── directives/
│   │   ├── context/
│   │   └── references/
│   └── Custom-Agents/                         ← Project-specific domain experts
│       ├── AGENT_REGISTRY.md                  ← Index of active custom agents
│       ├── CUSTOM_AGENT_TEMPLATE.md           ← Template for creating new agents
│       └── examples/                          ← Example custom agents
│           └── Custom_C1_EdTech_Learning_Science.md
```

### Integration Pattern

1. **Point your AI agent** at the `ROUTING_PROTOCOL.md` file — this tells any AI model how to use the system. (Instruct the AI to resolve all file paths as local paths relative to the project directory)
2. **First interaction:** The system scans your project and builds an Initiative Compass (your project's mission, values, goals, constraints)
3. **Every subsequent prompt:** Your query is routed through the relevant domain experts via the Handler Agent
4. **Result:** You get structured recommendations with trade-offs, alternatives, and documented dissent — not a single-perspective answer

### Who This Serves

| User Type | How They Benefit |
|-----------|-----------------|
| **Solo developer** | 78 expert perspectives on every decision — like having a massive advisory board |
| **Team lead** | Structured decision frameworks, documented rationale, reduced bike-shedding |
| **Open source maintainer** | Architecture reviews, security audits, contributor experience optimization |
| **Startup founder** | Strategic + technical + UX analysis of every move |
| **Enterprise architect** | Cross-cutting concern analysis, complexity audits, migration planning |
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
Each domain agent contains 6 internal perspectives — 5 domain experts plus 1 **Wildcard Provocateur** whose job is to prevent generic thinking. For any assessment question, all 6 perspectives must weigh in before a domain recommendation is issued. The Wildcard has **1.5x vote weight** and a mandate to propose at least one unconventional alternative per debate.

> [!IMPORTANT]
> Each domain debate runs in its **own isolated context window** (see Context Window Pipeline in HANDLER_AGENT.md). This means every perspective gets FULL access to domain rules and project context — no voice is compressed or lost during internal debate.

```
INTERNAL DEBATE PROTOCOL:
1. Each of the 5 domain perspectives states its position
2. Opposing perspectives challenge assumptions
3. The Wildcard Provocateur presents the unconventional alternative
4. Other perspectives must DEFEND their position against the Wildcard
5. Evidence and reasoning are compared
6. Consensus or documented dissent is produced
7. If consensus is >90%, the Wildcard MUST present a stronger challenge
8. The domain agent speaks with one voice externally,
   but its internal debate (including Wildcard provocations) is logged
9. Output: Domain Assessment Summary (DAS) in mandatory structured format
   - Every perspective's vote is a NAMED, ATTRIBUTED entry
   - Dissent and Wildcard provocation fields are MANDATORY
   - This DAS is the ONLY artifact passed to the next tier
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

> See `HANDLER_AGENT.md > Context Window Pipeline Architecture` for the complete 4-tier system: Tier 0 (preprocessing) → Tier 1 (parallel domain debates) → Tier 2 (cluster synthesis) → Tier 3 (Handler synthesis), with Voice Audit Protocol at every boundary.

---

## 🧩 CUSTOM AGENT EXTENSION FRAMEWORK

The 13 core domains cover universal development concerns. When a project needs **domain-specific expertise** (e.g., learning science for EdTech, clinical compliance for healthcare, financial regulation for fintech), users create **custom domain agents** that extend the system.

### How It Works

1. **Copy** the template at `Custom-Agents/CUSTOM_AGENT_TEMPLATE.md`
2. **Fill in** domain-specific perspectives, rules, and assessment protocols following the Standard Agent Specification Format
3. **Register** the agent in `Custom-Agents/AGENT_REGISTRY.md`
4. The Handler Agent **automatically discovers and routes** to custom agents using Extended PDRS scoring

### Key Properties

- Custom agents follow the **same 5+1 Wildcard structure** as core domains
- They produce **standard DAS** in parliamentary debate
- They join their **declared Cluster Affinity** (S, T, or H) for Tier 2 synthesis
- They have **equal authority** to core domains — no second-class citizens
- Custom agent IDs use the **C[N] prefix** (C1, C2, C3...) to distinguish from core domains

### When to Create vs. When Core Suffices

| Scenario | Action |
|----------|--------|
| Need general security advice | Core Domain 10 handles this |
| Need HIPAA-specific compliance | Create a Healthcare Compliance custom agent |
| Need general UX advice | Core Domain 8 handles this |
| Need pedagogy-specific UX for learners | Create a Learning Science custom agent |
| Need algorithm selection | Core Domain 9 handles this |
| Need financial risk modeling algorithms | Create a Financial Regulation custom agent |

> See `Custom-Agents/examples/` for a complete working example.

---

## 📋 STANDARD AGENT SPECIFICATION FORMAT

Every domain agent file follows this structure:

```markdown
# DOMAIN AGENT: [Name]
## Identity & Mandate
## Internal Perspectives (5 sub-agents + 1 Wildcard)
## Assessment Protocol (domain-specific)
## Rules & Workflows (concrete operational logic)
## Initiative Alignment Framework
## Cross-Domain Interface
## Optimization Mandate
```

### Section Definitions

**Identity & Mandate:**
- Domain boundaries (what this agent owns)
- Core competencies
- When this agent MUST be consulted
- When this agent should defer to others
- What project TYPES activate this domain most strongly

**Internal Perspectives:**
- 5 named sub-agents with distinct biases
- 1 Wildcard Provocateur with 1.5x vote weight
- How they disagree and resolve conflict
- What each perspective uniquely catches that others miss

**Assessment Protocol:**
- First-contact project evaluation checklist
- Domain-specific red flags to look for
- Domain-specific strengths to identify
- Scoring rubric for project health in this domain

**Rules & Workflows:**
- Concrete operational rules (IF X THEN Y)
- Decision trees for common scenarios
- Workflow sequences (Step 1 → Step 2 → ...)
- Anti-patterns (what to NEVER do)

**Initiative Alignment Framework:**
- How this domain discovers what the project values
- How domain recommendations map to project objectives
- Conflict resolution: what if domain best-practice conflicts with project values?

**Cross-Domain Interface:**
- What this agent OFFERS to other domains (outputs)
- What this agent NEEDS from other domains (inputs)
- Standard query/response format
- Escalation triggers (when to involve Handler Agent)

**Optimization Mandate:**
- This domain's approach to efficiency
- What "optimal" means in this domain
- Trade-off matrices relevant to this domain
- How to find the Pareto frontier for conflicting objectives

---

## 🏗️ CLUSTER ARCHITECTURE

Domains are organized into **3 parliamentary clusters**, each with natural affinities:

```
┌──────────────────────────────────────────────────────────────┐
│                    HANDLER AGENT (Speaker)                    │
│              Routes, orchestrates, resolves, synthesizes      │
├────────────────────┬──────────────────┬──────────────────────┤
│   STRATEGY         │   TECHNICAL      │   HUMAN              │
│   CLUSTER          │   CLUSTER        │   CLUSTER            │
│                    │                  │                      │
│   Domain 1:        │   Domain 3:      │   Domain 4:          │
│   Project Strategy │   Infrastructure │   Developer          │
│   & Viability      │   & Architecture │   Cognition &        │
│                    │                  │   User Psychology    │
│   Domain 2:        │   Domain 7:      │                      │
│   Ecosystem &      │   OSS & Industry │   Domain 6:          │
│   Competitive      │   Tooling        │   Product Design     │
│   Intelligence     │                  │                      │
│                    │   Domain 9:      │   Domain 8:          │
│   Domain 5:        │   Mathematics &  │   Systems & UX       │
│   AI Integration   │   Algorithms     │   Design             │
│   & Intelligent    │                  │                      │
│   Tooling          │   Domain 10:     │                      │
│                    │   Security &     │                      │
│   Domain 13:       │   Trust          │                      │
│   Unconventional   │                  │                      │
│   Strategies       │   Domain 11:     │                      │
│                    │   Internal       │                      │
│                    │   Systems &      │                      │
│                    │   DevOps         │                      │
│                    │                  │                      │
│                    │   Domain 12:     │                      │
│                    │   Complexity     │                      │
│                    │   Reduction      │                      │
└────────────────────┴──────────────────┴──────────────────────┘
```

### Cluster Responsibilities

**Strategy Cluster** — Answers: *"What should we build and why?"*
- Project viability and strategic direction
- Competitive landscape and ecosystem positioning
- AI/technology strategy and integration decisions
- Growth, scaling, and sustainability decisions
- Unconventional approaches and creative disruption (Domain 13 — cross-cutting advisory)

**Technical Cluster** — Answers: *"How should we build it?"*
- Architecture and infrastructure decisions
- Code quality, testing, open-source practices, and OSS ecosystem intelligence
- Dynamic industry tooling recommendations (libraries, frameworks, OSS repositories)
- Mathematical rigor and algorithmic correctness
- Performance and scalability engineering
- Security architecture and trust design
- Internal systems, distributed architecture, DevOps, and operational readiness
- Complexity reduction and simplification (Domain 12 — cross-cutting advisory)

**Human Cluster** — Answers: *"Who are we building for and how do they experience it?"*
- Developer experience and cognitive ergonomics
- User psychology and behavior modeling
- Product design and visual systems
- Information architecture and user flows
- Accessibility, inclusivity, and emotional design

### Intra-Cluster Communication
Agents within the same cluster can communicate directly without Handler Agent mediation. They share context naturally and can resolve domain-adjacent conflicts independently.

### Inter-Cluster Communication
Cross-cluster communication MUST go through the Handler Agent, which:
1. Translates domain-specific language for the receiving cluster
2. Identifies potential conflicts before they escalate
3. Ensures all relevant clusters are consulted for systemic decisions
4. Maintains parliamentary order (no cluster dominates)

---

## 🔄 SYSTEM WORKFLOWS

### Workflow 1: New Project Assessment
```
1. Handler Agent receives project artifacts (repo, docs, description, or even just a name)
2. Handler Agent distributes to ALL 13 domain agents simultaneously
3. Each domain agent conducts internal 6-perspective assessment
   (Service-role domains — 7, 10, 11, 12, 13 — additionally produce
    cross-cutting advisory intelligence shared with all domains)
4. Each domain agent produces domain-specific assessment report
5. Handler Agent collects reports from all 3 clusters
6. Handler Agent synthesizes cross-domain assessment
7. Handler Agent identifies conflicts between domain recommendations
8. Handler Agent triggers targeted debates to resolve conflicts
9. Handler Agent produces unified assessment with dissent log
```

### Workflow 2: Specific Development Task
```
1. User poses a development question, bug, feature request, or design challenge
2. Handler Agent analyzes query → routes to relevant domain(s) via PDRS scoring
3. Primary domain agent conducts internal debate
4. Primary domain identifies cross-domain dependencies
5. Handler Agent routes dependencies to secondary domain(s)
6. All consulted domains return recommendations
7. Handler Agent synthesizes, noting agreement/disagreement areas
8. Handler Agent returns ACTIONABLE recommendation with confidence level
```

### Workflow 3: Cross-Domain Conflict Resolution
```
1. Two or more domains produce conflicting recommendations
2. Handler Agent convenes a "joint session" with conflicting agents
3. Each domain states its position with evidence
4. Handler Agent identifies the root of the conflict:
   a. Different values → Escalate to initiative alignment
   b. Different facts → Commission research/data gathering
   c. Different trade-offs → Present Pareto frontier to user
5. Handler Agent calls vote if consensus is not reached
6. Dissenting opinions are logged (never silenced)
```

### Workflow 4: Initiative Alignment Check
```
1. A recommendation is produced
2. Handler Agent checks against the Initiative Compass:
   - Does it align with the stated MISSION?
   - Does it honor the declared VALUES?
   - Does it advance the defined GOALS?
   - Does it respect the CONSTRAINTS?
   - Does it violate any NON-NEGOTIABLES?
3. If any check fails, Handler Agent triggers re-evaluation
4. Domain agents must revise within initiative constraints
```

### Workflow 5: AI Agent Routing
```
1. External AI agent (Copilot, Claude, GPT, etc.) receives user prompt
2. AI agent reads ROUTING_PROTOCOL.md for orchestration instructions
3. AI agent loads relevant domain file(s) based on PDRS scoring
4. Domain perspectives are applied to the problem
5. Response is structured per the DAS format
6. User receives a multi-perspective answer instead of a single-perspective one
```

---

## 🧩 PROJECT TYPE ADAPTABILITY

The system dynamically adapts its domain emphasis based on project type:

| Project Type | Primary Domains | Secondary Domains | Reduced Emphasis |
|-------------|----------------|-------------------|-----------------|
| **Web SaaS** | 3, 6, 7, 8, 11 | 1, 2, 10, 12 | 9 |
| **CLI Tool** | 3, 7, 12 | 8, 11 | 2, 6 |
| **Mobile App** | 6, 8, 3 | 4, 10, 7 | 9, 11 |
| **Library/SDK** | 7, 3, 9, 12 | 8, 10 | 1, 2, 6 |
| **AI/ML Product** | 5, 9, 3, 10 | 7, 1, 4 | 6 |
| **Game** | 4, 6, 8, 9 | 3, 13, 7 | 2, 11 |
| **Blockchain/DeFi** | 10, 9, 3 | 7, 1, 12 | 4, 6, 8 |
| **Data Pipeline** | 3, 9, 11, 12 | 7, 10 | 6, 8 |
| **API/Platform** | 3, 7, 10, 11 | 12, 1, 8 | 4, 6 |
| **Open Source Project** | 7, 3, 12, 8 | 1, 13, 11 | 2 |
| **Internal Tool** | 3, 8, 11, 12 | 7, 4 | 1, 2, 13 |
| **Educational Platform** | 4, 5, 8, 9 | 3, 6, 7 | 13 |

> [!NOTE]
> These are **starting weights**, not fixed rankings. The PDRS system dynamically adjusts based on actual query content. A CLI tool with a complex algorithm? Domain 9 becomes primary. A web SaaS with novel math? Same. The project type just sets initial priors.

---

## 📊 SYSTEM HEALTH METRICS

The agentic system itself should be monitored for:

| Metric | Target | Warning |
|--------|--------|---------|
| Domain coverage | All 13 domains consulted for systemic decisions | <11 domains consulted |
| Internal debate depth | ≥3 perspectives per domain assessment | <3 perspectives heard |
| Cross-domain queries | ≥2 cross-domain consultations per decision | Isolated domain decisions |
| Consensus rate | 60-80% (some dissent is healthy) | >95% (groupthink) or <40% (dysfunction) |
| Initiative alignment | 100% of recommendations checked | Any unchecked recommendation |
| Dissent documentation | All minority opinions logged | Suppressed dissent |
| Project type adaptation | Domain weights shift by project type | Static weights across projects |
| Anti-slop filter | 100% of outputs pass Domain 13 audit | Any generic recommendation shipped |
| Actionability | Every recommendation includes concrete next steps | Vague "consider doing X" advice |

---

## 📌 VERSION & GOVERNANCE

**System Version:** 1.0-dev  
**Purpose:** Universal Development Orchestration  
**Created:** March 6, 2026  
**Governance:** Modifications require Handler Agent review + user approval  
**Core Domain Expansion:** New core domains can be added by following the Standard Agent Specification Format  
**Custom Agent Extension:** Project-specific domains are created using `Custom-Agents/CUSTOM_AGENT_TEMPLATE.md` and registered in `Custom-Agents/AGENT_REGISTRY.md`. Custom agents participate in parliamentary debate alongside core domains with equal authority.  
**Retirement:** Domains are never deleted, only archived with "INACTIVE" status  
**Compatibility:** Works with any AI assistant that can read markdown context files

---

*"78+ perspectives, 13+ domains, 3 clusters, 13+ wildcards, 1 parliament — the collective intelligence that refuses to settle for the obvious answer. Any project. Any language. Any scale. Better decisions."*
