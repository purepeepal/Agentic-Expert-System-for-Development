# Memory Changelog

> Append-only audit trail of all memory writes. Every decision stored, directive added, or user model update is logged here with timestamp and source.

## Entry Format

Each entry follows this structure:

```
### [YYYY-MM-DD HH:MM] — [ACTION]
- **Type:** decision | directive | user_model | compass
- **ID:** [ID of the written item]
- **Summary:** [What was written]
- **Source:** [User-approved | Auto-inferred]
```

---
