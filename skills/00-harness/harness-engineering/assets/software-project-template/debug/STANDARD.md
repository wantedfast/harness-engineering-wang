# Debug Standard

## Purpose

Resolve failures by proving the root cause, making the smallest fix, and preventing regression.

## Method

1. Capture the exact symptom, command, input, environment, and error output.
2. Reproduce the failure locally when possible.
3. Minimize the failing case.
4. Form one or two concrete hypotheses.
5. Inspect code and add temporary instrumentation only when useful.
6. Fix the root cause with the smallest scoped change.
7. Rerun the failing case.
8. Add or update regression coverage when practical.

## Report Location

Write reports to `debug/reports/` using:

```text
YYYY-MM-DD-<short-topic>.md
```

Each report must include:

- Symptom.
- Reproduction command or reason reproduction was not possible.
- Root cause.
- Fix summary.
- Verification command.
- Regression coverage added or skipped.
