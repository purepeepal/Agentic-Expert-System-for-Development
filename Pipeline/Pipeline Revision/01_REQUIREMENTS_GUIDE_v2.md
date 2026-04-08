# Requirements Document Preparation Guide
## Stage 1 of 6 — Idea to Structured Problem Statement

**Pipeline Version**: 2.0
**Stage**: 1 — Requirements
**Consumes**: Raw idea (natural language), user research, product notes, memory
**Produces**: `requirements.md`
**Manifest writes**: `pipeline.stages.requirements.status = complete`, `artifacts.requirements`

**Part of the Idea → Product Pipeline**:
**Requirements** → Customization → Design → Task List → Session Planning → Development

---

## Stage Gate: Initialising the Manifest

Before writing a single line of requirements, create the project manifest. This is your
first act in the pipeline — not a formality. The manifest is the machine's memory.

```bash
mkdir -p .spec/builds
touch .spec/project.manifest.yaml
```

Populate the manifest header:

```yaml
meta:
  project_id: "[slug]"
  project_name: "[name]"
  created_at: "[ISO datetime]"
  pipeline_version: "2.0"

pipeline:
  current_stage: "requirements"
  stages:
    requirements:
      status: "in_progress"
      artifact: ".spec/requirements.md"
```

When `requirements.md` is validated and complete, update:

```yaml
pipeline:
  current_stage: "customization"   # or "design" if skipping customization
  stages:
    requirements:
      status: "complete"
      completed_at: "[ISO datetime]"
```

---

## Output Contract

`requirements.md` must contain the following named sections for downstream stages
to consume it reliably. Do not rename these sections — the agent prompts in later
stages reference them by name.

| Section | ID Format | Required |
|---|---|---|
| Problem Statement | — | Always |
| User Stories | US-N | Always |
| Acceptance Criteria | AC-N.N | Always |
| Correctness Properties | CP-S*, CP-L*, CP-I*, CP-ID* | Always |
| Constraints & Assumptions | TC-N, BC-N, A-N | Complex features |
| Success Metrics | M-A*, M-Q*, M-B* | Business-critical features |

The ID formats are load-bearing. `tasks.md` in Stage 4 and session files in Stage 5
reference these IDs to establish traceability. If you use different IDs, the
traceability matrix breaks.

---

## What Type of Requirement?

### Feature Requirements — New Functionality
**Use when**: Building something new
**Time**: 1–3 hours | **Focus**: User needs, business value, acceptance criteria

### Bugfix Requirements — Fixing Broken Behaviour
**Use when**: Something is broken or behaving incorrectly
**Time**: 30–60 minutes | **Focus**: Reproduction steps, expected vs. actual behaviour

### Enhancement Requirements — Improving Existing Features
**Use when**: Making existing functionality better
**Time**: 1–2 hours | **Focus**: Current limitations, backward compatibility

---

## Section 1: Problem Statement (Always Required)

```markdown
## Problem Statement

### Current Situation
[Describe what exists or does not exist today]

### Pain Points
- [Specific problem users face]
- [Another problem]

### Impact
- **Users affected**: [Number or percentage]
- **Frequency**: [How often]
- **Severity**: [How bad]

### Opportunity
[What value is unlocked by solving this?]
```

---

## Section 2: User Stories (Always Required)

Use the standard format. The US-N IDs must be sequential integers (US-1, US-2, US-3…).
Do not use sub-IDs like US-1a — Stage 4 uses US-N as a flat lookup key.

```markdown
## User Stories

### Primary User Stories

#### US-1: [Short Title]
**As a** [user type],
**I want to** [action],
**So that** [benefit].
**Priority**: High | **Complexity**: Medium

#### US-2: [Short Title]
...

### Edge Case Stories

#### US-E1: [Short Title]
...

### System Stories

#### US-S1: [Short Title]
...
```

---

## Section 3: Acceptance Criteria (Always Required)

Each criterion must be testable and binary (pass/fail). Use Given/When/Then format.
AC-N.N links US-N to specific verifiable behaviours. Stage 4 (Task List) will check
that every AC-N.N is addressed by at least one task's success criteria.

