# 🏛️ THE AGENTIC EXPERT SYSTEM [v4.0]

**78 Perspectives. 13 Domains. 1 Parliament. Zero Dependencies.**

The Agentic Expert System is a universal development orchestration layer that transforms any AI model into a high-performance specialized parliament.

---

### 📖 EXPLORE THE SYSTEM

- **[The Vision (MARKETING.md)](MARKETING.md)** — Why use this? High-level benefits, the "Wow" factor, and universal portability.
- **[The Technical Guide (TEXTBOOK.md)](TEXTBOOK.md)** — How does it work? Architecture E, Tiered Reasoning, PDRS, and Context Optimization.
- **[The Operations Manual (parliament/SYSTEM_MANIFESTO.md)](parliament/SYSTEM_MANIFESTO.md)** — Core identity, parliamentary procedures, and standards.

---

### 🚀 WHY v4?

- **Model Agnostic**: Works with Claude, GPT, O1, DeepSeek, Llama, and local models.
- **Architecture E**: 90% cost reduction vs v3 via tiered reasoning.
- **Persistent Memory**: The Knowledge Vault keeps your project smarter across sessions.
- **Drop-in Deployment**: No API keys, no databases, no setup. Just markdown.

---

## Quick Start

1. **Copy** `Agentic-Expert-System/` into your project root
2. **Point** your IDE agent at the workflow: `.agents/workflows/Expert system.md`
3. **Ask** any development question — the system handles routing, perspective loading, wildcard challenges, and memory

That's it. On first contact, the system will scan your project and ask up to 5 questions to calibrate itself.

---

## How It Works

| Layer | When | What Happens | Token Budget |
|-------|------|-------------|-------------|
| **Layer 1** | Simple queries (CDRS 0-2) | 13 compressed domain experts check your question | ~8K tokens |
| **Layer 1.5** | Default for non-trivial queries (CDRS 3-5) | Compressed experts + one full domain deep-dive | ~28K tokens |
| **Layer 2** | Major decisions (CDRS ≥6 or explicit) | Full 78-perspective parliamentary debate | ~50-75K tokens |

**CDRS** (Cross-Domain Risk Score) is computed automatically by counting how many domains' override triggers match your query. Higher cross-domain impact → more perspectives loaded.

**Memory** persists across sessions: decisions are domain-tagged in JSON, directives are scoped, user preferences are tracked — all with user-approved writes only.

---

## Directory Structure

```
Agentic-Expert-System/
├── .agents/
│   └── workflows/
│       └── Expert system.md          # Workflow entry point — the orchestrator
├── domains/                           # Compressed domain files (~500 tokens each)
│   ├── D01_strategy.md
│   ├── D02_ecosystem.md
│   ├── D03_infrastructure.md
│   ├── D04_cognition.md
│   ├── D05_ai_integration.md
│   ├── D06_product_design.md
│   ├── D07_open_source.md
│   ├── D08_systems_ux.md
│   ├── D09_mathematics.md
│   ├── D10_security.md
│   ├── D11_devops.md
│   ├── D12_complexity.md
│   └── D13_unconventional.md
├── memory/                            # Persistent project memory (JSON + markdown)
│   ├── decisions.json                 # Domain-tagged decisions
│   ├── directives.json                # Standing orders and constraints
│   ├── user_model.json                # Developer preference tracking
│   ├── changelog.md                   # Append-only audit trail
│   └── session_context.md             # Session checkpoint (auto-updated)
├── parliament/                        # Full domain files for Layer 1.5/2 escalation
│   ├── SYSTEM_MANIFESTO.md            # System constitution and principles
│   ├── HANDLER_AGENT.md               # Parliamentary debate orchestration
│   ├── ROUTING_PROTOCOL.md            # Domain routing and layer selection
│   ├── Domain_01_Strategy.md          # Full domain: strategy & viability
│   ├── Domain_02_Ecosystem.md         # Full domain: market intelligence
│   ├── Domain_03_Infrastructure.md    # Full domain: architecture & deployment
│   ├── Domain_04_Cognition.md         # Full domain: developer experience
│   ├── Domain_05_AI_Integration.md    # Full domain: AI/LLM integration
│   ├── Domain_06_Product_Design.md    # Full domain: visual design & accessibility
│   ├── Domain_07_Open_Source.md       # Full domain: code quality & OSS
│   ├── Domain_08_Systems_UX.md        # Full domain: information architecture
│   ├── Domain_09_Mathematics.md       # Full domain: algorithms & complexity
│   ├── Domain_10_Security.md          # Full domain: security & compliance
│   ├── Domain_11_DevOps.md            # Full domain: CI/CD & monitoring
│   ├── Domain_12_Complexity.md        # Full domain: complexity reduction
│   ├── Domain_13_Unconventional.md    # Full domain: creative disruption
│   ├── Custom-Agents/
│   │   ├── AGENT_REGISTRY.md          # Registry of custom domain agents
│   │   └── CUSTOM_AGENT_TEMPLATE.md   # Template for creating new domains
│   └── Knowledge-Vault/
│       ├── VAULT_INDEX.md             # Knowledge vault index
│       ├── initiative-compass.md      # Initiative compass template
│       └── user-model.md             # User model template
├── initiative-compass.md              # Active project compass (auto-populated)
├── README.md                          # This file
└── DISTILL.md                         # Guide for re-compressing domain files
```

---

## Customization

### Adding Custom Domain Agents
Use the template at `parliament/Custom-Agents/CUSTOM_AGENT_TEMPLATE.md` to create a new domain expert. Register it in `parliament/Custom-Agents/AGENT_REGISTRY.md`. The orchestrator will automatically include it in CDRS computation and routing.

### Modifying Compressed Domains
If you edit a full domain file in `parliament/`, you must re-generate its compressed version in `domains/`. See `DISTILL.md` for the exact distillation process and validation checklist.

### Initiative Compass
Auto-populated on first contact via the Bootstrap Protocol. You can edit `initiative-compass.md` at any time to refine your project's mission, constraints, and quality bar.

---

## Cost Estimates

| Layer | Recommended Model | Tokens/Query | Cost/Query | Monthly (50q/day) |
|-------|------------------|-------------|-----------|-------------------|
| Layer 1 | Any (7B+, Haiku) | ~8,000 | ~$0.002 | ~$3 |
| Layer 1.5 | Sonnet | ~28,000 | ~$0.07 | ~$100 |
| Layer 2 | Opus | ~50-75,000 | ~$0.25 | ~$375 |
| **Mixed (typical)** | Mixed | — | — | **~$10** |

Most queries resolve at Layer 1 or 1.5. Layer 2 activates only for high-impact decisions.

---

## Portability

- No external dependencies
- No database, no API keys, no build step
- Memory starts empty — fresh for every project
- Works offline with local models (Layer 1 and 1.5)
- Pure markdown and JSON — version-controllable, diffable, auditable
