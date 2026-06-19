---
name: harness-engineering
description: Orchestrate AI-assisted software projects using a standard project harness. Use when the user asks to set up AGENTS.md, docs/spec/tools/assets structure, initialize a software project for AI coding, coordinate Matt Pocock workflows, run coding-manager delivery, or execute a question-to-PRD-to-code workflow.
---

# Harness Engineering

Use this skill as the project-level coordinator. It turns a software repo into an AI-operable workspace with clear specs, instructions, tools, validation, and memory.

## Core Standard

Apply this structure when initializing or normalizing a project:

```txt
project/
  assets/
  docs/
  spec/
  tools/
  AGENTS.md
  README.md
  .gitignore
```

- `AGENTS.md`: rules for AI agents working in the repo.
- `spec/`: requirements, acceptance criteria, and task slices.
- `docs/`: architecture, decisions, domain notes, and runbooks.
- `tools/`: deterministic scripts for build, test, checks, generation, and evals.
- `assets/`: project assets or reusable templates.
- `README.md`: human-facing project entrypoint.

Use `assets/software-project-template/` as the starter template when the user asks to create this structure.

## Skill Stack

For the full stack and routing table, read `references/skill-stack.md` when coordinating multiple skills or explaining the system.

Core roles:

- `$harness-engineering`: project harness, AGENTS.md, docs/spec/tools/assets, overall workflow.
- `$mattpocock-skill-router`: programming workflow router; selects grill, PRD, issues, TDD, diagnose, architecture, or handoff flow.
- `grill-me` / `grill-with-docs`: requirement interrogation; ask the user until ambiguity is resolved.
- `to-prd` / `$spec`: PRD, requirements, non-goals, and acceptance criteria.
- `to-issues` / `$plan`: implementation slices and execution order.
- `$coding-manager`: PRD-to-code delivery with selected sub-agents, validation, audit, and fix loops.
- `$research`: external facts, APIs, libraries, papers, or current technical decisions.
- `$test` / `$debug` / `$review`: verification, diagnosis, and independent review.
- `$memory` / `$context-compress`: durable project context and handoff.
- `$multi-agent`: fallback general multi-agent split when `coding-manager` is not the right controller.

Default flow:

1. Elicit requirements by asking the user focused questions until the product behavior is clear enough to write.
2. Use `$mattpocock-skill-router` to route unclear requirements to `grill-me` or `grill-with-docs`, then to `to-prd`.
3. Use `$spec` or `to-prd` to write the PRD, acceptance criteria, and non-goals.
4. Use `$mattpocock-skill-router` to route PRD-to-issues, prototype, TDD, diagnose, architecture, or handoff work.
5. Use `$plan` to sequence implementation only after the PRD or brief is stable enough.
6. Use `$coding-manager` for PRD-to-code delivery, agent selection, sub-agent dispatch, integration, validation, audit, and fix loops.
7. Use `$research` only when external facts, APIs, or library behavior are uncertain.
8. Use `$test` to verify behavior.
9. Use `$debug` when verification fails.
10. Use `$review` before considering the change done.
11. Use `$memory` to preserve durable project facts.
12. Use `$context-compress` before handoff or long continuation.

## AGENTS.md Rules

When creating or updating `AGENTS.md`, include:

- Project purpose and stack.
- Required commands for setup, build, test, lint, and run.
- Directory map.
- Coding conventions.
- Testing policy.
- Change safety rules.
- Definition of done.
- Where specs, docs, and tools live.

Keep it operational. Avoid motivational language and broad theory.

## Workflow

1. Inspect the existing project before adding structure.
2. Preserve existing conventions and docs.
3. If the user's request is underspecified, question the user before writing PRD or code.
4. Add missing harness files only where they help agents act more reliably.
5. Prefer templates as a starting point, then tailor to the repo.
6. Validate by checking that a future agent could answer:
   - What should I build?
   - Where should I look?
   - Which commands prove it works?
   - What should I never touch casually?
   - Which acceptance criteria must pass before delivery?

## Rules

- Do not put full project documentation inside a skill; keep project-specific truth in the project.
- Do not duplicate the same rule across many files unless it is intentionally repeated for visibility.
- Do not add scripts under `tools/` unless they are executable and useful.
- Do not let coding begin from vague intent when a PRD or implementation brief is needed.
- Prefer `coding-manager` over ad hoc multi-agent orchestration for software delivery.
- Treat the harness as living infrastructure: update it when the workflow changes.
