---
name: test
description: Design, add, and run software verification. Use when the user asks to test code, create regression tests, validate a feature, run a harness, improve coverage, use TDD, or verify behavior after changes.
---

# Test

Build focused verification that proves the behavior the user cares about.

## Workflow

1. Identify the behavior under test and the failure modes worth guarding.
2. Find the repo's existing test framework and naming conventions.
3. Add the smallest meaningful tests near related coverage.
4. Include at least one negative or edge case when risk justifies it.
5. Run targeted tests first, then broader tests if the change has wider impact.
6. Report exact commands and outcomes.

## Test Selection

- Unit tests for pure logic and edge cases.
- Integration tests for contracts across modules.
- Browser or end-to-end tests for user-visible flows.
- Snapshot tests only when they catch useful regressions.

## Rules

- Do not introduce a new test framework without a strong reason.
- Prefer deterministic fixtures over time, network, or randomness.
- When tests cannot run, explain why and give the next best verification.
