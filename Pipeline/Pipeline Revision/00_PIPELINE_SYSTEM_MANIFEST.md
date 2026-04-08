# Pipeline System Manifest
## Idea → Product Machine — Architecture & Operating Specification

> This document defines the machine. Every stage guide in this pipeline is a cog.
> A cog has exactly one upstream input contract, one downstream output contract,
> and one role in the manifest. None of the cogs operate in isolation.

**Pipeline Version**: 2.0
**Stages**: 6 (Requirements → Customization → Design → Task List → Session Planning → Development)

---

## The Machine Mental Model

```
                    ┌────────────────────────────────────────────┐
                    │         project.manifest.yaml              │
                    │   The shared state that threads through    │
                    │   every stage. Every cog reads it and      │
                    │   writes back to it when done.             │
                    └──────────────┬─────────────────────────────┘
                                   │ (read/write at every stage)
     ┌────────────────────────────────────────────────────────────────────┐
     │                                                                    │
     ▼                                                                    │
┌──────────┐   ┌──────────────┐   ┌────────┐   ┌──────────┐   ┌───────────────────┐   ┌─────────────┐
│   REQ    │──►│ CUSTOMIZATION│──►│ DESIGN │──►│ TASKLIST │──►│ SESSION PLANNING  │──►│ DEVELOPMENT │
│  Stage 1 │   │   Stage 2    │   │Stage 3 │   │ Stage 4  │   │     Stage 5       │   │   Stage 6   │
│          │   │  (optional)  │   │        │   │          │   │  (MODEL-AWARE)    │   │             │
└──────────┘   └──────────────┘   └────────┘   └──────────┘   └───────────────────┘   └─────────────┘
     │               │                │              │                   │                    │
     │               │                │              │                   │                    │
  req.md        custom.md         design.md       tasks.md        session_NN.md          code+tests
  (artifact)    (artifact)        (artifact)      (artifact)      (artifacts[])           (artifacts)
```

Each arrow is a **handoff event**. A handoff is only valid when the producing stage has
set its manifest status to `complete` and all required output artifacts exist on disk.

---

## The Project Manifest (`project.manifest.yaml`)

Every project built with this pipeline contains exactly one `project.manifest.yaml` at
the root of the `.spec/` directory. It is the single source of truth for pipeline state.

```yaml
# .spec/project.manifest.yaml

meta:
  project_id: "unique-slug-or-uuid"
  project_name: "Human-readable project name"
  created_at: "ISO-8601 datetime"
  last_updated: "ISO-8601 datetime"
  pipeline_version: "2.0"

pipeline:
  current_stage: "session_planning"   # One of: requirements | customization | design | task_list | session_planning | development
  stages:
    requirements:
      status: "complete"              # One of: pending | in_progress | complete | blocked
      artifact: ".spec/requirements.md"
      completed_at: "ISO-8601 datetime"
      agent_used: null                # Not tracked at this stage (human-authored)
      open_questions: []
    customization:
      status: "skipped"               # "skipped" is valid for optional stages
      artifact: null
      completed_at: null
    design:
      status: "complete"
      artifact: ".spec/design.md"
      completed_at: "ISO-8601 datetime"
      agent_used: "claude-sonnet-4-6"
      open_questions: []
    task_list:
      status: "complete"
      artifact: ".spec/tasks.md"
      completed_at: "ISO-8601 datetime"
      agent_used: "claude-sonnet-4-6"
      open_questions: []
    session_planning:
      status: "in_progress"
      artifact_dir: ".spec/builds/feature_name/"
      sessions_total: 12
      sessions_complete: 4
      model_profile: "claude-sonnet-4-6"     # Model all sessions are calibrated for
      model_tier: "sonnet"
      project_size: "medium"                 # small | medium | large (affects token budgets)
    development:
      status: "pending"
      sessions_complete: 0
      sessions_total: 12

model_registry:
  planning_model: "claude-sonnet-4-6"        # Model used to generate specs and plans
  execution_model: "claude-sonnet-4-6"       # Model that will execute session files
  # These can differ — e.g., plan with Opus, execute with Sonnet

artifacts:
  requirements: ".spec/requirements.md"
  customization: null
  design: ".spec/design.md"
  tasks: ".spec/tasks.md"
  session_dir: ".spec/builds/feature_name/"
  custom_agents: []

open_questions:
  # Unresolved questions that must be cleared before advancing the pipeline
  - id: "OQ-001"
    stage: "design"
    question: "Which auth strategy: JWT stateless or session store?"
    raised_at: "2026-03-30"
    status: "resolved"
    resolution: "JWT stateless per tech-stack steering"
```

### Manifest Rules

- **One manifest per project**, not per feature. Features are tracked under `pipeline.session_planning.artifact_dir`.
- **No stage may begin** while the preceding stage is `in_progress` or `blocked`.
- **All open questions** in `open_questions[]` must be `resolved` before a stage can be marked `complete`.
- **The Handler updates the manifest** at the end of every session and every stage. The executing agent never writes to the manifest.

---

## Stage I/O Contracts

Every stage has a defined input contract (what it consumes) and output contract (what it produces). A stage that does not produce its contract artifact is **incomplete**, regardless of what the agent generated.

### Stage 1 — Requirements

