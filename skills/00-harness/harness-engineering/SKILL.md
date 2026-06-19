---
name: harness-engineering
description: Orchestrate AI-assisted software projects using a standard project harness. Use when the user asks to set up AGENTS.md, docs/spec/tools/assets structure, initialize a software project for AI coding, coordinate Matt Pocock workflows, run coding-manager delivery, or execute a question-to-PRD-to-code workflow.
---

# Harness Engineering

Use this skill as the project-level coordinator. It turns a Codex Project workspace or software repo into an AI-operable workspace with clear specs, instructions, tools, validation, and memory.

## Core Standard

Apply this structure when initializing or normalizing a project workspace:

```txt
project/
  assets/
  debug/
  docs/
  handoff/
  memory/
  reports/
  review/
  repos/
    <repo-name>/
  spec/
  test/
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
- `test/`: verification standards and test reports.
- `debug/`: debugging standards and root-cause reports.
- `review/`: review standards and independent audit reports.
- `reports/`: final acceptance reports used by `coding-manager` and users.
- `memory/`: durable project facts and conventions.
- `handoff/`: context handoffs for future agents or sessions.
- `repos/`: source repositories that belong to this Codex Project workspace.
- `README.md`: human-facing project entrypoint.

Use `assets/software-project-template/` as the starter template when a target project lacks this structure. After the PRD or implementation brief is stable enough, initialize or normalize the project harness before planning code delivery only after the Visible Project Gate has passed, or after the user has explicitly asked to work in an existing repo root in place.

Only ask before initialization when the Visible Project Gate has not passed, the action would overwrite existing files, existing conventions conflict, or the intended project root is ambiguous.

## Codex Project Workspace Layout

In Codex App or generated/projectless Codex workspaces, prefer the Codex Project workspace as the harness root. Do not default to treating the downloaded repo checkout as the whole harness root when a parent Codex workspace is available or can be created.

### Visible Project Gate

When the user asks to create a new work project, download a repo for a new project, or start a harness-managed effort that should be visible in Codex App, first make sure there is a visible Codex App Project for that work.

Use this order:

1. If a Codex App Project creation or selection tool is available, use it to create/select the visible Project workspace.
2. If no such tool is available, stop before cloning or initializing the harness and tell the user to use the left sidebar `Project` menu:
   - `Start from scratch` for a new empty workspace.
   - `Use an existing folder` for an already-created workspace folder.
3. Continue only after the selected/opened Project workspace is the current workspace root.

Do not silently use the current thread's generated folder as a substitute for a user-visible Project when the user's intent is to create a work project they can see and reopen from the Codex UI.

Default layout:

```txt
<codex-project-workspace>/
  AGENTS.md
  README.md
  assets/
  debug/
  docs/
  handoff/
  memory/
  reports/
  review/
  spec/
  test/
  tools/
  repos/
    <repo-name>/
