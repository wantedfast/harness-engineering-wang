# PRD: Codex Project Workspace Harness Layout

## Problem Statement

The harness currently describes the target project as a software repository root. In Codex App usage, this can produce a confusing workspace: a downloaded repository is placed directly in the current local folder, and the harness is initialized inside that repo. The user expects the Codex App's top-left Project to be the visible work container, with the harness initialized at that Project workspace root and the software repository placed inside one of its subdirectories.

The desired mental model is:

```text
Codex Project workspace/
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
  AGENTS.md
  README.md
```

This is more intuitive in Codex App because the left-top Project represents the overall work area, while one or more repositories can live under that Project as implementation targets.

## Goal

Update `harness-engineering` so future agents prefer initializing the harness at the Codex Project workspace root when operating in Codex App or projectless/generated Codex workspaces. The repository checkout should be placed under `repos/<repo-name>/` by default, unless the user explicitly asks for a different layout or the existing workspace already has a clear convention.

## User Stories

1. As a Codex App user, I want the top-left Project to be the visible harness workspace, so that the project structure is intuitive.
2. As a Codex App user, I want downloaded repositories placed under a dedicated directory such as `repos/<repo-name>/`, so that the harness root is not confused with a single repo checkout.
3. As a future agent, I want `AGENTS.md` at the workspace root to explain where repositories live, so that I do not accidentally initialize harness files inside the wrong directory.
4. As a project owner, I want docs, spec, memory, handoff, and evidence reports at the workspace level, so that cross-repo planning and acceptance evidence are easy to find.
5. As an implementer, I want repository-specific commands to run inside `repos/<repo-name>/`, so that source code workflows remain scoped to the correct checkout.

## Requirements

- `harness-engineering` must distinguish between:
  - **Workspace root**: the Codex Project or generated Codex working directory where harness files live.
  - **Repo root**: a source checkout under `repos/<repo-name>/`, or another explicitly documented repository directory.
- In Codex App, projectless, or generated Codex workspaces, prefer the workspace-root harness layout.
- When downloading or cloning a repo for a harness-managed effort, place it under `repos/<repo-name>/` by default.
- Add `repos/` to the harness directory map and templates.
- Explain in `AGENTS.md` that workspace-level docs/spec/reports live outside the repo checkout, while implementation commands run inside the relevant repo.
- If the current directory is already a repo root and the user explicitly asked to operate there, preserve that existing layout rather than moving files.
- Ask before reorganizing an existing checkout if moving the repo or creating a parent workspace would conflict with existing files.

## Acceptance Criteria

- `skills/00-harness/harness-engineering/SKILL.md` documents the Codex Project workspace layout and default `repos/<repo-name>/` placement.
- The software project template includes `repos/` in `AGENTS.md` and `README.md`.
- The PRD exists in `docs/` so future maintainers can trace the requirement.
- Local validation confirms the edited skill still has valid frontmatter and can be installed.
- An independent audit agent verifies the requirement is implemented before pushing.

## Non-Goals

- Creating or controlling Codex App UI projects programmatically when no thread/project tool is available.
- Moving existing repositories automatically without user consent.
- Replacing Codex's flat skill installation layout under `~/.codex/skills`.
- Changing the staged repository organization under this skill-stack repo.

## Implementation Notes

The skill cannot always manipulate the Codex App top-left Project selector directly. When a callable thread/project tool is available and the user asks to create a new Codex project/thread, agents should use that app capability. When no such tool is available, agents should still create the workspace-root directory structure in the current Codex workspace and place cloned repos under `repos/`.
