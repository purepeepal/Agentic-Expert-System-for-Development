# Session-Wise Build Planning Guide
## Stage 5 of 6 — Model-Aware Session Preparation

**Pipeline Version**: 2.0
**Stage**: 5 — Session Planning
**Consumes**: `tasks.md`, `project.manifest.yaml` (`execution_model`, `project_size`)
**Produces**: `session_NN_slug.md` files in `.spec/builds/[feature-name]/`
**Manifest writes**: `session_planning.status`, `session_planning.sessions_total`, `session_planning.model_profile`

**Part of the Idea → Product Pipeline**:
Requirements → Customization → Design → Task List → **Session Planning** → Development

---

## Core Philosophy

> You keep the complete picture. The executing agent must never need it.

A session file is the complete, self-contained operational reality for one AI agent working
in one context window. The agent that receives a session file should not need to think about
architecture, prior decisions, or future tasks. It should be able to focus entirely on the
build in front of it.

But there is a second constraint the original pipeline did not formalise: **session files
must be calibrated to the model executing them.** A session that fits perfectly in a
Gemini 2.5 Pro context may consume 90% of a GPT-4o-mini context before the agent writes
a single line of code. A session written for Claude Opus may over-explain steps that a
reasoning model (o3, o4-mini) would handle better from a concise spec.

This guide adds model-awareness as a first-class concern of session planning.

---

## Stage Gate: What Must Be True Before You Begin

Before generating any session files, verify the following in `project.manifest.yaml`:

```
✅ pipeline.stages.task_list.status = "complete"
✅ artifacts.tasks exists and is readable
✅ model_registry.execution_model is declared
✅ pipeline.stages.session_planning.project_size is declared
✅ Zero open_questions with status "pending"
✅ Zero [PLACEHOLDER] markers in tasks.md
```

If any of these gates are open, do not proceed. Return to the blocking stage and resolve.

---

## Step 1 — Declare the Execution Model

Before sizing any session, record the execution model in the manifest and look up its
profile from the **Model Registry** in Step 2.

```yaml
# project.manifest.yaml update
model_registry:
  execution_model: "claude-sonnet-4-6"   # ← set this before generating sessions
pipeline:
  stages:
    session_planning:
      model_profile: "claude-sonnet-4-6"
      project_size: "medium"             # small | medium | large
```

If you plan to use different models for different sessions (e.g., Opus for complex logic,
Haiku for infrastructure scaffolding), declare an `execution_model` per session in the
session file's frontmatter. The manifest holds the **default** execution model.

---

## Step 2 — Model Registry & Profiles

The Model Registry defines, for each known model, the parameters that govern how sessions
are sized, formatted, and structured.

### Reading the Registry

| Field | What It Controls |
|-------|-----------------|
| `context_window` | Total token capacity of the model |
| `effective_budget` | Tokens available for session file + codebase snapshot (after reserving for system prompt and output) |
| `codebase_overhead` | Estimated tokens consumed by codebase snapshot injection at runtime |
| `session_ceiling` | Maximum task complexity allowed in a single session for this model |
| `grouping_allowed` | Whether multiple tasks may be combined into one session |
| `reasoning_tier` | How much implicit reasoning can be delegated vs. made explicit in steps |
| `compliance_fidelity` | How reliably the model follows strict boundary instructions |
| `prompt_style` | Whether the session file should be verbose-explicit or concise-spec |
| `special_notes` | Model-specific handling instructions |

---

### Model Profiles

#### Claude Haiku 3.5 (`claude-haiku-3-5`)
```yaml
context_window: 200_000
effective_budget:
  small_project:  90_000   # ~10k codebase + 4k output + 2k system reserved
  medium_project: 75_000   # ~25k codebase
  large_project:  50_000   # ~50k codebase
session_ceiling:
  small_project: S         # 1–2 hours
  medium_project: S
  large_project: XS
grouping_allowed: false
reasoning_tier: lightweight
compliance_fidelity: high
prompt_style: verbose-explicit
special_notes: >
  Always number implementation steps. Avoid compound steps ("do X and Y") — split into
  separate lines. Best suited for Infrastructure and Data layer tasks with clear patterns.
  Do not assign Logic or Integration sessions with design ambiguity.
```

