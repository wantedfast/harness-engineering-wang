---
name: context-compress
description: Compress large software context into a concise handoff brief. Use when a repo, thread, logs, files, or implementation history are too large for the context window, or when preparing another agent to continue work.
---

# Context Compress

Distill large context into the smallest brief that preserves decisions and next actions.

## Workflow

1. Identify the audience: same agent later, another agent, or the user.
2. Keep facts needed to continue work; discard narration and dead ends.
3. Preserve commands run, files changed, decisions made, errors seen, and unresolved questions.
4. Include exact paths and line references when useful.
5. Separate confirmed facts from hypotheses.
6. End with the next concrete step.

## Output Shape

- Objective
- Current state
- Key files
- Decisions
- Commands and results
- Open issues
- Next steps

## Rules

- Do not include secrets.
- Do not compress away failing commands or blockers.
- Prefer stable project facts over chat transcript detail.
