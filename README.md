# 🏛️ THE AGENTIC EXPERT SYSTEM [v4.0]
## A Universal Parliament for Architectural Intelligence

**78+ Specialized Perspectives. 13 Domain Clusters. 1 Collective Intelligence.**

The Agentic Expert System is not a coding tool—it is a **Strategic Reasoning Layer**. It sits between you and your AI, transforming a single generalist model into a high-performance "Parliament" of 78 experts. Drop this into any project, and every decision you make is audited, challenged, and refined by a team of domain specialists before the first line of code is ever written.

---

### 🌟 THE VISION: THE PARLIAMENT OF EXPERTS

Most AI assistants give you the **average answer**—the safest middle ground. In high-stakes development, the average answer is often the wrong one.

This system works by injecting a structured community of experts into your project's context. When you ask a question, you aren't just getting a reply from an LLM; you are convening a session of the **Parliament**.
- **The Security Council** vetoes risky implementations.
- **The Performance Purists** challenge bloated solutions.
- **The UX Architects** advocate for the end-user.
- **The Wildcard Provocateurs** ensure you aren't settling for "AI slop" or obvious answers.

The result is **Collective Intelligence**: advice that is broader, deeper, and more critical than any single agent can provide.

---

### 🎓 HOW IT WORKS

Behind the curtain, the system uses a sophisticated but simple **Tiered Reasoning System**. It optimizes how information is fed to your AI to ensure maximum depth without wasting resources.

#### 1. The Dynamic Filter
The system automatically scans your query to determine its "impact score."
- **Small Tasks**: It uses lightweight, compressed versions of all 13 domains. You get a fast, multi-domain "sanity check."
- **Strategic Moves**: It automatically pulls in the full-depth "Parliament" files for the most relevant domains. This is where the real debate happens.
- **Global Pivots**: For massive decisions, it loads the entire system, convening a full plenary session of all 78 perspectives.

#### 2. The 5+1 Perspective Model
Every domain isn't just one voice; it’s a tiny sub-parliament of six:
- **5 Specialists**: Each with a narrow, aggressive bias (e.g., in Security, one focuses on Auth while another focuses on Compliance).
- **1 Wildcard**: A mandatory contrarian whose ONLY job is to tell you why the experts are wrong. This forces the model to explore unconventional but superior alternatives.

#### 3. Living Project Memory
The system builds a **Knowledge Vault** for your project.
- **It Remembers**: Your architectural decisions are logged so the experts don't re-argue the same points next week.
- **It Adapts**: It learns your specific quality bar and preferences (e.g., "I hate external CSS libraries" or "Always prioritize dry code").
- **It Aligns**: On "First Contact," it scans your repo to understand your mission, ensuring every expert recommendation aligns with YOUR goals.

---

### 👥 WHO IS THIS FOR?

| Profile | The "Aha!" Moment |
|:---|:---|
| **Solo Founders** | Having 78 senior advisors on call for every strategic pivot. |
| **Team Leads** | Using the Parliament's output as a neutral "third-party" audit for PR reviews. |
| **Enterprise Architects** | Surfacing cross-domain trade-offs (e.g., Security vs. Performance) automatically. |
| **Open Source Builders** | Maintaining high quality and documentation standards across a distributed project. |

---

### ⚖️ AN HONEST ANALYSIS: STRENGTHS & LIMITATIONS

#### Where it Excels 🚀
- **Complex Decisions**: When you aren't sure between three different tech stacks.
- **Blindspot Detection**: Surfacing the "boring" but critical security or DevOps concerns you forgot about.
- **Preventing AI Slop**: The specialized voices are trained to reject generic, low-effort AI suggestions.

#### Where it Struggles ⚠️
- **Simple "Fix This Bug" Tasks**: For trivial typos, the system is overkill.
- **Context Overload**: If you try to feed it 500 files at once, the experts' "hearing" gets muffled. 
- **Model Quality**: The Parliament is only as smart as the LLM hosting it. It performs best on "Frontier" models (Claude Opus/Sonnet, GPT-4, etc.).

