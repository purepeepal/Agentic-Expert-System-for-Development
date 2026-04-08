# Cross-Domain Influence Matrix

**Purpose:** CDRS calibration reference for Step 2b. Scan this alongside the 16 compressed domain files — high-frequency pairs below indicate where non-primary override triggers are most likely to fire. Use the Baseline CDRS table to pre-calibrate before trigger scanning.

---

## Quadrant A — Hard Conflict Pairs (Secondary VETO likely)

| Primary | Secondary | Activating Topic | Impact |
|---------|-----------|-----------------|--------|
| D03 Infra/Net | D10 Security | Deployment, API exposure, caching, database access | D10: mandatory attack surface audit |
| D05 AI Systems | D10 Security | LLM calls, AI production, prompt design | D10 VETO: injection scan mandatory |
| D03 Infra/Net | D14 Root Logic | Architectural pivots, tech stack changes | D14: challenge all baseline assumptions |
| D07 OSS/Tools | D10 Security | New dependency or 3rd-party integration | D10: CVE scan mandatory |

---

## Quadrant B — Constructive Amplifiers (Secondary deepens primary)

| Primary | Secondary | Topic | Effect |
|---------|-----------|-------|--------|
| D01 Strategy | D02 Ecosystem | Business model, competitive positioning | D02 market evidence tests D01 |
| D03 Infra/Net | D09 Logic/Math | Query design, data structures, performance | D09 confirms algorithmic efficiency |
| D08 UX | D04 Cognition | User flows, onboarding, error states | D04 load lens deepens D08 IA |
| D06 Design | D08 UX | Visual design with navigational consequence | D08 validates component placement |
| D16 Data Sys | D03 Infra/Net | Database topology, connectivity | D03 validates data persistence layer |
| D13 Docs | D15 Creative | Marketing, brand narrative | D15 adds engagement hooks to D13 output |
| D14 Root Logic | D09 Logic/Math | First-principles logic deconstruction | D09 grounds D14 deconstructions in formal math |

---

## Quadrant C — Cross-Cutting Auditors (Fire on any primary)

| Domain | Audit Type | Always Fires When... |
|--------|-----------|---------------------|
| D12 Unconventional | Anti-slop | Any domain produces a high-confidence, formulaic-sounding recommendation |
| D14 Root Logic | Root-cause & assumption audit | Any proposal adds a complex solution to a seemingly simple problem |
| D10 Security | Security | Any user data, auth token, session, or external system touchpoint is involved |

**Auditor pair tensions:**
- **D12 ↔ D14:** D12 disruption → D14 challenges hidden assumptions and second-order effects
- **D14 ↔ D01:** D14 deconstructs assumptions → D01 reconciles with business strategy
- **D16 ↔ D10:** D16 maps dataflow → D10 audits for leakage/PII exposure

---

## Baseline CDRS by Primary Domain

| Primary Domain | Typical CDRS | Consistent Co-Activators |
|----------------|-------------|--------------------------|
| D03 Infra/Net | 4–6 | D10, D11, D16, D14 |
| D05 AI Systems | 4–5 | D10, D14, D12 |
| D01 Strategy | 3–4 | D02, D12, D14 |
| D16 Data Sys | 3–4 | D03, D10, D09, D11 |
| D11 Ops/Mem | 3–4 | D10, D03, D16, D14 |
| D07 OSS/Tools | 3–4 | D10, D11, D09 |
| D06 Design | 2–3 | D08, D15, D04 |
| D08 UX | 2–3 | D06, D15, D04 |
| D10 Security | 2–3 | D07, D11, D16 |
| D09 Logic/Math | 2–3 | D14, D03 |
| D13 Docs | 2–3 | D15, D01, D08 |
| D14 Root Logic | 3–5 | D09, D01 |
| D15 Creative | 2–3 | D06, D13, D04 |
| D02 Ecosystem | 1–2 | D01 |
| D04 Cognition | 1–2 | D08 |
| D12 Unconventional | cross-cutting | fires regardless of primary |

**Fast-path rule:** If the query is infrastructure- or AI-related (primary D03 or D05), default to Layer 1.5 *before* completing full CDRS trigger scanning — these domains reach CDRS ≥ 3 in nearly every case.

---

*CDRS reference only — ~600 tokens. Do not expand this file. Update only when domain override triggers are revised.*
