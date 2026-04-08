# Agentic Expert System (AES) — A 112‑Perspective Development Orchestration Layer

**112 perspectives. 16 domains. 3 clusters. 16 wildcards. 1 parliament. Any project.**

AES is a **drop-in reasoning layer** for AI-assisted software development. You copy the `Agentic-Expert-System/` folder into your project during development and use **your local AI, personal AI, or IDE-native AI assistant** to “exercise” it as the structured reasoning protocol between you and the model.

Instead of getting a single “median” answer from an AI assistant, your questions are routed through a structured multi-domain debate (strategy, infra, security, docs, UX, etc.) before you see a recommendation.

AES is **not** a code generator, linter, or runtime library. It’s a **folder you vendor into your repo**: an operating manual + domain experts + memory protocol that turns an AI assistant into a disciplined orchestration system.

---

## Who This Is For (and Who It’s Not)

### AES is for you if…

- You use AI assistants for engineering decisions and you want **fewer blind spots**.
- You’re a **solo dev** and want “a whole advisory board” without meetings.
- You’re a **tech lead / architect** and want decision rationale + dissent captured.
- You maintain **open source** and want stronger trade-off analysis (DX, security, docs).
- You’re building a product and want strategy, technical, and human factors evaluated together.

### AES is probably not for you if…

- You only want quick code snippets and dislike structured outputs.
- You can’t (or won’t) give your AI tool access to local files.
- You want an automated CLI/app that runs on its own (AES is a **prompt+protocol system**).

---

## 5-Minute Quickstart (TTFSA ≤ 10 minutes)

AES works when your AI assistant can read local files in this repo.

1. **Drop this folder into your project** (drop-in; or keep it as a sibling directory).
2. In your AI tool (local/personal/IDE-native), add this instruction (system prompt / project instructions / context):

   **“Read `Agentic-Expert-System/.agents/workflows/Expert system.md` and follow it exactly. Resolve all referenced paths relative to `Agentic-Expert-System/`.”**

3. Ask a real question, e.g.:
   - “Should we use Postgres or Mongo for this product and why?”
   - “Audit this repo for architectural risks and quick wins.”
   - “Design a migration plan from monolith to modular monorepo.”

If you want deeper context on how the system is meant to be integrated by AI tools, also point your AI assistant at:
- `Agentic-Expert-System/parliament/ROUTING_PROTOCOL.md`

---

## What You Get (Outputs You Can Actually Use)

AES requires structured recommendations. A typical high-quality response includes:

- **Recommendation**: a clear “do X” with scope boundaries
- **Rationale**: which domains/perspectives mattered and why
- **Wildcard challenge**: a deliberate contrarian pushback so you sanity-check assumptions
- **Cross-domain vetoes**: non-negotiable blockers that must be surfaced
- **Trade-offs**: why the chosen option wins
- **Next steps**: concrete actions you can execute

### How to use AES outputs

Treat each response like a **decision brief**:

- If you agree, explicitly say “Accepted” and ask the assistant to **log the decision**.
- If you disagree, say “Rejected” and state the reason; AES is designed to learn your constraints/preferences.
- If the topic is risky, ask for **full debate** (“escalate to full parliament”) before committing.

---

## How AES Works (Conceptual Model)

### 16 domains × 7 roles = 112 perspectives

Each domain runs an internal debate with 7 roles:

1. Vision Anchor (Arbiter)
2. Novel Creator
3. Deep Researcher
4. Future-Proofing Visionary
5. Destroyer
6. Maintainer
7. Wildcard

Domains are grouped into 3 clusters:

- **Strategy (S)**: what to build and why
- **Technical (T)**: how to build it
- **Human (H)**: who it’s for and how it lands

### Layer routing (context-budget aware)

The workflow orchestrator selects a layer via a Cross-Domain Risk Score (CDRS):

