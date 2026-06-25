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

1. Start with conversational PRD discovery. Ask one high-leverage clarification question at a time, not a full questionnaire, unless the user explicitly asks for a full questionnaire.
2. For each question, include the assistant's recommendation: why the question matters, common options, the tradeoff behind each option, the recommended default for this project, and how the user can answer.
3. After each user answer, update an incremental PRD draft in the conversation. Keep it short and mark decisions as Confirmed, Assumed, or Open.
4. Continue question-by-question until the core decisions are clear enough to form a stable PRD or implementation brief.
5. If the user asks to skip questions, make reasonable assumptions, clearly mark them as Assumed, and continue instead of blocking.
6. Use `$mattpocock-skill-router` to route difficult or contentious requirements to `grill-me` or `grill-with-docs`; keep the same one-question-at-a-time interaction style unless the user requests otherwise.
7. Before finalizing the PRD, use `$spec` plus `$research` when external facts, APIs, libraries, templates, services, or established patterns materially affect the decision. Avoid defaulting to custom work when reuse is viable.
8. Only after enough core decisions are collected, write the complete PRD with Background / Problem, Goal, Non-goals, Users / Stakeholders, Core Workflow, Requirements, Technical Design, Execution Split, Milestones, Risks, and Acceptance Criteria.
9. Show the user, in the current conversation, the execution flow diagram, complete PRD summary, staged tasks, AGENTS.md-relevant rules, and file index paths for the PRD, AGENTS.md, task plan, test reports, debug reports, review reports, acceptance reports, and output artifacts. Ask for confirmation or revisions before implementation.
10. Inspect the target project harness only after the Visible Project Gate has passed, or after the user explicitly chose an in-place repo workflow. In Codex App workspaces, prefer the workspace root as the harness root and keep repo checkouts under `repos/<repo-name>/`. If `AGENTS.md`, `spec/`, `docs/`, `tools/`, `test/`, `debug/`, `review/`, `reports/`, `memory/`, `handoff/`, `repos/`, or other required harness files are missing, add or normalize them before coding work begins.
11. Use `$mattpocock-skill-router` to route PRD-to-issues, prototype, TDD, diagnose, architecture, or handoff work.
12. Use `$plan` to sequence implementation only after the PRD or brief is stable enough.
13. After the user accepts the PRD, AGENTS.md, task plan, test plan, debug plan, review plan, and acceptance plan, `$coding-manager` is mandatory for implementation. If `coding-manager` tooling is unavailable, stop and tell the user before coding unless the user explicitly overrides this gate.
14. Use `$coding-manager` for exactly one staged task at a time. Do not start `TASK-N+1` until `TASK-N` has delivery evidence, test evidence, debug evidence when failures occurred, review evidence, and accepted final status.
15. Use `$research` again only when external facts, APIs, or library behavior remain uncertain.
16. Use `$test` to verify behavior.
17. Use `$debug` when verification fails.
18. Use `$review` before considering the task done.
19. Use `$memory` to preserve durable project facts.
20. Use `$context-compress` before handoff or long continuation.

## Conversational PRD Discovery

Use this mode whenever the user wants to explore, shape, or confirm requirements before implementation.

Default interaction:

1. Ask exactly one clarification question in the assistant turn.
2. Explain why this question matters for the product or implementation.
3. Present the common options and the tradeoff behind each option.
4. Recommend one option for the current project and explain the recommendation briefly.
5. Tell the user how they can answer, including that free-form answers are acceptable.
6. After the user answers, update the incremental PRD draft with the new decision and then ask the next single most important question.

Incremental PRD draft:

- Maintain a compact draft after every answered question.
- Use these decision states:
  - **Confirmed**: the user explicitly decided it.
  - **Assumed**: the user asked to skip, the answer is obvious from context, or a reasonable default is chosen.
  - **Open**: still needs a future question.
- Keep the draft partial until enough core decisions are collected. Do not present it as the final PRD early.
- Let the draft gradually grow toward the final PRD sections:
  - Background / Problem
  - Goal
  - Non-goals
  - Users / Stakeholders
  - Core Workflow
  - Requirements
  - Technical Design
  - Execution Split
  - Milestones
  - Risks
  - Acceptance Criteria

Question selection:

