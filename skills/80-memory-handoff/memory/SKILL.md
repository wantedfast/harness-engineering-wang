---
name: memory
description: Capture and maintain durable project memory for software work. Use when the user asks to remember conventions, summarize project facts, create AGENTS.md guidance, preserve decisions, or avoid rediscovering context across sessions.
---

# Memory

Store durable context that future agents should rely on.

## Workflow

1. Separate durable facts from temporary session notes.
2. Prefer existing memory files: AGENTS.md, CLAUDE.md, CONTEXT.md, docs/adr, or project docs.
3. Record decisions, commands, conventions, architecture boundaries, and gotchas.
4. Keep entries concise and easy to scan.
5. Avoid storing secrets, credentials, or private tokens.
6. Verify the saved memory matches the current repo state.

## What To Save

- Build, test, and lint commands
- Framework versions and runtime constraints
- Coding conventions and architectural rules
- Domain vocabulary
- Non-obvious decisions and their reasons
- Known flaky tests or environment setup notes

## Rules

- Do not create new memory files when a repo already has a clear location.
- Do not preserve stale or speculative facts as truth.
- Mark uncertainty explicitly.