---

### 🛠️ MASTERY GUIDE: HOW TO GET THE BEST RESULTS

1. **The Atomic Question**: Ask one specific thing at a time. The more focused your question, the deeper the experts can dive.
2. **Context Discipline**: Don't attach your entire project. Attach only the files relevant to the current problem.
3. **Listen to the Dissent**: Don't just look for the consensus. The most valuable insights often come from the **Wildcard** or the **Dissenting Opinions**.
4. **Update the Vault**: When the Parliament helps you reach a decision, record it. This builds the permanent "intelligence" of your repo.

---

### 🏁 DEPLOYMENT & EXTENSION

#### Drop-In Deployment
1. Copy the `Agentic-Expert-System/` folder into your repo.
2. Point your AI agent at the workflow file: `.agents/workflows/Expert system.md`.
3. Start the session.

#### Upgrading from v3 (Knowledge Migration)
If your project uses the legacy markdown-based `Knowledge-Vault` from v3, you must migrate it to the new v4 JSON `memory` architecture to retain your project's context.
1. **Run the migration:** Point your AI agent to the **`/migrate-knowledge`** workflow (`.agents/workflows/migrate-knowledge.md`), or execute the script directly:
   ```powershell
   powershell.exe -ExecutionPolicy Bypass -File ".agents\scripts\migrate_knowledge_to_memory.ps1" -SourcePath "Knowledge-Vault" -TargetPath "memory"
   ```
2. **Verify:** Check the console output and `memory/changelog.md` to ensure all decisions and directives transferred successfully.
3. **Deprecate:** Your old `Knowledge-Vault` is now deprecated. Keep it as a backup, but all future intelligence will be written to the `memory/` directory.

#### Extending the Parliament
You can create your own specialized domains (e.g., a "Legal Compliance" or "Gaming Physics" expert) by following the template in `parliament/Custom-Agents/`. The system will automatically recognize and integrate them into the debate.

## What You Get

- Every AI prompt routed through multi-perspective analysis
- Cross-domain trade-off surfacing (security checks your infrastructure, complexity checks your architecture)
- Persistent memory that makes the system smarter for YOUR project over time
- Wildcard perspectives that challenge generic AI advice
- Works with any IDE agent that reads markdown (VS Code Copilot, Cursor, Claude Code, JetBrains AI)

---

## Quick Start

1. Copy this folder into your project root
2. Tell your IDE agent to use the workflow: point it at `.agents/workflows/Expert system.md`
3. Ask any development question — the system handles everything else

---

## How It Works

| Layer | What Loads | Token Cost | When Used | Recommended Model |
|-------|-----------|------------|-----------|-------------------|
| **Layer 1** | 13 compressed domain experts | ~8K tokens | Simple queries (CDRS < 3) | Any model (7B+, Haiku) |
| **Layer 1.5** | Compressed experts + 1 full domain deep-dive | ~28K tokens | Default for most queries (CDRS 3-5) | Sonnet |
| **Layer 2** | Full 78-perspective parliamentary debate | ~50-75K tokens | Major decisions, strategic pivots (CDRS >= 6) | Opus |

**CDRS** (Cross-Domain Risk Score): The orchestrator scans your query against override triggers in all 13 domains. The count of triggered domains determines which layer handles your query.

**Memory**: Decisions, directives, and user preferences persist across sessions in JSON files under `memory/`. The system gets smarter the more you use it.

---

## Directory Structure

