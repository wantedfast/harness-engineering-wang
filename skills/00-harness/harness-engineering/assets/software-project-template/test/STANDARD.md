# Test Standard

## Purpose

Prove that implemented behavior satisfies the relevant PRD, spec, issue, or user request.

## Required Inputs

- Source requirement from `spec/`.
- Commands from `AGENTS.md` or `tools/`.
- Changed behavior summary from the implementing agent.

## Method

1. Identify acceptance criteria.
2. Choose the highest useful test level:
   - unit for pure logic,
   - integration for module contracts,
   - end-to-end for user flows,
   - manual verification only when automation is not available.
3. Run the smallest targeted check first.
4. Run broader checks when shared behavior changed.
5. Record exact commands, outputs, failures, and coverage gaps.

## Report Location

Write reports to `test/reports/` using:

```text
YYYY-MM-DD-<short-topic>.md
```

Each report must include:

- Requirement or PRD reference.
- Commands run.
- Passing checks.
- Failing checks.
- Coverage gaps.
- Evidence for acceptance criteria.
