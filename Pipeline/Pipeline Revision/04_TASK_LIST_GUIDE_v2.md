# Task List Document Preparation Guide
## Stage 4 of 6 — Design to Executable Build Plan

**Pipeline Version**: 2.0
**Stage**: 4 — Task List
**Consumes**: `design.md`, `requirements.md`, `customization.md` (if exists)
**Produces**: `tasks.md` (task records + dependency graph + traceability matrix)
**Manifest writes**: `pipeline.stages.task_list.status`, `artifacts.tasks`, `session_planning.sessions_total` (estimate)

**Part of the Idea → Product Pipeline**:
Requirements → Customization → Design → **Task List** → Session Planning → Development

---

## Stage Gate

Before generating any tasks, verify:

```
✅ pipeline.stages.design.status = "complete"
✅ artifacts.design exists with zero [PLACEHOLDER] markers
✅ All open_questions with status "pending" are resolved
✅ Tech stack confirmed in design.md (no ambiguous choices)
✅ Interface contracts in design.md are locked (Prompt D3 from Design stage run)
```

---

## Core Philosophy

> The task list is the translation layer between architecture and execution.
> It must be complete enough that Stage 5 (Session Planning) requires no new design
> decisions — only sizing and model calibration.

Every task in `tasks.md` represents a **state transition**: a specific, verifiable change
from the codebase's current state to a richer state. Each task is atomic (leaves the
codebase non-broken), traceable (links back to design and requirements), sessionable
(fits in one agent context window), bounded (names what is out of scope), and testable
(names specific test scenarios).

---

## Output Contract

`tasks.md` must contain, in order:

| Element | Content |
|---|---|
| Overview | Summary of what this task list builds, total task count, estimated effort |
| Task Summary Table | All tasks with ID, title, layer, phase, priority, complexity, depends-on |
| Dependency Graph | ASCII or Mermaid diagram of task dependencies |
| Phase sections (1–5) | All task records, grouped by phase, ordered by dependency |
| Open Questions | Any questions that arose during breakdown — must be empty before gate |
| Traceability Matrix | US-N → AC-N.N → TASK-NNN → Test coverage mapping |

**Zero XL tasks**: Any task estimated at > 8 hours must be split before `tasks.md`
is marked complete. Stage 5 cannot size sessions for XL tasks.

---

## The Task Record (Full Format)

Every task in `tasks.md` uses this exact record structure. Stage 5 copies fields
verbatim into session files — field names and structure are load-bearing.

```markdown
### TASK-[NNN]: [Imperative Verb Phrase Title]

**Layer**: [Infrastructure | Data | API | Logic | UI | Integration | Testing | Deployment]
**Phase**: [Foundation | Core | Feature | Polish | Verification]
**Priority**: [Critical | High | Medium | Low]
**Complexity**: [XS | S | M | L]
**Status**: [Pending | In Progress | Complete | Blocked]

**Traces To**:
- Design: [design.md Section X.Y — Component/Entity/Endpoint name]
- User Story: [US-N]
- Acceptance Criteria: [AC-N.N, AC-N.N]

**Depends On**: [TASK-NNN, TASK-NNN] | None
**Blocks**: [TASK-NNN, TASK-NNN] | None

**Goal**
[One paragraph. State transition: "Before this task, X. After this task, Y."
Concrete and functional. No architecture rationale — that lives in design.md.]

**Implementation Steps**
1. [Specific step. Name file, function, table, endpoint.]
2. [Step 2]
3. [Step 3]

**Files to Create / Modify**
- CREATE `path/to/file.ext` — [one-line purpose]
- MODIFY `path/to/file.ext` — [what changes]

**Test Requirements**
- Unit: [Specific scenario: function name, input, expected output]
- Integration: [Specific scenario, if applicable]
- Property test: [CP-* being verified, if applicable]

**Success Criteria**
- [ ] [Mechanically verifiable checkpoint — runs a command, checks a file, passes a test]
- [ ] [Second checkpoint]
- [ ] All declared test requirements pass

**Strict Boundaries**
[Explicit list of what is OUT OF SCOPE. Name the TASK-NNN that owns excluded work.
Name files that must not be touched. Name design decisions that must not be reinterpreted.]
```

---

## Layers and Phases

### Layers (What Kind of Work)

