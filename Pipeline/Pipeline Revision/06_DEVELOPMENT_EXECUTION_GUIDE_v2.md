# Development Execution Guide
## Stage 6 of 6 — Session-by-Session Build Execution

**Pipeline Version**: 2.0
**Stage**: 6 — Development
**Consumes**: `session_NN_slug.md` files from `.spec/builds/[feature-name]/` (one at a time)
**Produces**: Code files, test files, per-session verification reports
**Manifest writes**: `development.sessions_complete` (incremented after each verified session)

**Part of the Idea → Product Pipeline**:
Requirements → Customization → Design → Task List → Session Planning → **Development**

---

## Stage Gate

Before dispatching the first session:

```
✅ pipeline.stages.session_planning.status = "complete"
✅ All session files exist in .spec/builds/[feature-name]/
✅ Handler has manually reviewed sessions 01, 02, and 03
✅ No session file exceeds its declared model's token target
✅ pipeline.stages.development.status = "in_progress" (set now)
```

---

## Core Protocol: One Session. One Agent. One Verification.

```
┌──────────────────────────────────────────────────────────────────────┐
│                   DEVELOPMENT EXECUTION LOOP                         │
│                                                                      │
│  1. DISPATCH     Handler opens session_NN.md. Reads it. Dispatches  │
│                  to executing agent with NO other context.           │
│                                                                      │
│  2. EXECUTE      Agent works. Agent declares completion.             │
│                                                                      │
│  3. VERIFY       Handler runs every success criterion:               │
│                  • Commands that must exit 0                         │
│                  • Tests that must pass                              │
│                  • Files that must exist                             │
│                  All pass → advance. Any fail → diagnose.            │
│                                                                      │
│  4. LOG          Update manifest: sessions_complete += 1             │
│                  session_NN.status = "complete"                      │
│                                                                      │
│  5. ADVANCE      Hand session_[NN+1].md. Repeat.                     │
└──────────────────────────────────────────────────────────────────────┘
```

**Invariant**: The agent that executes session N is unaware of session N+1. This is not
a preference — it is the mechanism that prevents scope drift, hallucination, and
unsolicited architecture decisions.

---

## Handler Dispatch Protocol

When handing a session file to the executing agent, use this wrapper:

```
You are an AI agent working on one bounded session of a software build.
Your complete operational context is in the attached session file.
You have no other context about the project, its architecture, or future sessions.

Read the session file from top to bottom before doing anything.
Pay special attention to the Strict Boundaries section — this defines what you
must not do, even if you believe it would improve the outcome.

When you are done, report:
1. Each file you created or modified (with path)
2. Test results (pass/fail counts)
3. Any issue you encountered that is within your session scope
4. STOP. Do not proceed to any work outside this session's scope.

[Attach: session_NN_slug.md]
```

**Never add**: architecture context, design rationale, other session files, or
explanations of what's coming next. If the session file is correctly written, the
agent has everything it needs.

---

## Verification Protocol

After the agent signals completion, the Handler verifies every success criterion
mechanically. Do not ask the agent to self-verify — verify independently.

### Verification Checklist (per session)

```
For each success criterion in the session file:
  [ ] Run the stated command / check the stated file / confirm the stated test passes
  [ ] Confirm no files outside "Files to Create / Modify" were changed
       (use: git diff --name-only to check)
  [ ] Confirm no TypeScript/lint errors introduced
       (use: npm run typecheck && npm run lint or equivalent)
  [ ] Confirm all declared test requirements pass
       (use: npm test -- [specific test file] or equivalent)
```

---

## Failure Diagnosis and Recovery

When a session fails verification, diagnose the failure type before re-running:

### Failure Type 1: Boundary Violation
**Symptom**: Agent modified files outside the declared scope, or implemented work
belonging to a future task.
**Resolution**:
1. Revert the out-of-scope changes: `git checkout -- [out-of-scope files]`
2. Strengthen the Strict Boundaries section in the session file
3. Re-dispatch the session to a fresh agent context