#### Claude Sonnet 3.7 / 4.5 / 4.6 (`claude-sonnet-*`)
```yaml
context_window: 200_000
effective_budget:
  small_project:  120_000
  medium_project: 95_000
  large_project:  70_000
session_ceiling:
  small_project: L         # Up to 4–8 hours, but prefer M
  medium_project: M        # 2–4 hours
  large_project: S-M
grouping_allowed:
  small_project: true      # Two XS/S tasks of same layer
  medium_project: false
  large_project: false
reasoning_tier: strong
compliance_fidelity: very-high
prompt_style: standard
special_notes: >
  Default execution model for most sessions. Can handle implicit reasoning for well-defined
  tasks. Strict Boundaries are reliably followed. Extended thinking (if enabled) benefits
  complex Logic layer tasks — indicate in session frontmatter.
```

#### Claude Opus 4.6 (`claude-opus-4-6`)
```yaml
context_window: 200_000
effective_budget:
  small_project:  140_000
  medium_project: 115_000
  large_project:  90_000
session_ceiling:
  small_project: L
  medium_project: L
  large_project: M
grouping_allowed:
  small_project: true      # Two tasks okay if same layer and phase
  medium_project: true     # Two S tasks okay
  large_project: false
reasoning_tier: highest
compliance_fidelity: very-high
prompt_style: concise-spec  # Opus infers well; verbose over-constraining
special_notes: >
  Reserve for sessions with high design ambiguity, complex algorithmic logic, or
  cross-cutting concerns. Session files can be more concise — Opus will fill in
  well-reasoned implementation. Cost-control: use only for L-complexity tasks.
```

#### GPT-4o (`gpt-4o`)
```yaml
context_window: 128_000
effective_budget:
  small_project:  80_000
  medium_project: 60_000
  large_project:  35_000
session_ceiling:
  small_project: M
  medium_project: S-M
  large_project: S
grouping_allowed: false
reasoning_tier: strong
compliance_fidelity: high
prompt_style: verbose-explicit
special_notes: >
  Tighter context window requires aggressive input context trimming. Session files must
  stay under 6,000 tokens to leave room for codebase snapshot. Prefer concrete examples
  over abstract descriptions in implementation steps. GPT-4o follows explicit formatting
  instructions well — use code block examples for expected output.
```

#### GPT-4o mini (`gpt-4o-mini`)
```yaml
context_window: 128_000
effective_budget:
  small_project:  70_000
  medium_project: 50_000
  large_project:  25_000
session_ceiling:
  small_project: S
  medium_project: S
  large_project: XS
grouping_allowed: false
reasoning_tier: moderate
compliance_fidelity: moderate
prompt_style: verbose-explicit
special_notes: >
  Use only for Foundation and Data layer tasks with zero ambiguity. Implementation steps
  must be maximally explicit — assume no implicit reasoning. Include expected output
  examples inline for every non-trivial step. Do not assign sessions with more than
  5 implementation steps. Avoid sessions requiring judgment calls.
```

#### o3 / o4-mini (`o3`, `o4-mini`)
```yaml
context_window: 200_000
effective_budget:
  small_project:  120_000
  medium_project: 95_000
  large_project:  70_000
session_ceiling:
  small_project: L
  medium_project: L
  large_project: M
grouping_allowed:
  small_project: true
  medium_project: true
  large_project: false
reasoning_tier: internal-chain-of-thought
compliance_fidelity: very-high
prompt_style: concise-spec
special_notes: >
  Reasoning happens internally — do not over-specify implementation steps. Provide
  the goal, constraints, interface definitions, and test requirements. Let the model
  reason the path. Verbose step-by-step instructions are counterproductive. Strict
  Boundaries are especially important — the model will pursue the goal efficiently,
  and without clear boundaries may over-build. Best for complex Logic and Integration
  tasks.
```