- **Layer 0.75**: trivial queries (primary domain + anchors/wildcards)
- **Layer 1**: all compressed domains (default)
- **Layer 1.5**: compressed + a small set of full domains (non-trivial work)
- **Layer 2**: full parliament escalation (major decisions / pivots)

Entry point:
- `.agents/workflows/Expert system.md`

---

## Repo Map (What Each Folder Does)

- `.agents/workflows/Expert system.md`
  - The **entry point**. Routing, layer selection, response structure, and memory rules.

- `domains/`
  - 16 **compressed** domain references (small-token budget).

- `parliament/`
  - 16 **full** domain files + orchestration protocol:
    - `parliament/SYSTEM_MANIFESTO.md` (identity & philosophy)
    - `parliament/HANDLER_AGENT.md` (full-parliament orchestration)
    - `parliament/ROUTING_PROTOCOL.md` (integration guide for AI agents)

- `parliament/Custom-Agents/`
  - Add **project-specific agents** (C1, C2, …) using the provided template.

- `memory/`
  - Persistent state (approval-gated updates): decisions, user model, directives, session context, initiative compass.

---

## Memory & Persistence (What gets remembered)

AES includes a small, explicit memory architecture:

- `memory/initiative-compass.md`
  - A living “north star” for the current initiative: mission, constraints, non-negotiables, quality bar.

- `memory/decisions.csv` + `memory/decisions_meta.yaml`
  - Decision log + rationale/dissent metadata.
  - When the orchestrator stores a decision, it appends:
    - A CSV row in `memory/decisions.csv` with columns:
      - `id,date,title,context,decision,impact,status`
    - A YAML block in `memory/decisions_meta.yaml` keyed by the same `id` (rationale, dissent, domains)

  Example CSV row (format is defined in `.agents/workflows/Expert system.md`):
  ```csv
  id,date,title,context,decision,impact,status
  DEC-2026-04-08-001,2026-04-08,"DB choice","Early product; small team","Use Postgres first","High","active"
  ```

- `memory/directives.json` (optional)
  - Created when you approve storing standing instructions like “always do X” / “never do Y”.
  - Each directive entry is expected to look like:
    ```json
    {
      "id": "DIR-YYYY-MM-DD-NNN",
      "summary": "[instruction text]",
      "scope": "backend|frontend|all",
      "source": "User-stated",
      "active": true
    }
    ```

- `memory/session_context.md`
  - Lightweight multi-turn checkpoint.

- `memory/user_model_*.csv` + `memory/user_model_meta.yaml`
  - Captures how you prefer to work (approval/rejection signals, patterns, axes).

**Important:** Memory updates are intended to be **approval-gated**. Don’t let the assistant silently rewrite history.

---

## Customizing AES (Make it yours)

### 1) Add a project-specific custom agent

1. Copy `parliament/Custom-Agents/CUSTOM_AGENT_TEMPLATE.md`
2. Fill in Identity / Roles / Vetoes / Triggers / Decision Framework
3. Register it in `parliament/Custom-Agents/AGENT_REGISTRY.md`

Use custom agents for domains like: healthcare compliance, finance regulation, game economy design, learning science, your company architecture standards.

### 2) Edit a full domain, then re-distill

If you change any `parliament/Domain_XX_*.md`, regenerate the corresponding compressed `domains/DXX_*.md`.

See `DISTILL.md` for the distillation prompt and validation checklist.

---

## Knowledge Vault → Memory Migration (Optional)

If you have legacy markdown “knowledge vault” files and want to migrate them into the structured `memory/` format, see:

- `.agents/workflows/migrate-knowledge.md`
- `.agents/scripts/migrate_knowledge_to_memory.ps1`
- `.agents/scripts/migrate_knowledge_to_memory.py`

---

## Tips & Tricks (High-Leverage Ways to Use AES)

