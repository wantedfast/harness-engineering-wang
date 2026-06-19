---
name: plan
description: Plan software work before editing code. Use when the user asks to plan, break down a feature, sequence multi-file changes, create todos, estimate implementation order, or wants a safer path before execution.
---

# Plan

Turn a software request into a short, executable plan with clear checkpoints.

## Workflow

1. Restate the goal in one sentence.
2. Inspect the repo or relevant files before deciding.
3. Identify constraints, risks, and unknowns.
4. Produce 3-7 ordered steps with one in progress at a time.
5. Name validation for each risky step.
6. Start execution unless the user only asked for a plan.

## Output Shape

Prefer:

- Goal
- Assumptions
- Plan
- Validation

Keep plans concrete. Avoid generic steps such as "implement feature" unless the implementation boundary is obvious.

## Rules

- Ask a question only when a wrong assumption would be expensive.
- Prefer vertical slices over layer-by-layer rewrites.
- Update the plan as reality changes.
- Do not plan around files that have not been inspected when the repo is available.
