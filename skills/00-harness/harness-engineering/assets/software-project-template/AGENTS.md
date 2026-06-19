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

## Repository Structure

Document each implementation repository in this workspace before coding. Include the repo root and the source, API, test, docs, scripts, and output directories that agents are allowed to touch.

Example:

```text
repos/<repo-name>/
  src/
  tests/
  docs/
  scripts/
```

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

## Harness Manager Gate

After the user accepts the PRD, AGENTS.md, task plan, test plan, debug plan, review plan, and acceptance plan, implementation must use `coding-manager`.

Hard rule:

```text
Accepted PRD + accepted AGENTS.md + accepted task plan + accepted verification/report plan
-> coding-manager is mandatory
-> execute exactly one staged task at a time
-> collect delivery evidence
-> collect test evidence
-> collect debug evidence when failures occur
-> collect independent review evidence
-> write/update acceptance evidence
-> only then proceed to the next task
```

If `coding-manager` tooling is unavailable, stop and tell the user before implementation. Do not silently downgrade to main-agent-only implementation or an equivalent role-split workflow unless the user explicitly overrides this gate.

## File Index

When returning a PRD or completion report to the user, include direct paths to:

- PRD/spec file.
- AGENTS.md.
- Task plan or issue breakdown.
- Test reports.
- Debug reports.
- Review reports.
- Acceptance reports.
- Output artifacts.
- Implementation repo root.

## Definition Of Done

- Behavior matches the relevant spec or request.
- Tests or equivalent verification have passed.
- Test, debug, and review evidence exists when the work touched behavior.
- Final acceptance report is `ACCEPTED`, or blockers are clearly documented.
- New commands, conventions, or gotchas are documented.
- No secrets, generated noise, or irrelevant files are committed.