| Layer | Includes | Examples |
|---|---|---|
| **Infrastructure** | Project scaffolding, config, environment | Folder structure, `.env` schema, Docker |
| **Data** | Schemas, migrations, seed data | Entity tables, indexes |
| **API** | Route handlers, controllers | REST handlers, GraphQL resolvers |
| **Logic** | Business rules, services, algorithms | Auth service, pricing engine |
| **UI** | Components, pages, state | React components, forms |
| **Integration** | External service adapters | OAuth, email, S3, third-party APIs |
| **Testing** | Test files, fixtures, mocks | Unit tests, integration tests |
| **Deployment** | CI/CD, build scripts, release | GitHub Actions, Dockerfiles |

### Phases (Build Order)

| Phase | Order | Gate Condition to Next Phase |
|---|---|---|
| **Foundation** | 1st | All scaffolding exists; project runs |
| **Core** | 2nd | All data models migrated; base services initialised |
| **Feature** | 3rd | All APIs functional; primary user flows complete |
| **Polish** | 4th | Error handling, edge cases, logging complete |
| **Verification** | Last | All tests pass; correctness properties verified |

**Rule**: No Feature-phase task may depend on a Verification-phase task. Phases are a
strict topological constraint, not a guideline.

---

## The Extraction Process (Step-by-Step)

### Step 1 — Build the Design Catalogue

Before writing tasks, make one complete pass through `design.md` and catalogue every
buildable artifact:

```markdown
## Design Catalogue (working scratch — do not include in tasks.md)

### Architecture Components
- [ ] [Component Name] (design.md §1.1)

### Data Models
- [ ] Entity: [Name] (design.md §1.2)
- [ ] Migration script

### API Contracts
- [ ] [METHOD] /path (design.md §1.3)

### Algorithms
- [ ] [Algorithm Name] (design.md §4)

### Test Suite
- [ ] Unit: [module]
- [ ] Integration: [scenario]

### Infrastructure
- [ ] Environment config
- [ ] Deployment setup
```

**Rule**: Every entry in this catalogue must map to at least one task. If the catalogue
reveals a section of `design.md` with no tasks, either create the task or flag it in
Open Questions.

---

### Step 2 — Assign Layers, Phases, and Complexity

For each catalogue entry, assign:
- **Layer**: From the layer table above
- **Phase**: Based on dependency order and build sequencing logic
- **Complexity**: XS (< 1hr), S (1–2hr), M (2–4hr), L (4–8hr)

**XL Split Protocol**: Any task that estimates > 8 hours must be split using this hierarchy:
1. Split by **data vs. logic vs. interface** (data model first, then logic, then API surface)
2. Then by **happy path vs. error handling vs. edge cases**
3. Then by **layer** (separate service from route handler)

Re-estimate child tasks. No child may be XL.

---

### Step 3 — Map Dependencies

For each task, identify what it depends on by asking:

- Does this task **use** an entity, function, or endpoint created by another task?
- Does this task **import** a module scaffolded by another task?
- Does this task **test** the output of another task?

If yes to any → dependency exists. Record it in both directions (Depends On + Blocks).

**Circular dependency = design gap**. Return to `design.md` and resolve before continuing.

---

### Step 4 — Bind Tests to Every Functional Task

Every task in the API, Logic, UI, and Integration layers must have explicit, named test
requirements. Do not defer testing to standalone "test phase" tasks alone — each functional
task specifies the tests that verify it.

**Test binding pattern**:
```
Unit: `auth.service.test.ts` → `generateToken(userId)` returns signed JWT with
      correct `sub` and `exp` claims when userId is valid
Unit: `generateToken(null)` throws `InvalidUserError`
Integration: POST /auth/login with valid credentials → 200 + token in response body
Integration: POST /auth/login with wrong password → 401 + error body
```

---

### Step 5 — Write Strict Boundaries

The Strict Boundaries field is the most important field for preventing agent scope creep.
For every task, name:

