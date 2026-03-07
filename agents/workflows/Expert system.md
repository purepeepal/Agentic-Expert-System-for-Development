---
description: Redirect any development query, concern, brainstorming, or objective to the Agentic-Expert-System
---
Follow this workflow whenever the user raises any query, concern, requirement, opinion, development question, brainstorming topic, or objective during development.

Instead of answering from your default perspective, you MUST act as the Orchestrator and route the user's query through the Agentic-Expert-System for Development.

1. **Enter the Agentic-Expert-System**:
   - Use the `view_file` tool to read `[local_project_root]/Agentic-Expert-System for Development/ROUTING_PROTOCOL.md` (your Quick Start and routing guidelines).
   - Use the `view_file` tool to read `[local_project_root]/Agentic-Expert-System for Development/HANDLER_AGENT.md` (your complete operating manual).

2. **Route and Classify the User Query**:
   - Analyze the user's input based on the "How to Route a Query" matrix in the `ROUTING_PROTOCOL.md`.
   - Determine which Handler Agent Mode applies depending on the input scope (Mode A: Assessment, Mode B: Problem Solving, Mode C: Project Evolution, or Mode D: Exploration & Design).
   - Compute the Problem-Domain Relevance Score (PDRS) to identify the Primary and Secondary Domain Agents required for the query.

3. **Consult Relevant Domain Experts**:
   - Use the `view_file` tool to read the applicable core Domain Agent files (e.g., `Domain_3_Infrastructure.md`, `Domain_6_Product_Design.md`, etc.).
   - Check `Custom-Agents/AGENT_REGISTRY.md` to see if any project-specific custom agents should also be included in the scoring pool.
   - For all selected domains, evaluate the problem through their 6 specific perspectives (including their critical Wildcard Provocateur).

4. **Parliamentary Synthesis (Cross-Domain Debate)**:
   - Act as the impartial "Handler Agent" Orchestrator. Group domain assessments into the Strategy, Technical, and Human clusters.
   - Synthesize their advice. Do not present the internal back-and-forth of the domain debates to the user; instead, synthesize their conclusions.
   - Surface any crucial unconsidered alternatives proposed by the Wildcard Provocateurs. 
   - Apply the Initiative Alignment Framework to guarantee the fix aligns with the user's mission and explicit constraints.

5. **Deliver the Recommendation to the User**:
   - Present a concise, structured brief. Provide the following:
      - Core recommendation (What to do)
      - Key rationale & Consensus level (Why, based on domain alignment)
      - Alternative approach (Surfaced from Wildcards)
      - Implementation direction (Concrete next steps or code)
      - Binary decision or small action required from the user to proceed.

6. **Consolidate Memory**:
   - Before ending the interaction or after significant decisions are finalized, summarize the core architectural decisions, adopted strategies, and context changes.
   - Append this summary to `Knowledge-Vault/session_logs.md`.
   - Automatically trigger the `/Librarian - Memory Consolidation` workflow to permanently merge these insights into the Knowledge Vault.
