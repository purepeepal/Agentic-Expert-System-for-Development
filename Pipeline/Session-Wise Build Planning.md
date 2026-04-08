\\Flaws which had to manually fixed during the run of this workflow previously. Needs to be adapted into this workflow for improved universal application:

1. Convert Paragraphs to Actionable Checklists
Instruction: Refactor all implementation steps from numbered paragraph descriptions (e.g., 1. Implement the CDRSScorer...) into explicit markdown checklists. Why: AI agents natively parse markdown lists starting with - [ ] and use them as atomic state trackers to report progress. This prevents steps from being skipped. Format Required:

markdown
## Implementation Steps
- [ ] 1.1 Implement CDRSScorer class...
- [ ] 1.2 Implement PDRSScorer class...
2. Mandate Explicit Testing Quotas
Instruction: Remove vague testing statements (e.g., "Unit tests are comprehensive"). Replace them with rigid, numeric test coverage requirements for each component. Why: Left to their own devices, agents will often write minimal "happy path" tests. Setting minimum quotas forces the agent to consider edge cases and failure modes. Example Modification: "Write unit tests for PDRS scoring (minimum 50+ test cases covering individual domains, threshold validation, and override triggers)."

3. Embed Inline Algorithm Definitions
Instruction: Whenever a session requires implementing an algorithm or accessing a concept from design.md, briefly restate the core parameters inline within the implementation step itself. Why: Relying solely on the agent to cross-reference an external design document increases the risk of context loss or hallucination. Inline hints act as immediate grounding. Example Modification: "Implement the CDRSScorer utilizing Algorithm 1 (be sure to process keyword matching, domain activation frequency, and criticality signals as defined in the design)."

4. Append a Final "Documentation & Training" Session
Instruction: Create a new file named session_12_documentation.md as the final step in the pipeline. Why: A major architectural transition requires updated references. This session should strictly instruct the agent to update the README.md, document the new 4-Layer Architecture and Layer Selection logic, and provide an API reference for the new routing engine methods.
\\
\\Flaws which had to be manually fixed when trying to improve an existing system while running this workflow previously. Needs to be adapted into this workflow for universal application:

1. Protection of Existing Assets (No "Greenfield" Assumptions)
What it does: It explicitly commands the agent: "You are modifying the existing Agentic-Expert-System codebase (v4.1)... DO NOT build from scratch."
Why it's a strength: The first version allows the AI to assume it's building a brand new application. Without strict instructions to respect the current workspace, an AI might overwrite existing folder structures, create redundant package.json files, or ignore existing utility functions.
2. Strict Guardrails on Workflow Modification
What it does: It explicitly bans the agent from messing with core system behaviors prematurely: "DO NOT modify the existing LLM system prompts or 

.md
 workflow files yet."
Why it's a strength: Because AES relies on delicate markdown-based workflows and prompts, allowing an agent to rewrite routing algorithms and system prompts in the same session often breaks the logic chain. The second version properly quarantines work purely to JavaScript first.
3. Deliberate Scope Containment
What it does: It tells the agent exactly where the architectural boundary is for that specific session: "DO NOT implement context assembly (reading the domain files). Only implement the abstract scoring and selection mechanisms."
Why it's a strength: The first version asks the agent to do too much at once. By telling the agent not to worry about reading the actual files off the disk yet, the second version guarantees the agent spends 100% of its token budget and focus strictly on getting the math for the routing scores (CDRS/PDRS) correct.
4. Anchoring to the Specific File Path
What it does: It tells the agent exactly where the output must go: "The target is the 

Workspace/Agentic-Expert-System/engine/routing.js
 module."
Why it's a strength: The first version is vague about where the file should be created. This often leads to AI agents creating duplicate files in the root directory (e.g., creating ./routing.js instead of modifying engine/routing.js).
\\

---
description: Create a modular build plan divided into numbered sessions to manage context windows and prevent AI hallucinations.
---

Follow this workflow for building modular features, epics, or complete projects to ensure the AI agent remains focused, does not hallucinate new paths, and respects context window limitations.

### Core Philosophy
You are supposed to keep track of the complete picture and assign the sessions such that the agent that works on the session doesn't need to worry about the overall picture of what it is trying to build, and can focus on *the build* rather than worry about *how to build it*.

### Step-by-Step Execution

1. **Create the Modular Build Workspace:**
   - Create a new folder dedicated to the current modular build (e.g., `builds/feature_name/`).
   
2. **Divide the Build into Sessions:**
   - Break down the entire build requirement into small, distinct, logical milestones.
   - Each milestone must comfortably fit within an AI agent's standard context window.
   - Limit the scope of each session to prevent the agent from making up new paths, directions, or going its own way.

3. **Generate Numbered Session Files:**
   - Inside the build folder, save each session as a numbered markdown file (e.g., `session_01_setup.md`, `session_02_database.md`, `session_03_api.md`).
   - Each session file must contain:
     - **Session Goal:** Exactly what needs to be built in this specific session.
     - **Input Context:** What the agent needs to know (and *strictly only* what it needs to know) from previous sessions.
     - **Implementation Steps:** Step-by-step instructions for the build process.
     - **Success Criteria:** How to verify this session is complete before moving to the next.
     - **Strict Boundaries:** Explicit instructions on what the agent should *not* do in this session.

4. **Orchestrate the Execution:**
   - As the Handler, hand exactly ONE session file to the executor agent at a time.
   - Do not provide the agent with future session files; it must remain blind to the steps beyond its current scope to maintain maximum focus.