### Failure Type 2: Prior State Error
**Symptom**: Agent's output is correct but the codebase state from prior sessions
is wrong (e.g., a prior migration is missing a field the current session depends on).
**Resolution**:
1. Return to the prior session's verification checklist
2. Identify which success criterion was incorrectly marked as passing
3. Re-run the prior session's correction, then re-run the current session

### Failure Type 3: Ambiguous Implementation Steps
**Symptom**: Agent produced plausible but incorrect output — the steps were
underspecified and the agent made a reasonable but wrong choice.
**Resolution**:
1. Identify the ambiguous step
2. Rewrite it in the session file with the specific expected output
3. Re-dispatch the session to a fresh agent context

### Failure Type 4: Model Context Overflow
**Symptom**: Agent's output is truncated, inconsistent, or incomplete. The agent
may reference missing context.
**Resolution**:
1. Estimate the session file's actual token size
2. If it exceeds the model's session file target → the task must be split
3. Return to Stage 4: split the task in `tasks.md`, regenerate the session file pair
4. Continue from the split session files

### Failure Type 5: Design Gap
**Symptom**: The task as written is underdefined — an implementation choice that
the session file assumes was resolved in design.md is actually open.
**Resolution**:
1. Identify the open design decision
2. Resolve it in `design.md` (add a TCP-* entry or clarify the interface contract)
3. Update the corresponding task record in `tasks.md`
4. Regenerate the session file
5. Log the design gap in `open_questions[]` as resolved for traceability

---

## Manifest Update After Each Session

```yaml
# project.manifest.yaml — update after each verified session
pipeline:
  stages:
    development:
      sessions_complete: [N]   # increment by 1
    session_planning:
      sessions_complete: [N]   # keep in sync
      # Update individual session status:
      # session_01:
      #   status: "complete"
      #   completed_at: "[ISO datetime]"
```

---

## Completion: Final Gate

The Development stage is complete when:

```
✅ development.sessions_complete = development.sessions_total
✅ All session files have status = "complete" in the manifest
✅ All correctness properties (TCP-*) have passing tests
✅ Full test suite (unit + integration + E2E) passes clean
✅ No regressions against any prior session's success criteria
```

Update the manifest:

```yaml
pipeline:
  current_stage: "complete"
  stages:
    development:
      status: "complete"
      completed_at: "[ISO datetime]"
```

---

## Per-Session Verification Report Template

After verifying each session, write a brief report in the session file or a separate
`.spec/builds/[feature-name]/verification/session_NN_report.md`:

```markdown
# Session [NN] Verification Report

**Session**: session_[NN]_[slug].md
**Task**: TASK-[NNN]
**Model Used**: [model name]
**Date**: [ISO date]
**Handler**: [your name or initials]

## Criteria Results
- [ ] [Criterion 1]: PASS | FAIL — [notes]
- [ ] [Criterion 2]: PASS | FAIL — [notes]
- [ ] All tests pass: PASS | FAIL — [test count: N passed, M failed]

## Files Changed (from git diff)
- [path]: [created | modified]

## Issues Encountered
[None | description of any issue and resolution]

## Status
VERIFIED — advancing to session_[NN+1]
```

---

## The Handler's End-to-End Checklist

```
Before Stage 6 begins:
  [ ] All session files generated and validated (Stage 5 complete)
  [ ] Sessions 01–03 manually reviewed by Handler
  [ ] Manifest: development.status = "in_progress"

During execution (repeat for each session):
  [ ] Session file dispatched alone — no other context provided to agent
  [ ] Agent output received
  [ ] Every success criterion verified mechanically
  [ ] git diff confirms no out-of-scope changes
  [ ] Verification report written
  [ ] Manifest sessions_complete incremented
  [ ] Next session file dispatched

After final session:
  [ ] Full test suite run clean
  [ ] All TCP-* properties verified
  [ ] Manifest: development.status = "complete"
  [ ] Feature-level review / PR created
```
