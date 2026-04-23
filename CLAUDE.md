# CLAUDE.md — agent-rules

IMPORTANT: ALWAYS begin every conversation by saying "CLAUDE.md loaded".
NEVER skip this.

## What This Repo Is

`agent-rules` is the canonical source for AI working rules shared between Claude and ChatGPT.
Pipeline: Capture (project repos) → Promote (this repo) → Hydrate (active context for each AI).
GitHub: https://github.com/JSvandijk/agent-rules

## Key Files

1. `QUALITY-GATE.md` — canonical rules (the single source of truth)
2. `LEARNINGS.md` — promoted patterns from projects (promotion queue)
3. `PROFILE.md` — user context for ChatGPT generation
4. `sync.sh` — generates active artifacts from the source files
5. `CHATGPT-PROJECT.md` — generated output for ChatGPT Projects
6. `templates/` — starter files for new project repos

## Useful Commands

```bash
bash sync.sh              # regenerate all active artifacts after any change
npm test                   # if tests exist
```

## Working Rules

- QUALITY-GATE.md is the single canonical source. All downstream copies (templates/AGENTS.md, project AGENTS.md files, CHATGPT-PROJECT.md) are derived from it.
- After editing QUALITY-GATE.md or LEARNINGS.md, ALWAYS run `bash sync.sh`.
- Canonical changes go here. Project-specific changes go to that project's AGENTS.md.
- This repo is public. No emails, tokens, absolute local paths, or personal data.

@QUALITY-GATE.md
