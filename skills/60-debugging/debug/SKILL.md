---
name: debug
description: Diagnose and fix software failures. Use when the user reports an error, failing test, crash, wrong output, flaky behavior, regression, performance problem, or says debug, diagnose, broken, failing, throwing, or not working.
---

# Debug

Use a disciplined loop: reproduce, minimize, hypothesize, instrument, fix, verify.

## Workflow

1. Capture the exact symptom, command, input, and environment.
2. Reproduce the failure locally when possible.
3. Minimize the failing path to the smallest useful case.
4. Form one or two concrete hypotheses.
5. Inspect code and add temporary instrumentation only if needed.
6. Make the smallest fix that addresses the cause.
7. Run the failing case again, then a broader regression check.

## Rules

- Do not patch by guessing from the error text alone.
- Prefer confirming the root cause before changing behavior.
- Preserve unrelated user changes.
- Turn fixed bugs into regression tests when practical.

## Output Shape

Lead with:

- Root cause
- Fix made
- Verification run
- Remaining risk
