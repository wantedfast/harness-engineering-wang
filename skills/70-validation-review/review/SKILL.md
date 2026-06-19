---
name: review
description: Review software changes for bugs, regressions, security risks, performance issues, maintainability problems, and missing tests. Use when the user asks for code review, PR review, audit, critique, or wants a second pass before merging.
---

# Review

Take a code-review stance. Findings come first, ordered by severity.

## Workflow

1. Inspect the diff and relevant surrounding code.
2. Understand the intended behavior before judging the change.
3. Look for correctness, data loss, security, concurrency, performance, UX, and compatibility risks.
4. Check whether tests cover the changed behavior and likely regressions.
5. Report only actionable findings with file and line references.

## Output Shape

Use:

- Findings
- Open questions
- Test gaps
- Brief summary

If there are no findings, say so directly and name residual risk.

## Rules

- Do not lead with praise or a change summary.
- Do not flag style preferences unless they hide real risk.
- Keep line ranges tight and grounded in inspected code.
