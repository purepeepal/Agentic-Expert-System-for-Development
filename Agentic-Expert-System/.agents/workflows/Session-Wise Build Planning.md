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