```markdown
## Acceptance Criteria

### US-1: [Story Title]

#### Happy Path
- **AC-1.1**: Given [context], When [action], Then [outcome]
- **AC-1.2**: Given [context], When [action], Then [outcome]

#### Error Handling
- **AC-1.E1**: Given [error condition], When [action], Then [error response]

#### Edge Cases
- **AC-1.EC1**: Given [edge case], When [action], Then [outcome]
```

---

## Section 4: Correctness Properties (Always Required)

These are the formal guarantees the system must always uphold. They become the
source for Verification-phase test tasks in Stage 4 and are checked against during
Stage 6 development.

```markdown
## Correctness Properties

### Safety Properties (Must Never Happen)
- **CP-S1**: [What must never occur]
  - **Verification**: [How to test]
  - **Violation Example**: [What would break it]

### Liveness Properties (Must Eventually Happen)
- **CP-L1**: [What must eventually occur]
  - **Verification**: [How to test]
  - **Timeout**: [Maximum acceptable time]

### Invariants (Always True)
- **CP-I1**: [What is always true]
  - **Verification**: [How to test]

### Idempotency (Safe to Repeat)
- **CP-ID1**: [Operation safe to repeat]
  - **Verification**: [How to test]
```

---

## Section 5: Constraints & Assumptions (Required for Complex Features)

```markdown
## Constraints & Assumptions

### Technical Constraints
- **TC-1**: [Constraint] — **Impact**: [effect] — **Rationale**: [why]

### Business Constraints
- **BC-1**: [Constraint] — **Impact**: [effect] — **Rationale**: [why]

### Assumptions
- **A-1**: [Assumption] — **Validation**: [how to verify] — **Risk if wrong**: [impact]
```

---

## Section 6: Success Metrics (Required for Business-Critical Features)

```markdown
## Success Metrics

### Adoption Metrics
- **M-A1**: [Metric] — **Target**: [number] — **Measurement**: [how] — **Timeline**: [when]

### Quality Metrics
- **M-Q1**: [Metric] — **Target**: [threshold] — **Measurement**: [how]

### Business Metrics
- **M-B1**: [Metric] — **Target**: [goal] — **Measurement**: [how]
```

---

## Completion Checklist

Before marking `requirements.md` complete in the manifest:

```
- [ ] Problem Statement: current situation, pain points, impact, opportunity all present
- [ ] User Stories: primary, edge case, and system stories all written
- [ ] Every US-N has a priority and complexity rating
- [ ] Every US-N has corresponding AC-N.N entries
- [ ] At least one AC entry per story is a happy-path case
- [ ] At least one AC entry per story is an error-handling case
- [ ] At least two correctness properties defined (one safety, one invariant minimum)
- [ ] All CP-* properties have a Verification method
- [ ] No open questions with status "pending" in the manifest
- [ ] No [PLACEHOLDER] markers anywhere in the document
- [ ] All section headers use the exact names defined in the Output Contract
```

---

## Agent Prompts

### Prompt R1 — Requirements Review

```
Review the attached requirements.md against the Stage 1 output contract.

Check for:
1. Missing sections (Problem Statement, User Stories, Acceptance Criteria, Correctness Properties)
2. User stories without acceptance criteria
3. Acceptance criteria that are not binary testable (Given/When/Then format)
4. Correctness properties without a Verification method
5. Any [PLACEHOLDER] markers
6. Any open questions that should be logged in the manifest

Report each finding. For each gap, provide the specific text to add.
Use the exact ID formats: US-N, AC-N.N, CP-S*, CP-L*, CP-I*, CP-ID*.
```

### Prompt R2 — Customization Analysis Request

```
Read requirements.md and determine whether Stage 2 (Customization) is warranted.

Evaluate:
1. Does this project involve a specialized domain (healthcare, finance, EdTech, IoT, gaming)?
2. Are there regulatory or compliance requirements the 13 core domains may not cover?
3. Are there repeated patterns across multiple user stories that should be distilled?
4. Estimate the ROI of customization: how many future features would benefit?

Produce a recommendation: [Skip Customization | Proceed to Customization]
If proceeding, list the specific custom agents (D14+) you would create and why.
```

---

## Gate to Next Stage

You may advance to Stage 2 (Customization) or Stage 3 (Design) when:

- All completion checklist items are checked
- Manifest `requirements.status = complete`
- No items in `open_questions[]` have `status: pending`

If skipping customization, update manifest `customization.status = skipped` before
opening the Design stage.
