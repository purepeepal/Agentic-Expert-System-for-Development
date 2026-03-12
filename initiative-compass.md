# 🧭 INITIATIVE COMPASS

> Living document maintained by the Handler Agent. Updated whenever the user/developer expresses objectives, values, constraints, or non-negotiables. This is the reference frame against which ALL domain recommendations are checked.
>
> **This compass is initiative-agnostic.** It adapts to whatever project or development the Agentic Expert System is associated with. The Handler Agent populates each section through inference (Steps 1-4 of the Bootstrap Protocol) and user validation. When re-associated with a different initiative, the previous state is archived to `Knowledge-Vault/context/`.

**Last Updated:** (not yet initialized)
**Status:** Template
**Initiative:** (not yet associated)
**Session Reference:** (none)

---

## Mission

*"What is this initiative fundamentally for?"*

> (To be populated by the Handler Agent during Bootstrap Protocol Step 1.)

**Population protocol:**
- Expressed as a single, clear sentence — the project's reason for existing
- Inferred from the user/developer's description, then validated via minimal-friction confirmation
- Consensus threshold recorded (e.g., "88% consensus across 78 perspectives")
- Updated only when the user/developer explicitly shifts direction or pivots

---

## Values

*"What does this initiative stand for?"*

| # | Value | Description |
|---|-------|-------------|
| | | (To be populated during Bootstrap Protocol Step 2.) |

**Population protocol:**
- 3-5 values inferred from user/developer choices, language, priorities, and project nature
- Values are ranked by inference confidence and presented for user confirmation
- User validates: confirm, correct, reorder, or add
- Values guide every domain recommendation — misaligned proposals are filtered
- Evidence trail required: each value links to the user signal that produced it

---

## Goals

*"What are we measuring?"*

| Goal | Metric | Target | Status |
|------|--------|--------|--------|
| | | | (To be populated during Bootstrap Protocol Step 3.) |

**Population protocol:**
- Goals are extracted from explicit user statements and implied from project structure
- Each goal must have a measurable metric and a clear target
- Status cycle: ⚪ Undefined → 🟡 Specified → 🔵 In Progress → 🟢 Achieved → 🔴 Blocked
- Goals table grows as the initiative evolves — completed goals are archived, not deleted
- The Handler challenges goals that lack measurability or conflict with stated values

---

## Constraints

*"What are we working within?"*

| Constraint | Details |
|-----------|---------|
| **Team Size** | *[to be inferred]* |
| **Budget** | *[to be inferred]* |
| **Tech Stack** | *[to be inferred]* |
| **Timeline** | *[to be inferred]* |
| **Distribution** | *[to be inferred]* |
| **Architecture** | *[to be inferred]* |

**Population protocol:**
- Constraints are inferred from the user/developer's environment, choices, and explicit statements
- Rows are added or removed as real constraints are identified — the table above is a starting template
- **Hard constraints** (user said "must" or "never") are marked in **bold details**
- *Soft constraints* (user said "prefer" or "ideally") are marked in *italic details*
- The Handler distinguishes between stated constraints vs. inferred constraints with notation: `[stated]` or `[inferred]`
- Constraints that may change (e.g., timeline, budget) are flagged for periodic revalidation

---

## Non-Negotiables

*"Things we will NEVER compromise on, regardless of domain recommendations."*

1. (To be populated during Bootstrap Protocol Step 4. Maximum 6 entries.)

**Population protocol:**
- Non-negotiables carry the **highest weight** in the system — they override domain recommendations
- Inferred from: explicit rejections, strong language ("must," "never," "always"), repeated emphasis, emotional intensity
- Maximum 6 non-negotiables — if more emerge, the Handler challenges the user to prioritize
- Non-negotiables are the LAST section populated and require explicit user confirmation
- Each non-negotiable is written as: **[Principle]** — [Why it matters / what it means in practice]
- Removal of a non-negotiable requires a new parliamentary session to assess downstream impact

---

## Quality Bar

*"The implicit standard the user/developer has set."*

| Dimension | Standard |
|-----------|----------|
| **Code** | *[to be inferred]* |
| **Design** | *[to be inferred]* |
| **Documentation** | *[to be inferred]* |
| **User Experience** | *[to be inferred]* |
| **Architecture** | *[to be inferred]* |

**Population protocol:**
- Quality bar is **inferred, not asked** — the user/developer's existing work, language, and corrections reveal it
- The Handler examines: code style, naming conventions, documentation depth, design choices, past rejections
- Dimensions are added or removed based on what matters for the specific initiative (e.g., a hardware project adds "Manufacturing tolerance"; a design project adds "Visual fidelity")
- Validated with: "Here's the quality bar I inferred from your work. Correct anything wrong."
- Aligns with observed correction patterns in User Model (`user-model.md`)

---

## Style

*"How the user/developer thinks and builds."*

| Dimension | Pattern | Confidence |
|-----------|---------|------------|
| **Decision-making** | *[to be inferred]* | Low |
| **Communication** | *[to be inferred]* | Low |
| **Risk tolerance** | *[to be inferred]* | Low |
| **Trade-off bias** | *[to be inferred]* | Low |
| **Iteration philosophy** | *[to be inferred]* | Low |

**Population protocol:**
- Style is continuously refined as the user/developer interacts with the system
- Closely aligns with and cross-references the User Model (`user-model.md`)
- Confidence levels: Low (< 3 observations) → Medium (3-7 observations) → High (8+ observations)
- Used by all domains to tailor recommendations to the user/developer's working style
- Trade-off bias is expressed as: `[Preference A] > [Preference B]` (e.g., "Simplicity > Feature count")

---

## Initiative Association Log

*Tracks when this compass is associated with, adapted for, or detached from a specific initiative.*

| Date | Initiative | Action | Session Reference |
|------|-----------|--------|-------------------|
| | (no associations yet) | | |

**Protocol:**
- When the user/developer describes a new project, the Handler populates this compass via Bootstrap Steps 1-4
- If the compass is re-associated with a different initiative, the previous state is archived to `Knowledge-Vault/context/` with filename `[date]_initiative-compass-archived_[initiative-name].md`
- The log above is append-only — it provides a full history of what this compass has served
- Valid actions: `Associated`, `Updated`, `Archived`, `Re-associated`, `Branched`
- For parallel initiatives, the Handler creates `initiative-compass-[name].md` branches and references them from this master file

---

*This document is ALIVE. It is updated whenever new user signals are detected. Every recommendation from the Agentic Expert System is checked against this compass before being presented. The compass adapts to whatever initiative the system serves — it is the system's north star, not a product specification.*