- **Ask for the layer you want**: “Use Layer 1.5 for this” or “Escalate to Layer 2”.
- **Force veto visibility**: “List any cross-domain vetoes first.”
- **Demand dissent**: “Include a minority report if experts disagree.”
- **Make it initiative-specific**: if the answer feels generic, ask for an “anti-slop rewrite” aligned to your mission/constraints.
- **Treat outputs as decision artifacts**: accept/reject explicitly; then log.

---

## Documentation Quality Gate (Domain 13)

This README is intentionally optimized for three audiences at once:

- **“Is this for me?”** (marketing / positioning)
- **“How do I use it today?”** (instructional quickstart)
- **“How is it structured and extended?”** (technical reference)

Domain 13 veto checks applied:

- **No jargon without definitions:** A glossary is included.
- **TTFSA ≤ 10 minutes:** Quickstart is designed to complete in ~5 minutes.
- **Claims are locally verifiable:** Key sources are listed under “Ground Truth & Receipts”.
- **Audience intent is explicit:** Sections are labeled by purpose.

7-role review summary (how the content was scrutinized):

- **Vision Anchor:** Prioritized clarity + truthful positioning over hype.
- **Novel Creator:** Added a fast onboarding flow and “Tips & Tricks” to make this practical.
- **Deep Researcher:** Grounded descriptions in the orchestrator + manifesto + routing protocol.
- **Future-Proofing Visionary:** Kept structure scan-friendly and retrieval-friendly.
- **Destroyer:** Flagged path inconsistencies; mitigated with the quickstart “compass path” note.
- **Maintainer:** Kept operational instructions minimal and linked to the canonical files.
- **Wildcard (minority view):** “This could be a single diagram + one command.” Majority chose text-first to reduce ambiguity for new users.

---

## Glossary (So you don’t get jargon-locked)

- **AES**: Agentic Expert System
- **Domain**: a specialized expert area (security, infra, docs, UX, …)
- **Role**: one of the 7 perspectives inside a domain (creator, destroyer, etc.)
- **Wildcard**: the contrarian role that challenges the default framing
- **CDRS**: Cross-Domain Risk Score (used to choose the routing layer)
- **Layer 0.75 / 1 / 1.5 / 2**: context-budget modes from light → full parliament
- **TTFSA**: time to first successful action
- **RAG-friendly**: structured so it’s easy for both humans and retrieval systems to parse (clear headers, minimal ambiguity)

---

## Ground Truth & “Receipts”

This repository is designed so claims can be verified locally:

- System identity & promises: `parliament/SYSTEM_MANIFESTO.md`
- How routing works: `.agents/workflows/Expert system.md`
- Integration guide: `parliament/ROUTING_PROTOCOL.md`
- Full orchestration protocol: `parliament/HANDLER_AGENT.md`
- Documentation quality requirements (Domain 13): `parliament/Domain_13_Docs.md`

---

## FAQ

### Is AES a program I run?
No. There’s nothing to install or execute.

AES is a **structured prompt + protocol** plus a set of domain expert files and memory artifacts. You use it by vendoring this folder into your project and pointing your AI assistant at the entrypoint workflow.

### Does it work with my AI tool?
It works with any local/personal/IDE-native assistant that can read local markdown files, follow step-by-step routing instructions, and keep a consistent “system prompt / project instruction” across turns.

### Will it write to my repo automatically?
Only if your AI tool is allowed to edit files. The protocol is designed for **approval-gated** memory updates.

---

## Contributing

If you contribute, prioritize:

- Clear domain boundaries
- Hard veto conditions
- Executable wildcards (not vibes)
- RAG-friendly structure (headers, tables, scanability)

---

## License

AES is designed to be **vendored** as a **drop-in** folder: you copy the `Agentic-Expert-System/` folder into your project repo during development, and your AI assistant reads it locally as a reasoning layer.

This repository does not include a license file in this snapshot. If you plan to release it as open source (and want others to copy it into their own projects), add an OSI-approved license (MIT/Apache-2.0/GPL, etc.) at the repo root.