#### Gemini 2.0 Flash (`gemini-2.0-flash`)
```yaml
context_window: 1_000_000
effective_budget:
  small_project:  800_000
  medium_project: 750_000
  large_project:  700_000
session_ceiling:
  small_project: group-3   # Up to 3 tasks per session
  medium_project: M-L
  large_project: M
grouping_allowed: true
max_tasks_per_session: 3
reasoning_tier: moderate
compliance_fidelity: moderate
prompt_style: verbose-explicit
special_notes: >
  Massive context window means the full codebase and multiple tasks can fit in one
  session. However: grouping increases hallucination risk for this model. Limit groups
  to same-layer tasks. Implementation steps must remain explicit. Compliance fidelity
  is moderate — Strict Boundaries must be listed first in the session, not last.
  Recommended: inject full tasks.md as context rather than summarising it.
```

#### Gemini 2.5 Pro (`gemini-2.5-pro`)
```yaml
context_window: 1_000_000
effective_budget:
  small_project:  900_000
  medium_project: 850_000
  large_project:  800_000
session_ceiling:
  small_project: group-5
  medium_project: group-3
  large_project: L
grouping_allowed: true
max_tasks_per_session: 5
reasoning_tier: very-strong
compliance_fidelity: high
prompt_style: standard
special_notes: >
  Full codebase injection is feasible for most project sizes. Can handle multi-task
  sessions reliably. Best approach: inject full tasks.md, let model understand the
  complete sequence, then scope it to the declared session tasks via Strict Boundaries.
  Very capable at maintaining context across grouped tasks.
```

---

## Step 3 — Calculate the Session Token Budget

For each session file you generate, compute the effective token budget:

```
Effective Budget (from model profile, by project size)
  − Estimated codebase snapshot size at session runtime
  − Session file size (what you're writing)
  = Remaining output tokens (must be ≥ 4,000)
```

### Project Size Guidelines

Estimate your project's codebase snapshot size:

| Project Size | Codebase Snapshot Estimate | Threshold |
|---|---|---|
| **Small** | ~5,000–15,000 tokens | < 20 files, < 2,000 lines of code |
| **Medium** | ~15,000–40,000 tokens | 20–100 files, 2,000–10,000 lines |
| **Large** | ~40,000–100,000 tokens | 100+ files, 10,000+ lines |

> Note: "Codebase snapshot" means the files the IDE or agent runtime will inject at
> session start. For models with smaller windows, you may need to explicitly specify
> which files to include — not the whole codebase.

### Session File Size Targets

| Model | Small Project | Medium Project | Large Project |
|---|---|---|---|
| Haiku 3.5 | ≤ 4,000 tokens | ≤ 3,000 tokens | ≤ 2,000 tokens |
| Sonnet 4.x | ≤ 8,000 tokens | ≤ 6,000 tokens | ≤ 4,000 tokens |
| Opus 4.x | ≤ 10,000 tokens | ≤ 8,000 tokens | ≤ 5,000 tokens |
| GPT-4o | ≤ 5,000 tokens | ≤ 3,500 tokens | ≤ 2,000 tokens |
| GPT-4o mini | ≤ 3,000 tokens | ≤ 2,000 tokens | ≤ 1,500 tokens |
| o3 / o4-mini | ≤ 6,000 tokens | ≤ 5,000 tokens | ≤ 3,500 tokens |
| Gemini Flash | ≤ 15,000 tokens | ≤ 12,000 tokens | ≤ 10,000 tokens |
| Gemini Pro | ≤ 20,000 tokens | ≤ 18,000 tokens | ≤ 15,000 tokens |

> **Rough token estimate**: 1 token ≈ 0.75 words in English prose, 1 token ≈ 3–4 characters
> of code. A 500-word session file ≈ 650–700 tokens.

---

## Step 4 — Apply Task Grouping Rules

Using your model profile's `session_ceiling` and `grouping_allowed`, decide which tasks
are combined into one session and which get their own.

### Default Rule: One Task Per Session

Unless grouping is allowed by the model profile, every task in `tasks.md` becomes
exactly one session file. This is the safe default.

### Grouping Conditions (Only When `grouping_allowed: true`)

Two or more tasks may be combined into one session only when ALL of the following are true:

1. **Same layer**: Both tasks are in the same layer (Infrastructure, Data, API, etc.)
2. **Same phase**: Both tasks are in the same phase (Foundation, Core, Feature, etc.)
3. **Sequential dependency only**: Task B depends on Task A, and no other tasks branch
   between them
