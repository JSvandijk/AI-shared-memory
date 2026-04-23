# Learnings

Reusable patterns from AI-assisted projects. This is a promotion queue, not an archive.

> **This repo is public.** No emails, tokens, absolute local file paths, or personal data.

## Promotion rule

- **1x seen** → stays in the project repo only
- **2x seen** → add here as a short pattern
- **Keeps recurring** → promote to QUALITY-GATE.md, templates, or global CLAUDE.md

---

## Patterns

| # | Pattern | First seen | Promoted? |
|---|---------|-----------|-----------|
| 1 | AI code + AI audit in the same pass don't catch each other's mistakes. External review needed. | t3code-mobile | → QUALITY-GATE principle 2 |
| 2 | Volume of docs ≠ quality. Ratio of tests to docs matters. | t3code-mobile | → QUALITY-GATE principle 4 |
| 3 | AI adds but rarely subtracts. Explicitly check for things to remove. | t3code-mobile | → QUALITY-GATE "after every implementation" |
| 4 | "Works locally" ≠ done. Uncommitted work is not progress. | t3code-mobile | → QUALITY-GATE principle 5 |
| 5 | Deprecated API + warning suppression = tech debt, not a fix. | t3code-mobile | → QUALITY-GATE principle 6 |
| 6 | Evidence from an older commit is historical, not current proof. | t3code-mobile | → QUALITY-GATE principle 7 |
| 7 | CLAUDE.md is loaded as a suggestion, not enforced. Use ALWAYS/NEVER, keep under 200 lines. | agent-rules | → templates/CLAUDE.md |
| 8 | Post-compaction, Claude forgets rules. SessionStart hook helps. | agent-rules | → templates/.claude/settings.json |
| 9 | Overclaiming in docs creates false confidence. Say what is actually true. | agent-rules | → fixed in README |

---

## Template

```
| # | Pattern | First seen | Promoted? |
|---|---------|-----------|-----------|
| N | one-line failure mode or lesson | project-name | → where it was promoted, or "not yet" |
```
