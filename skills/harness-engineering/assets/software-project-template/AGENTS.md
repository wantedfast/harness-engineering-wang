# AGENTS.md

## Project

Describe what this project does, who it serves, and the main technology stack.

## Directory Map

- `assets/`: project assets and reusable resources.
- `docs/`: architecture notes, decisions, runbooks, and domain documentation.
- `spec/`: requirements, acceptance criteria, and task breakdowns.
- `tools/`: deterministic scripts for setup, build, test, lint, generation, or evaluation.
- `README.md`: human-facing project overview.

## Commands

Fill these in with real commands before relying on agents.

```bash
# install

# run

# test

# lint

# build
```

## Working Rules

- Inspect relevant files before editing.
- Keep changes scoped to the requested behavior.
- Preserve unrelated user changes.
- Update `spec/` when behavior changes.
- Update `docs/` when architecture or workflow changes.
- Add or update tests for bug fixes and user-visible behavior.
- Run the most targeted verification command before reporting completion.

## Definition Of Done

- Behavior matches the relevant spec or request.
- Tests or equivalent verification have passed.
- New commands, conventions, or gotchas are documented.
- No secrets, generated noise, or irrelevant files are committed.
