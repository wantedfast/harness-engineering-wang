# PRD: Codex Project Workspace Harness Layout

## Problem Statement

The harness currently describes the target project as a software repository root. In Codex App usage, this can produce a confusing workspace: a downloaded repository is placed directly in the current local folder, and the harness is initialized inside that repo. The user expects the Codex App's top-left Project to be the visible work container, with the harness initialized at that Project workspace root and the software repository placed inside one of its subdirectories.

The user's intended workflow is specifically the Codex App `Project` control in the left sidebar: create a new visible work project with `Start from scratch`, or bind a visible project to a folder with `Use an existing folder`. A filesystem-only folder created in a transient/current thread workspace is not sufficient when the user asks for a new work project that should be easy to see and reopen from the Codex UI.

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

When the user asks to create a new work project, download a repo into a harness, or otherwise start a visible project, the skill must treat Codex App Project creation/selection as the first step. If an app tool can create or select a Project, use it. If no such tool is available, stop and tell the user to use the left sidebar `Project` menu (`Start from scratch` or `Use an existing folder`) before continuing. Do not silently treat the current thread directory as the visible Project.

## User Stories

1. As a Codex App user, I want the top-left Project to be the visible harness workspace, so that the project structure is intuitive.
2. As a Codex App user, I want downloaded repositories placed under a dedicated directory such as `repos/<repo-name>/`, so that the harness root is not confused with a single repo checkout.
3. As a future agent, I want `AGENTS.md` at the workspace root to explain where repositories live, so that I do not accidentally initialize harness files inside the wrong directory.
4. As a project owner, I want docs, spec, memory, handoff, and evidence reports at the workspace level, so that cross-repo planning and acceptance evidence are easy to find.
5. As an implementer, I want repository-specific commands to run inside `repos/<repo-name>/`, so that source code workflows remain scoped to the correct checkout.
6. As a Codex App user, I want the agent to tell me when it cannot create the visible Project itself, so that I can use `Project -> Start from scratch` or `Project -> Use an existing folder` instead of losing work in an invisible transient workspace.

## Requirements

- `harness-engineering` must distinguish between:
  - **Workspace root**: the Codex Project or generated Codex working directory where harness files live.
  - **Repo root**: a source checkout under `repos/<repo-name>/`, or another explicitly documented repository directory.
- In Codex App, projectless, or generated Codex workspaces, prefer the workspace-root harness layout.
- Before initializing a new user-facing work project in Codex App, use available app Project tools to create/select a visible Project when possible.
- If no app Project creation/selection tool is available, instruct the user to create or select the visible Project from the left sidebar `Project` menu before continuing.
- Do not silently use the current thread directory as a substitute for a visible Codex Project when the user asked for a new work project.
- When downloading or cloning a repo for a harness-managed effort, place it under `repos/<repo-name>/` by default.
- Add `repos/` to the harness directory map and templates.
- Explain in `AGENTS.md` that workspace-level docs/spec/reports live outside the repo checkout, while implementation commands run inside the relevant repo.
- If the current directory is already a repo root and the user explicitly asked to operate there, preserve that existing layout rather than moving files.
- Ask before reorganizing an existing checkout if moving the repo or creating a parent workspace would conflict with existing files.

## Acceptance Criteria

- `skills/00-harness/harness-engineering/SKILL.md` documents the Codex Project workspace layout and default `repos/<repo-name>/` placement.
- `skills/00-harness/harness-engineering/SKILL.md` requires a visible Codex App Project gate before new work-project initialization and gives the fallback instruction when no app tool can create/select the Project.
- The software project template includes `repos/` in `AGENTS.md` and `README.md`.
- The PRD exists in `docs/` so future maintainers can trace the requirement.
- Local validation confirms the edited skill still has valid frontmatter and can be installed.
- An independent audit agent verifies the requirement is implemented before pushing.

## Non-Goals

- Creating or controlling Codex App UI projects programmatically when no Project tool is available. In that case, the skill must instruct the user to use the visible Project UI.
- Moving existing repositories automatically without user consent.
- Replacing Codex's flat skill installation layout under `~/.codex/skills`.
- Changing the staged repository organization under this skill-stack repo.

## Implementation Notes

The skill cannot always manipulate the Codex App top-left Project selector directly. When a callable project tool is available and the user asks to create a new Codex work project, agents should use that app capability. When no such tool is available, agents should pause project creation and instruct the user to use `Project -> Start from scratch` or `Project -> Use an existing folder`; after the user opens/chooses that visible Project, agents should initialize the workspace-root harness there and place cloned repos under `repos/`.