1. At least two specific things that are out of scope (with their owning TASK-NNN)
2. Files that must not be touched
3. Design decisions from `design.md` that must not be reinterpreted (e.g., "Use the
   token expiry from design.md §2.3 exactly: access 15min, refresh 7d")

**Poor boundary**: "Do not change unrelated files."
**Good boundary**: "Do not implement the password reset flow — that is TASK-014. Do not
modify `db/migrations/001_initial.sql` — owned by TASK-002. Use the JWT secret sourcing
pattern from design.md §3.1 exactly — do not introduce a different secret management approach."

---

### Step 6 — Build the Traceability Matrix

After all tasks are written, produce the matrix:

```markdown
## Traceability Matrix

| User Story | Acceptance Criterion | Task(s) | Test Type |
|---|---|---|---|
| US-1 | AC-1.1 | TASK-003, TASK-007 | Unit + Integration |
| US-1 | AC-1.2 | TASK-005 | Unit |
| US-1 | AC-1.E1 | TASK-005 | Unit (error case) |
| US-2 | AC-2.1 | TASK-009, TASK-012 | Integration |
```

**Every AC-N.N must appear in this matrix.** Any criterion with no corresponding task
is a coverage gap — add the task.

---

### Step 7 — Validate Completeness

```markdown
## Task List Validation Checklist

### Coverage
- [ ] Every section of design.md maps to at least one task
- [ ] Every US-N appears in the traceability matrix
- [ ] Every AC-N.N appears in the traceability matrix
- [ ] Every CP-* / TCP-* from requirements.md/design.md has a Verification task

### Quality
- [ ] No XL tasks exist
- [ ] Every task has at least one mechanically verifiable success criterion
- [ ] Every API/Logic/UI/Integration task has named test requirements
- [ ] Every task has a Strict Boundaries section with ≥ 2 specifics

### Sequencing
- [ ] No circular dependencies
- [ ] No Feature-phase task depends on a Verification-phase task
- [ ] Dependency graph is consistent with Depends On / Blocks fields

### Traceability
- [ ] Every task has a Traces To entry with design.md section reference
- [ ] Every task has a Traces To entry with US-N reference
```

---

## Agent Prompts

### Prompt T1 — Full Task List Generation

```
You are generating tasks.md from design.md and requirements.md for a spec-driven pipeline.

Each task will be handed to a session file generator (Stage 5), which will calibrate it
to a specific AI model's context window. Every task must therefore be self-contained and
require no design decisions from the agent executing it.

Rules:
- ATOMICITY: every task leaves the codebase non-broken when complete
- TRACEABILITY: every task references its design.md section, US-N, and AC-N.N
- NO XL TASKS: any task > 8 hours must be split before appearing in the list
- STRICT BOUNDARIES: every task explicitly names what is out of scope with TASK-NNN refs
- TEST BINDING: every API/Logic/UI/Integration task has named test scenarios

Produce:
1. Task Summary Table
2. Dependency Graph (ASCII or Mermaid)
3. All task records in phase order (Foundation → Core → Feature → Polish → Verification)
4. Traceability Matrix

Start by building the Design Catalogue (all buildable artifacts from design.md).
Ask for clarification if any design section is ambiguous. Do not invent requirements.
```

### Prompt T2 — Coverage Validation

```
Review tasks.md against requirements.md and design.md.

Report:
1. Sections of design.md with no corresponding task
2. US-N items with no entry in the traceability matrix
3. AC-N.N items with no entry in the traceability matrix
4. CP-*/TCP-* properties with no Verification-phase test task
5. Any XL tasks remaining

For each gap, provide the specific task record to add.
```

### Prompt T3 — Task Split

```
TASK-[NNN] has been flagged as XL (> 8 hours).

Split it into 2–4 child tasks using this hierarchy:
1. Data vs. logic vs. interface
2. Happy path vs. error handling
3. Core behaviour vs. edge cases

Each child task must:
- Have XS, S, or M complexity
- Have its own independent Success Criteria and Test Requirements
- Reference the parent task in its Strict Boundaries
- Follow the full task record format

Assign child IDs starting from [next available NNN].
Update all Depends On and Blocks references accordingly.
Provide the updated records ready to replace TASK-[NNN] in tasks.md.
```

### Prompt T4 — Strict Boundaries Audit

```
Review the Strict Boundaries field of every task in tasks.md.

For each task where Strict Boundaries is vague, missing, or has fewer than 2 specifics:
- Rewrite it to include at least 2 explicit exclusions with owning TASK-NNN references
- Include any files that must not be touched
- Include any design decisions from design.md that must not be reinterpreted

Return only the tasks you modified, with their updated Strict Boundaries section.
```

---

## Gate to Next Stage

You may advance to Stage 5 (Session Planning) when:

- All validation checklist items checked
- Zero XL tasks remain
- Traceability matrix is complete
- No entries in Open Questions
- Manifest: `task_list.status = complete`, `artifacts.tasks` set
- Manifest: `session_planning.sessions_total` updated with estimated count
- Manifest: `current_stage = "session_planning"`