- Ask the question that most reduces uncertainty or implementation risk.
- Prefer boundary questions before detail questions.
- Do not ask about implementation details before user workflow, permissions, data ownership, and success criteria are clear enough.
- Do not bundle multiple independent questions in one turn. If multiple decisions are related, pick the one that unlocks the rest.
- If the user explicitly requests a full questionnaire, a complete PRD, or batch planning, batching questions is allowed.

## AGENTS.md Rules

When creating or updating `AGENTS.md`, include:

- Project purpose and stack.
- Required commands for setup, build, test, lint, and run.
- Workspace and repository root paths when known.
- Directory map for the workspace harness and the implementation repository.
- Project repository structure, including the main source, API, test, docs, scripts, and output directories that agents will touch.
- Coding conventions.
- Testing policy.
- Test, debug, review, and acceptance-report locations.
- Staged-task gate policy: one task at a time; next task waits for accepted evidence.
- Mandatory `coding-manager` gate after the user accepts the PRD, AGENTS.md, task plan, test plan, debug plan, review plan, and acceptance plan.
- Instruction to stop and report if `coding-manager` is unavailable, instead of silently continuing as the main agent.
- Change safety rules.
- Definition of done.
- Where specs, docs, and tools live.
- File index expectations so the user can open PRDs, AGENTS.md, test reports, debug reports, review reports, acceptance reports, and output artifacts.

Keep it operational. Avoid motivational language and broad theory.

## Required File Index

When returning a PRD or completion report to the user, include direct paths to current project files. At minimum include:

- PRD/spec file.
- AGENTS.md.
- Task plan or issue breakdown.
- Test report directory or files.
- Debug report directory or files.
- Review report directory or files.
- Acceptance report directory or files.
- Output artifacts.
- Implementation repo root.

Prefer writing a user-facing file index under `outputs/` when the workspace has an `outputs/` directory, while keeping source-of-truth reports under `spec/`, `test/reports/`, `debug/reports/`, `review/reports/`, and `reports/`.

## Workflow

1. Inspect the existing project before adding structure.
2. Preserve existing conventions and docs.
3. If the user's request is underspecified, enter Conversational PRD Discovery before writing PRD or code.
4. Ask one question at a time by default, provide a recommendation with tradeoffs, and update the incremental PRD draft after each user answer.
5. Write the complete PRD only after the core decisions are stable enough for implementation planning.
6. Once the PRD or implementation brief is stable, initialize or normalize the project harness if required files are missing, but only after the Visible Project Gate has passed or the user explicitly requested in-place repo work.
7. Add missing harness files only where they help agents act more reliably.
8. Prefer templates as a starting point, then tailor to the repo.
9. Validate by checking that a future agent could answer:
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
- Do not ask more than one clarification question in a single assistant turn unless the user explicitly requests a full questionnaire or batch planning.
- Do not use a long one-shot question list as the default PRD discovery style.
- For each clarification question, include the assistant's recommendation and the tradeoff behind the main options.
- After each user answer during discovery, update the incremental PRD draft before moving to the next question.
- Do not generate the complete PRD until enough core decisions are collected.
- If the user asks to skip questions, make reasonable assumptions and clearly mark them as Assumed.
- Do not let PRD writing begin from a single imagined solution when existing solutions have not been considered.
- Do not enter implementation until the user has seen the PRD summary, execution flow diagram, staged tasks, and AGENTS.md-relevant rules.
- Do not run multiple PRD tasks concurrently unless the user explicitly overrides the staged gate policy.
- Do not wait for a separate user command to initialize the project harness after the PRD is ready when the Visible Project Gate has passed or the user explicitly requested in-place repo work; otherwise stop and instruct the user to create/select the visible Codex Project first.
- After the user accepts the PRD, AGENTS.md, task plan, and verification/report plan, `coding-manager` is mandatory for software delivery unless the user explicitly overrides that requirement.
- Prefer `coding-manager` over ad hoc multi-agent orchestration for software delivery before acceptance; require it after acceptance.
- Require `coding-manager` or the main agent to inspect `test/reports/`, `debug/reports/`, `review/reports/`, and `reports/` before declaring acceptance.
- Treat the harness as living infrastructure: update it when the workflow changes.
