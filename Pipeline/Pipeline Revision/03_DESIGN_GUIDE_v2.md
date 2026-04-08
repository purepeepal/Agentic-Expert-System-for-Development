# Design Document Preparation Guide
## Stage 3 of 6 — Architecture and Technical Blueprint

**Pipeline Version**: 2.0
**Stage**: 3 — Design
**Consumes**: `requirements.md`, `customization.md` (if exists)
**Produces**: `design.md`
**Manifest writes**: `pipeline.stages.design.status`, `artifacts.design`, `model_registry.planning_model`

**Part of the Idea → Product Pipeline**:
Requirements → Customization → **Design** → Task List → Session Planning → Development

---

## Stage Gate

Before beginning, verify:

```
✅ pipeline.stages.requirements.status = "complete"
✅ pipeline.stages.customization.status = "complete" OR "skipped"
✅ No open_questions with status "pending"
✅ Tech stack is confirmed (if not, decide now — a [PLACEHOLDER] for stack = blocked design)
```

---

## Output Contract

`design.md` must contain the following named sections. Stage 4 (Task List) extracts
tasks by scanning these sections — names must match exactly.

| Section | Content | Required |
|---|---|---|
| System Architecture | Components, interactions, external dependencies | Always |
| Data Models | Entity definitions, relationships, validation rules | Always |
| API Design / Interface Contracts | Endpoints or function signatures | Always |
| Algorithm Specifications | Non-trivial logic and business rules | When present |
| Correctness Properties | Technical properties mapped from requirements | Always |
| Testing Strategy | Unit/integration/E2E test plan | Always |
| Non-Functional Requirements | Performance, security, monitoring | Standard+ |

**Zero tolerance rule**: No `[PLACEHOLDER]` marker may exist in `design.md` when it is
marked `complete`. Every open design decision must be resolved before the gate.

**Open questions rule**: Any decision that cannot be made during design must be logged
in `project.manifest.yaml` under `open_questions[]` and resolved before the gate.

---

## Design Depth Selection

| Depth | When to Use | Time |
|---|---|---|
| **Minimal** | Single file change, simple CRUD endpoint | 30–60 min |
| **Standard** | Feature with integration points, data model, API | 2–4 hours |
| **Comprehensive** | Complex system, multiple integrations, formal properties | 1–3 days |

If using AES (Agentic Expert System) with custom agents from Stage 2, use Approach 2
(AES-Assisted) — the planning model generates a scaffold with `[PLACEHOLDER]` markers
for your decisions, then you fill them in.

---

## Section 1: System Architecture (Always Required)

```markdown
## System Architecture

### Overview
[2–3 sentences describing the overall approach. Minimal: 2 sentences.
Standard+: include the architectural pattern (monolith, microservices, event-driven, etc.)]

### Components
- **[Component Name]**: [Single responsibility description] — traces to [US-N]
- **[Component Name]**: [Single responsibility description] — traces to [US-N]

### Component Interactions
[How components communicate: REST, events, message queues, function calls, etc.
Standard+: include a sequence diagram for the primary user flow.]

### External Dependencies
- [Service/Library]: [Purpose] — [integration method]
```

**Depth escalation for Comprehensive**: Add deployment topology, data flow diagrams,
circuit breaker patterns, and failover strategies.

---

## Section 2: Data Models (Always Required)

```markdown
## Data Models

### Entity: [EntityName]
**Purpose**: [What this entity represents]
**Traces To**: [US-N]

**Attributes**:
- `field_name` (type, constraints): [description]
- `field_name` (type, constraints): [description]

**Relationships**:
- [One-to-many / Many-to-many with EntityName via junction]

**Validation Rules**:
- [Rule 1]
- [Rule 2]

**Indexes**:
- [Index on field(s) for query pattern]
```

**Critical rule**: Every field listed here is the authoritative schema. Stage 4 tasks
must reference this section exactly. Session files must copy field names verbatim.
This is the single source of truth for schema — no agent may invent fields.

