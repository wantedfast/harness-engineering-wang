# Review Standard

## Purpose

Independently audit whether implementation satisfies the PRD and avoids correctness, security, performance, maintainability, and testing regressions.

## Method

1. Read the source PRD or issue.
2. Inspect the implementation diff and relevant surrounding code.
3. Check acceptance criteria one by one.
4. Check whether test evidence is sufficient.
5. Report actionable findings first, ordered by severity.
6. Conclude with exactly `OK` or `NOT OK`.

## Report Location

Write reports to `review/reports/` using:

```text
YYYY-MM-DD-<short-topic>.md
```

Each report must include:

- Findings.
- Open questions.
- Test gaps.
- Acceptance criteria verdict.
- Final conclusion: `OK` or `NOT OK`.