```
├── .agents/
│   └── workflows/
│       ├── Expert system.md            ← Workflow orchestrator (entry point)
│       └── migrate-knowledge.md        ← v3 to v4 migration workflow
├── domains/
│   ├── D01_strategy.md                 ← Compressed: Startup Strategy
│   ├── D02_ecosystem.md                ← Compressed: Market Intelligence
│   ├── D03_infrastructure.md           ← Compressed: Infrastructure
│   ├── D04_cognition.md                ← Compressed: Developer Cognition
│   ├── D05_ai_integration.md           ← Compressed: AI Integration
│   ├── D06_product_design.md           ← Compressed: Product Design
│   ├── D07_open_source.md              ← Compressed: Open Source
│   ├── D08_systems_ux.md               ← Compressed: Systems UX
│   ├── D09_mathematics.md              ← Compressed: Mathematics & Algorithms
│   ├── D10_security.md                 ← Compressed: Security
│   ├── D11_devops.md                   ← Compressed: Internal Systems & DevOps
│   ├── D12_complexity.md               ← Compressed: Complexity Reduction
│   └── D13_unconventional.md           ← Compressed: Unconventional Strategies
├── memory/
│   ├── decisions.json                  ← Domain-tagged decisions with rationale
│   ├── directives.json                 ← Scoped standing orders
│   ├── user_model.json                 ← Learned user preferences
│   ├── changelog.md                    ← Append-only audit trail
│   └── session_context.md              ← Multi-turn coherence checkpoints
├── parliament/
│   ├── SYSTEM_MANIFESTO.md             ← Core principles and architecture
│   ├── HANDLER_AGENT.md                ← Parliamentary debate orchestrator
│   ├── ROUTING_PROTOCOL.md             ← Domain routing and escalation rules
│   ├── Domain_01_Strategy.md           ← Full: Startup Strategy (6 perspectives)
│   ├── Domain_02_Ecosystem.md          ← Full: Market Intelligence
│   ├── Domain_03_Infrastructure.md     ← Full: Infrastructure
│   ├── Domain_04_Cognition.md          ← Full: Developer Cognition
│   ├── Domain_05_AI_Integration.md     ← Full: AI Integration
│   ├── Domain_06_Product_Design.md     ← Full: Product Design
│   ├── Domain_07_Open_Source.md        ← Full: Open Source
│   ├── Domain_08_Systems_UX.md         ← Full: Systems UX
│   ├── Domain_09_Mathematics.md        ← Full: Mathematics & Algorithms
│   ├── Domain_10_Security.md           ← Full: Security
│   ├── Domain_11_DevOps.md             ← Full: Internal Systems & DevOps
│   ├── Domain_12_Complexity.md         ← Full: Complexity Reduction
│   ├── Domain_13_Unconventional.md     ← Full: Unconventional Strategies
│   └── Custom-Agents/                  ← Project-specific domain experts
│       ├── AGENT_REGISTRY.md
│       └── CUSTOM_AGENT_TEMPLATE.md
├── initiative-compass.md               ← Living project compass (auto-populated)
├── DISTILL.md                          ← Domain re-compression guide
└── README.md                           ← This file
```

**40 files total** — no database, no API keys, no build step.

---

## Customization

- **Adding custom domain agents:** Follow the template in `parliament/Custom-Agents/CUSTOM_AGENT_TEMPLATE.md`
- **Modifying compressed domains:** See `DISTILL.md` for the re-compression process
- **Initiative compass:** Auto-populated on first contact with a project, editable anytime at `initiative-compass.md`

---

## Cost Estimates

| Layer | Model | Tokens/Query | Cost/Query | Monthly (50q/day) |
|-------|-------|-------------|------------|--------------------|
| Layer 1 | Any (7B+, Haiku) | ~8,000 | ~$0.002 | ~$3 |
| Layer 1.5 | Sonnet | ~28,000 | ~$0.07 | ~$100 |
| Layer 2 | Opus | ~50-75,000 | ~$0.25 | ~$375 |
| **Mixed (typical)** | Mixed | — | — | **~$10** |

Most queries resolve at Layer 1 or 1.5. Layer 2 is reserved for major architectural decisions.

---

## Portability

- No external dependencies
- No database, no API keys, no build step
- Memory starts empty — fresh for every project
- Works offline with local models (Layer 1 and 1.5)
- Pure markdown — works with any IDE agent that reads `.md` files

---

> "You don't need a better AI. You need a better process for the AI you have."
