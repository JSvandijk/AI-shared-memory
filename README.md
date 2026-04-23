# agent-rules

Persistent quality rules and accumulated learnings for AI-assisted development.

> **This repo is public.** Do not commit email addresses, passwords, tokens, API keys, file paths, or other private information. Learnings and rules only.

## What this is

This repo is the single source of truth for how AI agents (Claude, ChatGPT) should work on my projects. It solves one problem: **AI doesn't remember between sessions, so the lessons need to live somewhere permanent.**

After every project or review, new findings get added here. Every project references this repo so both Claude and ChatGPT start each session with the accumulated knowledge.

## How it works

```
agent-rules (this repo)          →  permanent, accumulates over time
        │
        ├── QUALITY-GATE.md      →  universal rules (any project)
        ├── LEARNINGS.md         →  findings from each project
        └── CHATGPT-INSTRUCTIONS.md → copy into ChatGPT Custom Instructions
        │
        ▼
~/.claude/CLAUDE.md              →  global Claude context, references this repo
{project}/CLAUDE.md              →  project-specific Claude context
{project}/AGENTS.md              →  project-specific ChatGPT context
```

## Setup (one-time)

1. Clone this repo somewhere accessible
2. Copy `CHATGPT-INSTRUCTIONS.md` content into ChatGPT > Settings > Custom Instructions
3. `~/.claude/CLAUDE.md` already references this repo

## After each project

Add a new entry to `LEARNINGS.md` with what was found and what was learned.
Sync `~/.claude/CLAUDE.md` if the quality gate changed.

## New project setup

```bash
git add-agents    # copies templates to current repo
```

Then fill in the project-specific sections.