```

Use this rule when a user asks to download, clone, initialize, or harness a repo inside Codex: create or select a visible Project workspace first, initialize the harness at that root, then place the repo under `repos/<repo-name>/` by default.

Distinguish these paths explicitly:

- **Workspace root**: the Codex Project visible in the app, where `AGENTS.md`, `spec/`, `docs/`, `reports/`, `memory/`, and `handoff/` live.
- **Repo root**: the implementation checkout, normally `repos/<repo-name>/`, where package commands, source edits, and repo-specific tests run.

If the current directory is already a repo root and the user explicitly asked to work in place, preserve that layout. Ask before moving an existing checkout, creating a parent workspace, or changing a user's established directory convention. If the user expected a visible Codex Project instead, guide them to create/select that Project first rather than normalizing in place.

## Skill Stack

For the full stack and routing table, read `references/skill-stack.md` when coordinating multiple skills or explaining the system.

Core roles:

- `$harness-engineering`: project harness, AGENTS.md, docs/spec/tools/assets, overall workflow.
- `$mattpocock-skill-router`: programming workflow router; selects grill, PRD, issues, TDD, diagnose, architecture, or handoff flow.
- `grill-me` / `grill-with-docs`: requirement interrogation; ask the user until ambiguity is resolved.
- `to-prd` / `$spec`: requirements, existing-solution research, option comparison, recommendation, PRD, staged tasks, execution flow diagram, non-goals, and acceptance criteria.
- `to-issues` / `$plan`: implementation slices and execution order.
- `$coding-manager`: PRD-to-code delivery with selected sub-agents, validation, audit, and fix loops.
- `$research`: external facts, APIs, libraries, papers, or current technical decisions.
- `$test` / `$debug` / `$review`: verification, diagnosis, and independent review.
- `$memory` / `$context-compress`: durable project context and handoff.
- `$multi-agent`: fallback general multi-agent split when `coding-manager` is not the right controller.

Default flow:

1. Elicit requirements by asking the user focused questions until the product behavior is clear enough to write.
2. Use `$mattpocock-skill-router` to route unclear requirements to `grill-me` or `grill-with-docs`, then to `to-prd`.
3. Before writing the PRD, use `$spec` plus `$research` when needed to check existing products, libraries, templates, services, and established patterns. Avoid defaulting to custom work when reuse is viable.
4. Require the requirements output to include options, normally A/B/C/D, and a clear recommendation with tradeoffs.
5. Use `$spec` or `to-prd` to write the PRD, acceptance criteria, non-goals, staged tasks, and per-task gates.
6. Show the user, in the current conversation, the execution flow diagram, PRD summary, staged tasks, and AGENTS.md-relevant rules. Ask for confirmation or revisions before implementation.
7. Inspect the target project harness only after the Visible Project Gate has passed, or after the user explicitly chose an in-place repo workflow. In Codex App workspaces, prefer the workspace root as the harness root and keep repo checkouts under `repos/<repo-name>/`. If `AGENTS.md`, `spec/`, `docs/`, `tools/`, `test/`, `debug/`, `review/`, `reports/`, `memory/`, `handoff/`, `repos/`, or other required harness files are missing, add or normalize them before coding work begins.
8. Use `$mattpocock-skill-router` to route PRD-to-issues, prototype, TDD, diagnose, architecture, or handoff work.
9. Use `$plan` to sequence implementation only after the PRD or brief is stable enough.
10. Use `$coding-manager` for exactly one staged task at a time. Do not start `TASK-N+1` until `TASK-N` has delivery evidence, test evidence, review evidence, and accepted final status.
11. Use `$research` again only when external facts, APIs, or library behavior remain uncertain.
12. Use `$test` to verify behavior.
13. Use `$debug` when verification fails.
14. Use `$review` before considering the task done.
15. Use `$memory` to preserve durable project facts.
16. Use `$context-compress` before handoff or long continuation.

## AGENTS.md Rules

When creating or updating `AGENTS.md`, include:

- Project purpose and stack.
- Required commands for setup, build, test, lint, and run.
- Directory map.
- Coding conventions.
- Testing policy.
- Test, debug, review, and acceptance-report locations.
- Staged-task gate policy: one task at a time; next task waits for accepted evidence.
- Change safety rules.
- Definition of done.
- Where specs, docs, and tools live.

Keep it operational. Avoid motivational language and broad theory.

## Workflow

1. Inspect the existing project before adding structure.
2. Preserve existing conventions and docs.
3. If the user's request is underspecified, question the user before writing PRD or code.
4. Once the PRD or implementation brief is stable, initialize or normalize the project harness if required files are missing, but only after the Visible Project Gate has passed or the user explicitly requested in-place repo work.
5. Add missing harness files only where they help agents act more reliably.
6. Prefer templates as a starting point, then tailor to the repo.
7. Validate by checking that a future agent could answer:
   - What should I build?
   - Where should I look?
   - Which commands prove it works?
   - What should I never touch casually?
   - Which acceptance criteria must pass before delivery?
   - Where is the test/debug/review evidence?
   - Which staged task is currently active?

## Rules

- Do not put full project documentation inside a skill; keep project-specific truth in the project.
- Do not duplicate the same rule across many files unless it is intentionally repeated for visibility.
- Do not add scripts under `tools/` unless they are executable and useful.
- Do not let coding begin from vague intent when a PRD or implementation brief is needed.
- Do not let PRD writing begin from a single imagined solution when existing solutions have not been considered.
- Do not enter implementation until the user has seen the PRD summary, execution flow diagram, staged tasks, and AGENTS.md-relevant rules.
- Do not run multiple PRD tasks concurrently unless the user explicitly overrides the staged gate policy.
- Do not wait for a separate user command to initialize the project harness after the PRD is ready when the Visible Project Gate has passed or the user explicitly requested in-place repo work; otherwise stop and instruct the user to create/select the visible Codex Project first.
- Prefer `coding-manager` over ad hoc multi-agent orchestration for software delivery.
- Require `coding-manager` or the main agent to inspect `test/reports/`, `debug/reports/`, `review/reports/`, and `reports/` before declaring acceptance.
- Treat the harness as living infrastructure: update it when the workflow changes.
