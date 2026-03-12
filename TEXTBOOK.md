# 📖 THE ARCHITECTURAL TEXTBOOK
## Agentic Expert System v4.0 Technical Guide

### 1. The Core Philosophy: Prompt-as-Infrastructure
The v4 Agentic Expert System is a **Static Orchestration Layer**. It does not rely on active API orchestration scripts or expensive multi-pass agent chains. Instead, it utilizes **Architecture E** — a tiered, context-efficient prompt structure that enables a single LLM inference pass to simulate high-complexity multi-agent deliberation.

---

### 2. The Tiered Reasoning System (Architecture E)
To solve the "Context Explosion" problem of v3, v4 introduces three distinct operational tiers based on the **CDRS (Cross-Domain Risk Score)**.

#### Tier 1: Compressed Audit (CDRS 0-2)
- **Activation**: Simple queries, surface-level code reviews.
- **Context**: 13 Compressed Domain Files (`domains/*.md`).
- **Token Load**: ~8,000 tokens.
- **Benefit**: Extremely fast, low-cost, multi-domain "sanity check."

#### Tier 1.5: Hybrid Deep-Dive (CDRS 3-5)
- **Activation**: Standard development features, complex bugs.
- **Context**: 13 Compressed Domains + 1 Primary "Parliament" Domain (`parliament/Domain_XX.md`).
- **Token Load**: ~25,000 tokens.
- **Benefit**: Deep expertise in the most relevant domain while maintaining broad cross-domain awareness.

#### Tier 2: Parliamentary Plenary (CDRS 6+)
- **Activation**: Critical architectural shifts, high-risk security decisions, new system design.
- **Context**: Full 78-perspective source files + Knowledge Vault.
- **Token Load**: ~50,000–80,000 tokens.
- **Benefit**: Maximum reasoning depth. The full weight of the "Parliament" is applied to the decision.

---

### 3. PDRS: Perspective Discovery & Routing System
How the system knows which domains to load:

1. **Trigger Scan**: The orchestrator scans the query against **Override Triggers** and **Veto Conditions** defined in every domain.
2. **Scoring**: Each match increases the CDRS.
3. **Routing**: The system automatically selects the Tier and the relevant full domain files based on the highest-scoring triggers.

---

### 4. The 78 Perspectives (5+1 Model)
Each of the 13 domains is powered by 6 internal sub-agents:
- **5 Focus Experts**: Specialists with specific narrow biases (e.g., in Domain 10 [Security], one focuses on Encryption, another on Auth, another on Compliance).
- **1 Wildcard Provocateur**: A mandatory contrarian whose instruction is to disrupt the consensus. This ensures that the model explores the "Pareto Frontier" of every decision rather than settling for a safe average.

---

### 5. Memory & The Knowledge Vault
v4 treats memory as a structured, auditable asset rather than a messy conversation log.

- **`decisions.json`**: Records every major decision with its domain tag and rationale.
- **`directives.json`**: Stores "Standing Orders" (e.g., "Always use TypeScript," "Never use external CSS libraries").
- **`user_model.json`**: Learns your personal preferences — do you prefer dry code? Explicit documentation? Specific testing patterns?
- **`initiative-compass.md`**: The project's "North Star," auto-populated on startup to ensure all experts align with the overall mission.

---

### 6. Model-Agnostic Implementation
While optimized for long-context models, the system is designed to be **Reasoning First, Model Second.**

- **Instruction Patterning**: The system uses highly structured Markdown to "pattern" the LLM's attention mechanism into the desired expert modes.
- **Standardized DAS**: Every deliberation produces a **Domain Assessment Summary (DAS)** — a standardized JSON-like markdown block that allows for easy synthesis by the next layer.

---

### 7. Deployment & Customization
- **Custom Agents**: Users can extend the system by creating new domains in `parliament/Custom-Agents/` using the standard specification format.
- **Distillation**: The `DISTILL.md` process allows users to modify the deep technical source files while maintaining the fast, compressed Tier 1 layer.

---

> "Architecture E is not just an optimization; it is the realization of the Context-Efficient Parliament."
> — *Handler Agent, v4 System Analysis*