---

## Section 3: API Design / Interface Contracts (Always Required)

The interface contract is what downstream sessions depend on. Get this right — every
session that calls an API or imports a module uses this as its source of truth.

**For REST APIs**:
```markdown
### Endpoint: [METHOD] /path
**Purpose**: [What this does]
**Authentication**: [Required/Optional — method]
**Request Body**: [Schema]
**Success Response**: [Status + schema]
**Error Responses**: [Status codes and schemas]
**Rate Limiting**: [If applicable]
```

**For function/service interfaces** (libraries, services):
```markdown
### Function: [functionName]
**Module**: `path/to/module`
**Signature**: `functionName(param: Type, param: Type): ReturnType`
**Purpose**: [What it does]
**Side Effects**: [Any state changes, external calls]
**Throws**: [Error types and conditions]
```

**For event-driven systems**:
```markdown
### Event: [EventName]
**Topic/Queue**: [name]
**Schema**: [payload structure]
**Producers**: [components]
**Consumers**: [components]
**Ordering Guarantee**: [FIFO | best-effort | none]
**Idempotency**: [strategy]
```

---

## Section 4: Algorithm Specifications (When Present)

For any non-trivial business logic — scoring, ranking, pricing, routing, scheduling —
document the algorithm before implementation. This prevents agents from inventing
their own approach.

```markdown
## Algorithm: [AlgorithmName]
**Purpose**: [What business problem it solves]
**Input**: [Types and constraints]
**Output**: [Type and guarantees]
**Traces To**: [US-N, CP-*]

**Approach**:
[Describe the algorithm in enough detail that an agent can implement it without
making judgment calls about the core logic. For complex algorithms, include
pseudocode or a step-by-step description.]

**Complexity**: O([time]) time, O([space]) space
**Edge Cases**:
- [Edge case 1]: [How it's handled]
- [Edge case 2]: [How it's handled]
**Correctness Properties**: [Which CP-* this algorithm must satisfy]
```

---

## Section 5: Correctness Properties (Always Required)

This section maps the CP-* properties from `requirements.md` to concrete technical
mechanisms. Stage 4 generates Verification-phase test tasks from this section.

```markdown
## Technical Correctness Properties

### From CP-S* (Safety — Must Never Happen)
- **TCP-S1** (from CP-S1): [Technical statement of the property]
  - **Mechanism**: [How the system enforces this — validation, constraint, guard]
  - **Test**: [How to verify]

### From CP-L* (Liveness — Must Eventually Happen)
- **TCP-L1** (from CP-L1): [Technical statement]
  - **Mechanism**: [Retry logic, timeout, queue, async pattern]
  - **Test**: [How to verify]
  - **Timeout**: [Maximum acceptable duration]

### From CP-I* (Invariants — Always True)
- **TCP-I1** (from CP-I1): [Technical statement]
  - **Mechanism**: [Database constraint, transaction boundary, lock]
  - **Test**: [How to verify]

### From CP-ID* (Idempotency — Safe to Repeat)
- **TCP-ID1** (from CP-ID1): [Technical statement]
  - **Mechanism**: [Idempotency key, conditional write, deduplication]
  - **Test**: [How to verify]
```

---

## Section 6: Testing Strategy (Always Required)

This section is the source for test task generation in Stage 4. Be specific — vague
test plans produce vague test tasks.

```markdown
## Testing Strategy

### Unit Tests
**Framework**: [e.g., Jest, pytest, JUnit]
**Coverage Target**: [e.g., 80% line coverage for Logic layer]

Modules to unit test:
- `[module path]`: [what behaviours to test]
- `[module path]`: [what behaviours to test]

### Integration Tests
**Scope**: [What boundary is being tested — e.g., API handler to database]

Scenarios:
- [Scenario 1: happy path name] — tests [AC-N.N]
- [Scenario 2: error path name] — tests [AC-N.E*]

### E2E Tests (if applicable)
**Tool**: [e.g., Playwright, Cypress]
**User Flows**:
- [Flow 1: user story name] — tests [US-N]

### Correctness Property Tests
- TCP-S1: [Test approach]
- TCP-L1: [Test approach]
- TCP-I1: [Test approach]
```