| | Contract |
|---|---|
| **Consumes** | Raw idea (natural language), user research, product notes |
| **Produces** | `requirements.md` with: Problem Statement, User Stories (US-N), Acceptance Criteria (AC-N.N), Correctness Properties (CP-*), Constraints, Success Metrics |
| **Manifest writes** | `pipeline.stages.requirements.status = complete`, `artifacts.requirements` path |
| **Gate to next stage** | No unresolved `[PLACEHOLDER]` markers, no open questions with status `pending` |

### Stage 2 — Customization (Optional)

| | Contract |
|---|---|
| **Consumes** | `requirements.md` |
| **Produces** | `customization.md` with: Domain Analysis, Custom Agent Specs (D14+), Knowledge Distillations, Integration Plan; updates to `AGENT_REGISTRY.md` |
| **Manifest writes** | `pipeline.stages.customization.status`, `artifacts.customization` path, `artifacts.custom_agents[]` |
| **Gate to next stage** | All custom agents registered; distillations referenced, not inline |
| **Skip condition** | Simple CRUD, one-off feature, or core domains sufficient — set `status: skipped` |

### Stage 3 — Design

| | Contract |
|---|---|
| **Consumes** | `requirements.md`, `customization.md` (if exists) |
| **Produces** | `design.md` with: System Architecture, Data Models, API Contracts, Algorithm Specs, Correctness Properties, Non-Functional Requirements |
| **Manifest writes** | `pipeline.stages.design.status`, `artifacts.design`, `model_registry.planning_model` |
| **Gate to next stage** | Zero unresolved `[PLACEHOLDER]` markers; all open questions resolved; tech stack confirmed |

### Stage 4 — Task List

| | Contract |
|---|---|
| **Consumes** | `design.md`, `requirements.md`, `customization.md` (if exists) |
| **Produces** | `tasks.md` with: Task records (TASK-NNN), Dependency graph, Traceability matrix; zero XL tasks |
| **Manifest writes** | `pipeline.stages.task_list.status`, `artifacts.tasks`, total session count estimate |
| **Gate to next stage** | 100% design coverage, 100% US/AC traceability, all boundaries specified |

### Stage 5 — Session Planning *(Model-Aware)*

| | Contract |
|---|---|
| **Consumes** | `tasks.md`, `model_registry.execution_model`, `project_size` |
| **Produces** | `session_NN_slug.md` files, calibrated to the execution model's context budget |
| **Manifest writes** | `pipeline.stages.session_planning.sessions_total`, `model_profile`, session status array |
| **Gate to next stage** | All sessions generated; Handler has reviewed sessions 01–03; no session is oversized for the model |

### Stage 6 — Development

| | Contract |
|---|---|
| **Consumes** | `session_NN_slug.md` files (one at a time, in order) |
| **Produces** | Code files, test files, per-session verification reports |
| **Manifest writes** | `pipeline.stages.development.sessions_complete` (incremented after each session) |
| **Gate to next session** | All success criteria for current session are mechanically verified |

---

## Directory Structure

```
project-root/
├── .spec/
│   ├── project.manifest.yaml          ← Pipeline state (Handler maintains)
│   ├── requirements.md                ← Stage 1 artifact
│   ├── customization.md               ← Stage 2 artifact (if applicable)
│   ├── design.md                      ← Stage 3 artifact
│   ├── tasks.md                       ← Stage 4 artifact
│   └── builds/
│       └── [feature-name]/
│           ├── session_01_scaffold.md
│           ├── session_02_user_entity.md
│           ├── session_03_auth_service.md
│           └── ...
├── src/                               ← Stage 6 output (code)
└── tests/                             ← Stage 6 output (tests)
```

---

## The Handler's Role

The **Handler** is the human who owns the manifest and orchestrates the machine. Agents never see the manifest. Agents never plan across sessions. The Handler's jobs are:

1. **Gate-keeping**: No stage begins until the prior stage's gate conditions are met.
2. **Manifest maintenance**: Update `project.manifest.yaml` after every stage and every session.
3. **Question resolution**: Every item in `open_questions[]` is the Handler's responsibility — not the agent's.
4. **Session dispatch**: Hand exactly one session file to the executing agent. Never two.
5. **Verification**: Confirm every success criterion before advancing the session counter.

---

## Pipeline Governance Rules

These rules apply to every stage guide. No guide may override them.

| Rule | Statement |
|------|-----------|
| **No Forward Blindness Violation** | An executing agent must never be shown future session files |
| **No Manifest Access** | Executing agents do not read or write `project.manifest.yaml` |
| **No Scope Invention** | An agent that finishes its session early must stop, not proceed to the next task |
| **No Open Placeholder Propagation** | A `[PLACEHOLDER]` in any artifact may not carry forward to the next stage |
| **Model Calibration Required** | Session files must be sized for the declared `execution_model` |
| **One Artifact Per Stage** | Each stage produces exactly one primary artifact (plus directory artifacts for sessions) |

---

## Glossary

| Term | Definition |
|------|-----------|
| **Handler** | The human orchestrating the pipeline; owns the manifest |
| **Executor** | The AI agent carrying out a single session |
| **Planning Model** | The model used during stages 1–5 to generate specs |
| **Execution Model** | The model used during stage 6 to implement session files |
| **Effective Budget** | The token ceiling a session file must not exceed, derived from the execution model profile |
| **Handoff Event** | The moment one stage is marked complete and the next begins |
| **Context Snapshot** | The portion of the codebase injected into the agent's context at session start |
| **Session File** | A bounded, model-calibrated instruction document for one executing agent session |
| **Forward Blindness** | The intentional state of an executing agent who cannot see future sessions |
