# Cross-Domain Influence Matrix

**Purpose:** CDRS calibration reference for Step 2b. Scan this alongside the 13 compressed domain files — high-frequency pairs below indicate where non-primary override triggers are most likely to fire. Use the Baseline CDRS table to pre-calibrate before trigger scanning.

---

## Quadrant A — Hard Conflict Pairs (Secondary VETO likely)

| Primary | Secondary | Activating Topic | Impact |
|---------|-----------|-----------------|--------|
| D03 Infrastructure | D12 Complexity | New service, microservice, event bus, abstraction layer | D12 VETO: demand "simplest version that meets objective" |
| D03 Infrastructure | D10 Security | Deployment, API exposure, caching, database access | D10 override: mandatory attack surface audit |
| D05 AI Integration | D10 Security | LLM calls with user data, AI output to production, prompt design | D10 VETO: validate pipeline; injection scan mandatory |
| D05 AI Integration | D12 Complexity | Any AI feature proposal | D12: can rule/regex do this at $0? Prove AI is necessary |
| D03 Infrastructure | D01 Strategy | Infrastructure scaling before confirmed user retention | D01 VETO: prove product-market fit first |
| D11 DevOps | D12 Complexity | CI/CD step additions, tooling stack growth | D12 override: count total build steps; justify each addition |
| D07 Open Source | D10 Security | New dependency or third-party integration | D10 override: CVE scan + supply chain check mandatory |

---

## Quadrant B — Constructive Amplifiers (Secondary deepens primary)

| Primary | Secondary | Topic | Effect |
|---------|-----------|-------|--------|
| D01 Strategy | D02 Ecosystem | Business model, competitive positioning, pricing | D02 market evidence pressure-tests D01 assumptions |
| D03 Infrastructure | D09 Mathematics | Query design, data structures, at-scale performance | D09 confirms algorithmic efficiency of D03 choices |
| D08 Systems UX | D04 Cognition | User flows, onboarding, error states | D04 cognitive load lens deepens D08 IA decisions |
| D06 Product Design | D08 Systems UX | Visual design with navigational consequence | D08 validates D06 component placement in flow |
| D03 Infrastructure | D11 DevOps | Provisioning, deployment targets, observability | D11 confirms D03 choices against operability |
| D03 Infrastructure | D05 AI Integration | Vector storage, embedding infra, inference hosting | D05 co-pilots D03 on AI-specific infra requirements |

---

## Quadrant C — Cross-Cutting Auditors (Fire on any primary)

| Domain | Audit Type | Always Fires When... |
|--------|-----------|---------------------|
| D13 Unconventional | Anti-slop | Any domain produces a high-confidence, formulaic-sounding recommendation |
| D12 Complexity | Complexity razor | Any proposal adds a new layer, service, dependency, or abstraction |
| D10 Security | Security | Any user data, auth token, session, or external system touchpoint is involved |

**Auditor pair tensions:**
- **D13 ↔ D12:** D13 proposes unconventional approach → D12 flags hidden complexity introduced by disruption
- **D01 ↔ D12:** D01 requires business justification; D12 requires minimal complexity — both must clear before proceeding
- **D09 ↔ D12:** D09 selects algorithmically optimal; D12 confirms simplest-that-passes-tests wins over optimal-but-complex

---

## Baseline CDRS by Primary Domain

| Primary Domain | Typical CDRS | Consistent Co-Activators |
|----------------|-------------|--------------------------|
| D03 Infrastructure | 4–6 | D10, D12, D01, D09, D11 |
| D05 AI Integration | 4–5 | D12, D10, D01, D13 |
| D01 Strategy | 3–4 | D02, D13, D12 |
| D11 DevOps | 3–4 | D12, D10, D03 |
| D07 Open Source | 3–4 | D10, D12, D09 |
| D06 Product Design | 2–3 | D08, D04 |
| D08 Systems UX | 2–3 | D06, D04 |
| D10 Security | 2–3 | D07, D11 |
| D09 Mathematics | 2–3 | D12, D03 |
| D02 Ecosystem | 1–2 | D01 |
| D04 Cognition | 1–2 | D08 |
| D12 Complexity | cross-cutting | fires regardless of primary |
| D13 Unconventional | cross-cutting | fires regardless of primary |

**Fast-path rule:** If the query is infrastructure- or AI-related (primary D03 or D05), default to Layer 1.5 *before* completing full CDRS trigger scanning — these domains reach CDRS ≥ 3 in nearly every case.

---

*CDRS reference only — ~600 tokens. Do not expand this file. Update only when domain override triggers are revised.*