4. **Complexity ceiling**: Combined complexity does not exceed model's `session_ceiling`
5. **Budget fits**: Combined session file + codebase snapshot ≤ effective budget

### Grouping Anti-Patterns (Never Group)

- Tasks from different layers (e.g., Data + Logic)
- Tasks where Task B requires human verification of Task A's output first
- Tasks with independent test requirements that need separate verification
- Any M or L task grouped with any other task

---

## Step 5 — Generate Session Files

### Session File Frontmatter

Every session file begins with a YAML frontmatter block. This is how the Handler
tracks state and how the session file declares its model target.

```yaml
---
session_id: "01"
session_slug: "scaffold-project-structure"
task_refs: ["TASK-001"]           # Task IDs from tasks.md
model: "claude-sonnet-4-6"        # Execution model this file is calibrated for
model_tier: "sonnet"              # haiku | sonnet | opus | gpt4o | gpt4o-mini | o3 | gemini-flash | gemini-pro
prompt_style: "standard"          # verbose-explicit | standard | concise-spec
estimated_tokens: 1800            # Estimated token size of this file
project_size: "medium"
layer: "Infrastructure"
phase: "Foundation"
status: "pending"                 # pending | in_progress | complete | failed
---
```

### Session File Body — Prompt-Style Variants

The body structure of a session file varies by `prompt_style`. Use the variant matching
your model's declared style.

---

#### Variant A: `verbose-explicit` (Haiku, GPT-4o, GPT-4o mini, Gemini Flash)

Use this style for models with moderate reasoning tiers. Every step is spelled out.
No implicit reasoning is expected.

```markdown
---
[frontmatter]
---

# Session [NN]: [Title]

## STRICT BOUNDARIES — READ FIRST
<!-- For lower-compliance models, boundaries appear at the top, not the end -->
You are working ONLY on the following:
- [Explicit scope item 1]
- [Explicit scope item 2]

You must NOT:
- [Explicit prohibition 1 — name the specific task ID that owns this]
- [Explicit prohibition 2]
- Modify any file not listed in "Files to Create / Modify" below

If you complete this session and believe additional work is needed, STOP and report
what you observe. Do not proceed.

---

## Session Goal
[One paragraph. Concrete state transition: "Before this session, X does not exist.
After this session, Y exists and passes the Success Criteria below."]

## Task Reference
- Implements: [TASK-ID] — "[Task Title]"
- Layer: [Layer] | Phase: [Phase] | Complexity: [XS/S/M]

## Prior State
[Minimum context from prior sessions. Bullet list of specific facts only.
Example: "Prior sessions have established: (1) project is scaffolded at /src, (2)
User entity migration exists at db/migrations/001_user.sql with schema: id UUID,
email VARCHAR(255) UNIQUE, password_hash VARCHAR(255), created_at TIMESTAMP."]

DO NOT include design rationale, architecture context, or future session awareness.

## Files to Create / Modify
<!-- List every file. Agents without this will touch unintended files. -->
- CREATE `path/to/file.ext` — [one-line purpose]
- MODIFY `path/to/file.ext` — [exactly what changes, one line]

## Implementation Steps
<!-- Numbered. Atomic. One action per step. No compound steps. -->
1. [Single action. Name the exact file, function, and expected output.]
2. [Single action.]
3. [Single action.]
<!-- Maximum 8 steps for verbose-explicit style. If more needed, split the task. -->

## Expected Output Examples
<!-- Include concrete examples for non-trivial steps. Especially for this style. -->
```[language]
// Example: Step 3 expected output in src/auth/token.service.ts
export function generateToken(userId: string): string {
  // your implementation here
}
```

## Test Requirements
- Unit: [Specific test — function name, input, expected output]
- Unit: [Second test case]
- Integration: [If applicable]

## Success Criteria
<!-- Every item must be mechanically verifiable. No subjective items. -->
- [ ] `[command to run]` exits with code 0
- [ ] Unit test `[test name]` passes
- [ ] File `[path]` exists and exports `[symbol]`
- [ ] No TypeScript/lint errors in modified files
```

---

#### Variant B: `standard` (Claude Sonnet, GPT-4o, Gemini Pro)

Balanced style. Steps are specific but do not require example output for every item.