---

## Section 7: Non-Functional Requirements (Standard+)

```markdown
## Non-Functional Requirements

### Performance
- Response time target: [e.g., p95 < 200ms for API endpoints]
- Throughput target: [e.g., 1,000 requests/second]
- Scalability strategy: [horizontal | vertical | auto-scaling trigger]

### Security
- Authentication: [method]
- Authorization: [model — RBAC, ABAC, etc.]
- Data protection: [encryption at rest/transit, PII handling]
- Compliance: [GDPR, HIPAA, SOC2, etc. if applicable]

### Observability
- Metrics: [what to instrument]
- Logging: [log levels, structured format, what to log]
- Alerts: [conditions that trigger alerts]
- Tracing: [distributed tracing if applicable]
```

---

## Completion Checklist

```
- [ ] System Architecture: all components named with responsibilities and traces to US-N
- [ ] Data Models: all entities defined with types, constraints, relationships, indexes
- [ ] API/Interface Contracts: every endpoint or function has complete request/response schema
- [ ] Correctness Properties: every CP-* from requirements.md has a TCP-* entry here
- [ ] Testing Strategy: unit, integration, and property tests specified
- [ ] Zero [PLACEHOLDER] markers anywhere in design.md
- [ ] No open_questions with status "pending" in manifest
- [ ] Tech stack confirmed and consistent throughout (no contradictions)
- [ ] All component names in architecture match the names used in data models and API sections
- [ ] Manifest updated: design.status = complete, artifacts.design = path, planning_model set
```

---

## Agent Prompts

### Prompt D1 — AES-Assisted Design Scaffold Generation

```
Generate a design.md scaffold from requirements.md [and customization.md if provided].

Use the following AES domains for each section:
- System Architecture: D03 (Infrastructure), D08 (Systems UX), D09 (Logic & Complexity), D12 (Unconventional)
- Data Models: D04 (Cognition), D09 (Logic & Complexity)
- API Design: D03, D04, D08
- Algorithm Specs: D09 (Logic & Complexity), D05 (AI Integration) [if ML]
- Correctness Properties: D09, D10 (Security)
- Testing Strategy: D07 (Open Source), D09
- NFRs: D03, D10, D11 (DevOps)
[If customization.md exists: also apply custom agents (C1+) per their activation conditions]

Rules:
- Insert [PLACEHOLDER: decision question] for every decision that requires my input
- Use component names that are consistent across all sections
- Every component must trace to at least one US-N
- Every TCP-* must map to a CP-* from requirements.md

Produce the complete design.md ready for my review and placeholder resolution.
```

### Prompt D2 — Design Completeness Review

```
Review design.md against requirements.md for completeness.

Check:
1. Every US-N is addressed by at least one component or endpoint in the design
2. Every CP-* from requirements.md has a corresponding TCP-* in design.md
3. All [PLACEHOLDER] markers (list each one for my resolution)
4. Naming consistency: same component names used across Architecture, Data Models, API sections
5. Testing strategy covers all TCP-* properties

Report each gap. For each missing element, provide the specific text to add.
```

### Prompt D3 — Interface Contract Lock

```
Extract all interface contracts from design.md and produce a locked interface registry.

Format:
| Contract ID | Type | Name/Path | Module | Signature or Schema | Produces For |
|---|---|---|---|---|---|

This registry will be imported verbatim into tasks.md and session files.
Flag any interface that has ambiguity in its contract — those must be resolved
before Stage 4 begins.
```

---

## Gate to Next Stage

You may advance to Stage 4 (Task List) when:

- All completion checklist items are checked
- Zero `[PLACEHOLDER]` markers in `design.md`
- All `open_questions[]` items resolved
- Manifest: `design.status = complete`, `current_stage = "task_list"`
