# AGENTS.md

## Project

Describe what this project does, who it serves, and the main technology stack.

## Directory Map

- `assets/`: project assets and reusable resources.
- `debug/`: debugging standard and root-cause reports.
- `docs/`: architecture notes, decisions, runbooks, and domain documentation.
- `handoff/`: context handoffs for future sessions or agents.
- `memory/`: durable project facts and conventions.
- `reports/`: final acceptance reports for completed work.
- `repos/`: source repository checkouts that belong to this Codex Project workspace.
- `review/`: review standard and independent audit reports.
- `spec/`: requirements, acceptance criteria, and task breakdowns.
- `test/`: test standard and verification reports.
- `tools/`: deterministic scripts for setup, build, test, lint, generation, or evaluation.
- `README.md`: human-facing project overview.

## Commands

Fill these in with real commands before relying on agents. If source code lives under `repos/<repo-name>/`, run repo-specific setup, test, lint, build, and app commands from that repo root.

```bash
# install

# run

# test

# lint

# build
```

## Working Rules

- Treat this directory as the workspace harness root when it is a Codex Project workspace.
- If the user expected a visible Codex App Project and this folder is not opened as one, tell them to use `Project -> Start from scratch` or `Project -> Use an existing folder` before continuing.
- Put downloaded or cloned implementation repositories under `repos/<repo-name>/` unless the user explicitly requests another layout.
- Keep workspace-level specs, docs, reports, memory, and handoff files outside individual repo checkouts.
- Inspect relevant files before editing.
- Keep changes scoped to the requested behavior.
- Preserve unrelated user changes.
- Update `spec/` when behavior changes.
- Update `docs/` when architecture or workflow changes.
- Add or update tests for bug fixes and user-visible behavior.
- Write test evidence to `test/reports/`.
- Write root-cause analysis to `debug/reports/` when debugging was required.
- Write independent review results to `review/reports/`.
- Write final acceptance evidence to `reports/`.
- Run the most targeted verification command before reporting completion.

## Definition Of Done

- Behavior matches the relevant spec or request.
- Tests or equivalent verification have passed.
- Test, debug, and review evidence exists when the work touched behavior.
- Final acceptance report is `ACCEPTED`, or blockers are clearly documented.
- New commands, conventions, or gotchas are documented.
- No secrets, generated noise, or irrelevant files are committed.