```markdown
---
[frontmatter]
---

# Session [NN]: [Title]

## Session Goal
[One paragraph. Concrete state transition.]

## Task Reference
- Implements: [TASK-ID] — "[Task Title]"
- Layer: [Layer] | Phase: [Phase] | Complexity: [XS/S/M/L]

## Prior State
[Minimum necessary context. What exists in the codebase that this session depends on.
Specific file paths, function signatures, schema names — not general architecture.]

## Implementation Steps
1. [Specific step with file names and function names]
2. [Step 2]
3. [Step 3]
...

## Files to Create / Modify
- CREATE / MODIFY `path` — [purpose]

## Test Requirements
- Unit: [Scenario]
- Integration: [Scenario, if applicable]

## Success Criteria
- [ ] [Verifiable checkpoint]
- [ ] All declared test requirements pass

## Strict Boundaries
[What is explicitly out of scope. Name the TASK-ID responsible for excluded work.
Name files that must not be modified. Design decisions that must not be re-interpreted.]
```

---

#### Variant C: `concise-spec` (Claude Opus, o3, o4-mini)

Minimal style. Goal + constraints + interface + tests. Model reasons the path.

```markdown
---
[frontmatter]
---

# Session [NN]: [Title]

## Objective
[Two to four sentences. What must be true after this session. Be precise about
the interface and behavior — not the implementation path.]

## Implements
TASK-[ID]: "[Task Title]" | Layer: [Layer] | Phase: [Phase]

## Context
[Three to six bullet points of specific facts only. No prose. No rationale.]
- [Specific fact: file path, schema field, function signature, etc.]
- [Specific fact]

## Interface Contract
[The exact public surface this session must produce. Function signatures, endpoint
definitions, schema shape, or component props. This is what the next session will
depend on — get this exactly right.]

```[language]
[Interface definition here]
```

## Test Specification
- [Test 1: Given X, When Y, Then Z]
- [Test 2: Given X, When Y, Then Z]

## Boundaries
Must not: [comma-separated list of explicit exclusions with owning task IDs]
Must not touch: [files that are out of scope]
Must use exactly: [any design decisions from design.md that must not be reinterpreted]

## Done When
- [ ] Interface contract is implemented and exported
- [ ] All test specifications pass
- [ ] No regressions in previously passing tests
```

---

## Step 6 — Sequence and Number Sessions

Sessions must be numbered in dependency order, not in the order tasks appear in `tasks.md`.

**Sequencing algorithm**:

1. List all tasks with `Depends On: None` → these are candidates for session 01
2. If multiple tasks have no dependencies:
   - If grouping is allowed and conditions are met → one session
   - Otherwise → session 01 is the highest-priority no-dependency task; others follow
3. After each placed session, add the tasks it **unblocks** to the candidate list
4. Continue until all tasks are placed

**Numbering format**: `session_NN_kebab-case-slug.md`
- NN is zero-padded: 01, 02, ..., 09, 10, 11
- Slug is 2–4 words derived from the task title

---

## Step 7 — Validate All Session Files

Before handing any session to an executing agent, run the following checks:

### Token Budget Check
```
For each session file:
  [ ] Estimated session file tokens ≤ model's session file size target for project size
  [ ] (session file tokens + project codebase snapshot) ≤ model's effective budget
```

### Content Quality Check
```
For each session file:
  [ ] Frontmatter is complete and accurate
  [ ] Strict Boundaries / Boundaries section names at least 2 specific exclusions with task IDs
  [ ] Prior State / Context contains only facts needed by this session (no forward leakage)
  [ ] Implementation Steps match the task record in tasks.md (verbatim, no additions)
  [ ] Every success criterion is mechanically verifiable (can be confirmed without judgment)
  [ ] Test requirements name specific functions, inputs, and expected outputs
  [ ] No future session is referenced or implied
  [ ] Prompt style matches the model's declared style in its profile
```

### Sequence Check
```
  [ ] Sessions are numbered in dependency order
  [ ] No session's Prior State references a session that comes after it
  [ ] The session_planning.sessions_total in manifest matches the count of session files
```

---

## Step 8 — Update the Manifest

After all session files are generated and validated:

