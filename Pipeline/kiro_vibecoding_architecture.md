# Kiro Agentic IDE — Vibe Coding Pipeline, Flow & Architecture

> **Kiro** is AWS's Agentic IDE (launched July 14, 2025) built on Code OSS (VS Code fork).
> Its core mission: move developers from *vibe coding* → **viable code** through structured,
> spec-driven, AI-agent-assisted workflows.

---

## Table of Contents

1. [Overview](#1-overview)
2. [Core Philosophy — Vibe vs. Spec](#2-core-philosophy--vibe-vs-spec)
3. [High-Level Architecture (Four-Layer Model)](#3-high-level-architecture-four-layer-model)
4. [Session Types](#4-session-types)
5. [Spec-Driven Development (SDD) Pipeline](#5-spec-driven-development-sdd-pipeline)
   - 5.1 [Phase 1 — Requirements (`requirements.md`)](#51-phase-1--requirements-requirementsmd)
   - 5.2 [Phase 2 — Design (`design.md`)](#52-phase-2--design-designmd)
   - 5.3 [Phase 3 — Tasks (`tasks.md`)](#53-phase-3--tasks-tasksmd)
6. [.kiro/ Directory — Source of Truth](#6-kiro-directory--source-of-truth)
7. [Steering Files](#7-steering-files)
8. [Agent Hooks (Event-Driven Automation)](#8-agent-hooks-event-driven-automation)
9. [Agent Execution Modes](#9-agent-execution-modes)
10. [MCP Integration](#10-mcp-integration)
11. [AI Model Layer](#11-ai-model-layer)
12. [End-to-End Developer Flow](#12-end-to-end-developer-flow)
13. [Component Relationship Map](#13-component-relationship-map)
14. [Pricing Tiers (Preview & Post-Preview)](#14-pricing-tiers-preview--post-preview)
15. [Comparison: Kiro vs. Traditional AI Coding Assistants](#15-comparison-kiro-vs-traditional-ai-coding-assistants)

---

## 1. Overview

```
┌──────────────────────────────────────────────────────────────────┐
│                        KIRO AGENTIC IDE                          │
│                                                                  │
│   Natural Language Prompt  ──►  Spec Engine  ──►  AI Agent      │
│         (Human)                 (Structure)       (Execution)    │
│                                                                  │
│   Steering Files  ──►  Context & Guardrails  ──►  Consistent     │
│                                                       Output     │
│                                                                  │
│   Agent Hooks  ──►  Event-Driven Automation  ──►  CI/CD-like     │
│                                                     Workflows    │
└──────────────────────────────────────────────────────────────────┘
```

**Kiro** is not a simple code-completion tool. It is a full *agentic IDE* where:

- Software agents and humans **collaborate under structured processes**.
- Every generated line of code is **anchored to a verified blueprint** (spec).
- Context is **persistent and team-shareable** via versioned markdown files.
- Automation is **event-driven** through hooks, not manual re-prompting.

---

## 2. Core Philosophy — Vibe vs. Spec

| Dimension          | Vibe Coding                              | Spec-Driven (Kiro's Model)               |
|--------------------|------------------------------------------|------------------------------------------|
| **Trigger**        | Chat-first, ad hoc prompting             | Plan-first, structured specification     |
| **Context**        | Lost between sessions                    | Persistent in `.kiro/` directory          |
| **Output quality** | Often messy, inconsistent, DRY failures  | Structured, test-linked, reviewable      |
| **Team use**       | Uncoordinated, hard to onboard           | Shared specs, common alignment           |
| **Testing**        | Forgotten or bolted on later             | Tasks directly linked to unit/integration tests |
| **Architecture**   | Emergent (spaghetti risk)                | Documented before code is written        |
| **Best for**       | Rapid prototyping, POCs                  | Production systems, large projects       |

> Kiro supports **both** modes — Vibe sessions for exploration, Spec sessions for production.

---

## 3. High-Level Architecture (Four-Layer Model)

```
┌─────────────────────────────────────────────────────────────────────┐
│                         KIRO ARCHITECTURE                           │
│                                                                     │
│  ┌────────────────────────────────────────────────────────────┐     │
│  │  LAYER 1 — INTENT LAYER                                    │     │
│  │  • Natural language input from developer                   │     │
│  │  • Chat interface                                          │     │
│  │  • Session selection: Vibe Mode | Spec Mode                │     │
│  └────────────────────────────────────────────────────────────┘     │
│                              │                                      │
│                              ▼                                      │
│  ┌────────────────────────────────────────────────────────────┐     │
│  │  LAYER 2 — KNOWLEDGE LAYER                                 │     │
│  │  • Steering files (.kiro/steering/)                        │     │
│  │  • Spec files (.kiro/specs/<feature>/)                     │     │
│  │  • Codebase-wide project context                           │     │
│  │  • MCP server integrations                                 │     │
│  └────────────────────────────────────────────────────────────┘     │
│                              │                                      │
│                              ▼                                      │
│  ┌────────────────────────────────────────────────────────────┐     │
│  │  LAYER 3 — EXECUTION LAYER                                 │     │
│  │  • AI Agent (Claude Sonnet 3.7 / 4.0)                      │     │
│  │  • Spec Engine: Requirements → Design → Tasks              │     │
│  │  • Task execution interface (click-to-run tasks)           │     │
│  │  • Code generation, refactoring, test generation           │     │
│  │  • Agent Hooks (event-driven background agents)            │     │
│  └────────────────────────────────────────────────────────────┘     │
│                              │                                      │
│                              ▼                                      │
│  ┌────────────────────────────────────────────────────────────┐     │
│  │  LAYER 4 — OVERSIGHT LAYER                                 │     │
│  │  • Autopilot Mode (autonomous execution)                   │     │
│  │  • Supervised Mode (human checkpoints)                     │     │
│  │  • Code review integration                                 │     │
│  │  • Diff inspection and approval gates                      │     │
│  └────────────────────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 4. Session Types

When you open a project folder in Kiro, you choose one of two session types:

### 4.1 Vibe Session
```
┌─────────────────────────────────────────────┐
│              VIBE SESSION                   │
│                                             │
│  Chat-first → Build                         │
│  ┌──────────┐   ┌──────────┐   ┌─────────┐ │
│  │  Prompt  │──►│  Agent   │──►│  Code   │ │
│  └──────────┘   └──────────┘   └─────────┘ │
│                                             │
│  Best for:                                  │
│  • Rapid prototyping                        │
│  • Exploring unclear requirements           │
│  • Implementing isolated tasks              │
│  • Sketching out basic concepts             │
└─────────────────────────────────────────────┘
```

### 4.2 Spec Session
```
┌──────────────────────────────────────────────────────┐
│                   SPEC SESSION                       │
│                                                      │
│  Plan-first → Build                                  │
│  ┌──────────┐  ┌────────────┐  ┌───────────────┐    │
│  │  Prompt  │─►│ Spec Engine│─►│  Structured   │    │
│  └──────────┘  └────────────┘  │  Code Output  │    │
│                                └───────────────┘    │
│  Spec Engine:                                        │
│   1. requirements.md (EARS notation)                 │
│   2. design.md (architecture + diagrams)             │
│   3. tasks.md (discrete executable tasks)            │
│                                                      │
│  Best for:                                           │
│  • Production systems                                │
│  • Complex or interconnected architectures          │
│  • Team collaboration and knowledge sharing         │
│  • Long-term maintainable codebases                 │
└──────────────────────────────────────────────────────┘
```

---

## 5. Spec-Driven Development (SDD) Pipeline

The core of Kiro's spec pipeline. A single natural language prompt expands into three sequential structured documents, each stored in `.kiro/specs/<feature>/`.

```
Developer Prompt
      │
      ▼
┌─────────────────────────────────────────────────────────────┐
│                     SPEC PIPELINE                           │
│                                                             │
│  [1] requirements.md ──► [2] design.md ──► [3] tasks.md    │
│       (EARS / User           (Architecture,      (Atomic,   │
│        Stories)               Diagrams,          Clickable  │
│                               Schemas)            Tasks)    │
└─────────────────────────────────────────────────────────────┘
      │
      ▼
Task Execution (click "Start Task") ──► Code + Tests Generated
```

---

### 5.1 Phase 1 — Requirements (`requirements.md`)

**Purpose:** Eliminate ambiguity. Turn vague prompts into verifiable requirements.

**Notation:** EARS (Easy Approach to Requirements Syntax)

```
EARS Syntax Pattern:
  WHEN  [optional trigger event]
  IF    [optional precondition]
  THE   [system name]
  SHALL [required response/behavior]

Example:
  WHEN a new user signs up via Cognito
  THE system SHALL create a default profile in DynamoDB
  AND THE system SHALL trigger a 'Welcome' email via Amazon SES
```

**Outputs from this phase:**
- User stories with detailed acceptance criteria
- EARS-formatted system behavior definitions
- Edge cases and preconditions documented

---

### 5.2 Phase 2 — Design (`design.md`)

**Purpose:** Translate requirements into a technical architecture before a single line of code is written.

**Outputs from this phase:**
- Technical architecture diagrams
- Sequence diagrams (data flow between services)
- TypeScript/language-specific interface definitions
- Database schemas
- AWS service selection rationale (e.g., Bedrock over third-party LLMs for privacy)
- API contracts

```
requirements.md
      │
      ▼  (Kiro Agent processes)
design.md
      ├── Architecture Diagram
      ├── Sequence Diagrams
      ├── Interface Definitions (TypeScript, etc.)
      ├── Data Schemas
      └── Service Selection Rationale
```

---

### 5.3 Phase 3 — Tasks (`tasks.md`)

**Purpose:** Decompose the design into atomic, sequenced, executable work items.

**Key characteristics:**
- Tasks are **modular** — one concern per task
- Tasks are **sequenced** — dependencies are honored
- Tasks **include test generation** — unit/integration tests are not an afterthought
- Tasks are **clickable** — developer clicks "Start Task" and the agent executes

```
design.md
      │
      ▼
tasks.md
      ├── Task #1: Scaffold project structure  [▶ Start]
      ├── Task #2: Implement auth module        [▶ Start]
      ├── Task #3: Create DynamoDB data layer   [▶ Start]
      ├── Task #4: Build API endpoints          [▶ Start]
      ├── Task #5: Write unit tests             [▶ Start]
      └── Task #6: Write integration tests      [▶ Start]
```

> Unlike vibe coding, you always know exactly **what is done** and **what remains**.

---

## 6. .kiro/ Directory — Source of Truth

When a project is initialized (`kiro init`), a `.kiro/` directory is created. This is the "living blueprint" of the project — versioned, team-shareable, and executable.

```
.kiro/
├── specs/
│   └── <feature-name>/
│       ├── requirements.md   ← EARS user stories + acceptance criteria
│       ├── design.md         ← Architecture, diagrams, schemas
│       └── tasks.md          ← Sequenced, atomic implementation tasks
│
├── steering/
│   ├── product.md            ← Product overview and goals
│   ├── tech-stack.md         ← Technology choices and rationale
│   ├── structure.md          ← Project structure conventions
│   └── [custom].md           ← Team-specific guidelines
│
└── hooks/
    └── [hook-name].json      ← Event-driven automation definitions
```

**Why this matters:**
- All context is **persistent** across sessions — no more lost context when you close the IDE
- Files are **version-controlled** alongside code — specs evolve with the codebase
- **Team alignment** — new engineers onboard via specs, not verbal handoffs

---

## 7. Steering Files

Steering files are persistent **project context and guardrails** that ensure the AI agent always follows your team's standards, naming conventions, and architectural decisions.

```
.kiro/steering/
      │
      ├── product.md        → What is this product? Who are the users?
      ├── tech-stack.md     → Which AWS services, languages, frameworks to use
      └── structure.md      → Folder layout, naming conventions, code style
```

**Example steering file (`tech-stack.md`):**

```markdown
# AWS Development Guidelines

- Always use **AWS CDK v2** for infrastructure as code
- All Lambda functions MUST use **PowerTools for AWS Lambda** for logging
- Databases MUST have **Point-in-Time Recovery (PITR)** enabled
- Use **Amazon Bedrock** (not third-party LLMs) for AI features (privacy requirement)
- All secrets MUST be stored in **AWS Secrets Manager** — never hardcoded
```

**Effect:** The AI agent reads steering files on every interaction. It will never suggest
a third-party LLM if `tech-stack.md` mandates Bedrock. This enforces **organizational
culture** at the agent level.

---

## 8. Agent Hooks (Event-Driven Automation)

Hooks are **event-driven background agents** — they fire automatically when file system
events occur, acting like an automated senior developer watching over your shoulder.

```
File System Event
      │
      ▼
┌─────────────────────────────────────────────────────────────────┐
│                      AGENT HOOK ENGINE                          │
│                                                                 │
│  Trigger Events:                                                │
│  ┌────────────────┐  ┌────────────────┐  ┌───────────────────┐ │
│  │  File Created  │  │  File Saved    │  │  File Deleted     │ │
│  └────────────────┘  └────────────────┘  └───────────────────┘ │
│           │                  │                    │            │
│           └──────────────────┴────────────────────┘            │
│                              │                                  │
│                              ▼                                  │
│               Hook Definition (.kiro/hooks/)                    │
│                              │                                  │
│                              ▼                                  │
│               Automated Action (AI Agent Task)                  │
│     • Auto-generate tests when a new file is created            │
│     • Auto-update docs when a function is modified              │
│     • Auto-lint on save                                         │
│     • Auto-sync spec tasks when code changes                    │
└─────────────────────────────────────────────────────────────────┘
```

**Use cases for Hooks:**
- Auto-generate unit tests whenever a new service file is created
- Auto-update `design.md` when an API endpoint changes
- Auto-enforce security standards when infrastructure files are saved
- Run custom code quality checks on every file save

---

## 9. Agent Execution Modes

The Oversight Layer (Layer 4) provides two operating modes:

```
┌─────────────────────────────────────────────────────────────────┐
│                     EXECUTION MODES                             │
│                                                                 │
│  AUTOPILOT MODE                   SUPERVISED MODE              │
│  ─────────────                    ───────────────              │
│  Agent executes tasks             Agent proposes changes       │
│  autonomously without             and pauses at each           │
│  interruption                     checkpoint for human         │
│                                   review and approval           │
│  Best for:                        Best for:                    │
│  • Well-defined tasks             • Critical/sensitive code     │
│  • Repetitive patterns            • First-time feature setup   │
│  • Trusted, low-risk code         • Architectural decisions     │
│  • CI/CD-style workflows          • Security-critical paths     │
└─────────────────────────────────────────────────────────────────┘
```

---

## 10. MCP Integration

Kiro supports the **Model Context Protocol (MCP)**, allowing the agent to connect to
external servers and tools without leaving the IDE.

```
Kiro AI Agent
      │
      ▼  (via MCP Protocol)
┌─────────────────────────────────────────────────────────────────┐
│                     MCP SERVER LAYER                            │
│                                                                 │
│  ┌───────────────────┐   ┌───────────────────┐                 │
│  │  AWS Docs MCP     │   │  Custom MCP        │                 │
│  │  Server           │   │  Servers           │                 │
│  │                   │   │                    │                 │
│  │  • Search AWS     │   │  • Internal APIs   │                 │
│  │    documentation  │   │  • Company DBs     │                 │
│  │  • Get service    │   │  • Custom tools    │                 │
│  │    recommendations│   │                    │                 │
│  └───────────────────┘   └───────────────────┘                 │
│                                                                 │
│  MCP enables: External Tool Integration, API Access,            │
│               Specialized Knowledge Retrieval                   │
└─────────────────────────────────────────────────────────────────┘
```

---

## 11. AI Model Layer

Kiro's agent is powered by Anthropic's Claude models:

| Model              | Availability | Notes                                     |
|--------------------|--------------|-------------------------------------------|
| Claude Sonnet 4.0  | ✅ Primary    | More capable, recommended default         |
| Claude Sonnet 3.7  | ✅ Available  | Legacy option, still highly capable       |
| Thinking Mode      | ❌            | Not available at preview launch           |

**Model responsibilities in Kiro:**
- Parsing natural language → EARS-structured requirements
- Generating architecture diagrams and interface definitions
- Breaking design into atomic tasks
- Executing individual tasks (code generation, refactoring, test writing)
- Responding to Hook triggers with automated actions

---

## 12. End-to-End Developer Flow

```
╔═══════════════════════════════════════════════════════════════════╗
║               KIRO END-TO-END DEVELOPER FLOW                     ║
╠═══════════════════════════════════════════════════════════════════╣
║                                                                   ║
║  1. INIT           kiro init                                      ║
║                    └── Creates .kiro/ directory                   ║
║                    └── Generates base steering files              ║
║                                                                   ║
║  2. MODE SELECT    Open project folder                            ║
║                    └── Choose: [Vibe Session] or [Spec Session]   ║
║                                                                   ║
║  3. INTENT         Natural language prompt in Chat                ║
║                    e.g. "Build a user onboarding flow with        ║
║                          Cognito, DynamoDB, and SES"              ║
║                                                                   ║
║  4. REQUIREMENTS   Kiro generates requirements.md                 ║
║                    └── EARS-formatted user stories                ║
║                    └── Acceptance criteria                        ║
║                    → Human reviews & refines                      ║
║                                                                   ║
║  5. DESIGN         Kiro generates design.md                       ║
║                    └── Architecture diagram                       ║
║                    └── Sequence diagrams                          ║
║                    └── TypeScript interfaces / DB schemas         ║
║                    → Human reviews & approves                     ║
║                                                                   ║
║  6. TASKS          Kiro generates tasks.md                        ║
║                    └── Atomic sequenced implementation tasks      ║
║                    └── Each task includes test generation         ║
║                                                                   ║
║  7. EXECUTE        Developer clicks [▶ Start Task] per task       ║
║                    └── Agent executes in Autopilot or Supervised  ║
║                    └── Code + tests generated                     ║
║                    └── Hooks fire on file events                  ║
║                                                                   ║
║  8. REVIEW         Human reviews diffs                            ║
║                    └── Approve / request changes via chat         ║
║                    └── Repeat for remaining tasks                 ║
║                                                                   ║
║  9. REFACTOR       Switch to Spec Mode for cleanup                ║
║                    └── Kiro restructures messy vibe-phase code    ║
║                    └── Applies DRY, SOLID, team conventions       ║
║                                                                   ║
║  10. DEPLOY        Steering files guide AWS CDK / Terraform        ║
║                    └── Agent follows infra guardrails             ║
║                    └── Security standards enforced automatically  ║
╚═══════════════════════════════════════════════════════════════════╝
```

---

## 13. Component Relationship Map

```
                    ┌─────────────────────┐
                    │     Developer       │
                    │  (Natural Language) │
                    └──────────┬──────────┘
                               │
                    ┌──────────▼──────────┐
                    │    Chat Interface   │
                    │  (Vibe | Spec Mode) │
                    └──────────┬──────────┘
                               │
              ┌────────────────┼────────────────┐
              │                │                │
   ┌──────────▼─────┐ ┌───────▼──────┐ ┌───────▼──────┐
   │  Steering Files │ │  Spec Engine │ │ Agent Hooks  │
   │ .kiro/steering/ │ │ .kiro/specs/ │ │ .kiro/hooks/ │
   └──────────┬──────┘ └──────┬───────┘ └──────┬───────┘
              │               │                 │
              └───────────────┼─────────────────┘
                              │
                   ┌──────────▼──────────┐
                   │      AI AGENT       │
                   │  (Claude Sonnet 4)  │
                   └──────────┬──────────┘
                              │
              ┌───────────────┼───────────────┐
              │               │               │
   ┌──────────▼─────┐ ┌───────▼──────┐ ┌─────▼──────────┐
   │  Code Generation│ │ Test Writing │ │  MCP Servers   │
   │  & Refactoring  │ │ (unit/integ) │ │ (AWS Docs etc) │
   └──────────┬──────┘ └──────┬───────┘ └────────────────┘
              │               │
              └───────┬───────┘
                      │
           ┌──────────▼──────────┐
           │   Oversight Layer   │
           │  Autopilot Mode /   │
           │  Supervised Mode    │
           └─────────────────────┘
```

---

## 14. Pricing Tiers (Preview & Post-Preview)

| Tier         | Price                   | Agent Interactions/Month |
|--------------|-------------------------|--------------------------|
| **Preview**  | Free                    | Unlimited (preview only) |
| **Free**     | $0                      | 50 interactions          |
| **Pro**      | $19 / user / month      | 1,000 interactions       |
| **Pro+**     | $39 / user / month      | 3,000 interactions       |

---

## 15. Comparison: Kiro vs. Traditional AI Coding Assistants

| Feature                   | Cursor / Copilot          | Kiro                                  |
|---------------------------|---------------------------|---------------------------------------|
| **Core model**            | Chat → Code               | Prompt → Spec → Code                  |
| **Context persistence**   | Session-limited           | Persistent `.kiro/` directory          |
| **Team context sharing**  | Partial (project rules)   | Full (versioned specs + steering)      |
| **Spec generation**       | ❌                         | ✅ requirements, design, tasks         |
| **EARS requirements**     | ❌                         | ✅ Built-in                            |
| **Event-driven hooks**    | ❌                         | ✅ File-based automation               |
| **Oversight modes**       | Manual only               | Autopilot + Supervised                |
| **MCP integration**       | Limited                   | Full MCP protocol support             |
| **AWS native**            | ❌                         | ✅ AWS CDK, Bedrock, Cognito awareness |
| **Base IDE**              | Varies                    | Code OSS (VS Code compatible)         |
| **AI model**              | GPT / Claude / Gemini     | Claude Sonnet 3.7 / 4.0              |
| **Best suited for**       | Individual dev, fast tasks| Team production, complex systems      |

---

## Key Takeaways

- **Kiro bridges vibe coding and production engineering** by injecting structure (specs)
  between the human prompt and the AI agent's execution.
- **The `.kiro/` directory is the backbone** — it holds requirements, design, tasks,
  steering guardrails, and hook definitions, all version-controlled.
- **EARS notation** ensures requirements are machine-readable and unambiguous.
- **Hooks enable CI/CD-style automation** at the file event level — no manual re-prompting.
- **Steering files enforce team culture** at the AI model level, ensuring every agent
  suggestion respects your naming conventions, AWS standards, and security policies.
- **Supervised and Autopilot modes** give developers granular control over how
  autonomously the agent operates.

---

*Document compiled from Kiro public preview documentation, AWS official release materials,
and technical analyses published July–March 2025–2026.*