```yaml
# project.manifest.yaml update
pipeline:
  current_stage: "session_planning"
  stages:
    session_planning:
      status: "complete"
      artifact_dir: ".spec/builds/feature-name/"
      sessions_total: [N]
      sessions_complete: 0
      model_profile: "[execution_model]"
      model_tier: "[tier]"
      project_size: "[small|medium|large]"
    development:
      status: "pending"
      sessions_complete: 0
      sessions_total: [N]
```

---

## Step 9 — Orchestrate Development (Handler Protocol)

Now the machine runs in stage 6. As the Handler:

1. Open `session_01_*.md`. Read it. Confirm it looks correct.
2. Hand it to the executing agent with no other context.
3. Wait. The agent works.
4. When the agent signals completion, verify every success criterion:
   - Run commands listed in success criteria yourself, or confirm the agent ran them.
   - Check test results.
   - Confirm files listed in "Files to Create / Modify" exist.
5. If all criteria pass → update manifest: `sessions_complete += 1`, `session_01.status = complete`.
6. Hand `session_02_*.md`. Repeat.

**If a session fails**:

| Failure Type | Diagnosis | Resolution |
|---|---|---|
| Agent went out of scope | Boundary violation | Strengthen Strict Boundaries, re-run session |
| Prior state was wrong | Prior session incomplete | Verify prior session's success criteria, fix, re-run |
| Steps were ambiguous | Session file quality | Rewrite implementation steps with specifics, re-run |
| Model context overflowed | Session too large for model | Split the task, regenerate session file pair |
| Agent hit a design gap | Task underdefined | Update task in tasks.md, regenerate session file, re-run |

---

## Prompts for Model-Aware Session Generation

### Prompt S1 — Full Session Plan (All Models)

```
You are generating session files for a spec-driven development pipeline.
Each session file will be handed to an AI agent one at a time. That agent has
no other context — the session file is its complete operational reality.

Execution model: [MODEL NAME]
Model tier: [TIER]
Prompt style: [verbose-explicit | standard | concise-spec]
Project size: [small | medium | large]
Session file token target: ≤ [N] tokens per file

Read tasks.md in full. Then:

1. Sequence tasks in dependency order.
2. Apply grouping rules for this model:
   [Insert model's grouping_allowed rules here]
3. Generate one session file per task (or task group).
4. Each session file must use prompt style "[STYLE]":
   [Paste the appropriate variant template here]
5. Include the YAML frontmatter for every session file.
6. After all session files, produce:
   - A session index table (session ID, slug, task refs, estimated tokens, status)
   - A count of total sessions for the manifest

Constraints:
- Do not add implementation steps not present in tasks.md
- Do not include context from design.md that the agent does not need
- Strict Boundaries must name specific task IDs for excluded work
- No session file may reference a future session
```

### Prompt S2 — Single Session Regeneration

```
Regenerate the session file for TASK-[ID] from tasks.md.

Execution model: [MODEL]
Prompt style: [STYLE]
Token target: ≤ [N] tokens

Completed prior sessions (inject only what this session needs from these):
[List: session_01 → achieved X, session_02 → achieved Y]

Use the [STYLE] template exactly. Do not invent steps.
The resulting session file must fit within [N] tokens.
Name: session_[NN]_[slug].md
```

### Prompt S3 — Token Audit

```
Review all session files in [directory]. For each file:
1. Estimate the token count.
2. Check whether it exceeds the target for model [MODEL] on a [SIZE] project (target: [N] tokens).
3. For any file that exceeds the target, identify what can be trimmed from Prior State
   or Implementation Steps without losing necessary information.
4. Produce a table: | Session | Estimated Tokens | Target | Over/Under | Trim Recommendation |
```

---

## Integration with Upstream Stages

This guide is Stage 5 of 6. It consumes the output of Stage 4 (Task List) and feeds
Stage 6 (Development). See `00_PIPELINE_SYSTEM_MANIFEST.md` for the full I/O contract.

**The session files this stage produces are the last planning artifacts in the pipeline.**
Everything that follows is execution. The quality of session files directly determines
the quality and coherence of the code produced in Stage 6.

Invest in validation before you begin dispatching sessions. A bug in a session file costs
one re-run. A bug in an early session that propagates through five subsequent sessions
costs the entire chain.
