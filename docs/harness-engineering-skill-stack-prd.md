# PRD: Harness Engineering Skill Stack Repository

## Problem Statement

The repository currently risks looking like a flat dump of unrelated skills. The user wants a Harness Engineering repository whose directory structure itself communicates the intended AI software development workflow, while still installing correctly into Codex's flat skills directory.

The user also wants the project to include the real workflow components: Matt Pocock workflow routing for engineering process constraints, `coding-manager` for subagent-based delivery, requirement interrogation before PRD, and validation/review loops before any push.

The user expects project harness initialization to happen as part of the workflow after PRD readiness, not as a separate command the user must remember to ask for.

The user also expects generated target projects to include auditable execution directories for test, debug, review, memory, handoff, and final reports. These directories should contain standards and reports so users and `coding-manager` can inspect evidence before accepting work.

## Solution

Organize the repository by workflow stage instead of alphabetically flattening every skill folder. Keep installability by adding a deterministic installer that expands the nested repository layout into Codex's flat `$USERPROFILE\.codex\skills` directory.

The project should be validated locally against this PRD before committing or pushing. Audit and QA should check whether the current local project matches the intended structure, documentation, install behavior, and skill responsibilities.

When the harness is applied to a target software project, the `harness-engineering` skill should automatically initialize or normalize the project structure after PRD/brief readiness if the structure is missing.

The generated target-project template should include execution evidence directories. Test, debug, and review agents should write reports there, and `coding-manager` should use those reports to decide whether the overall acceptance criteria pass.

## User Stories

1. As a repository reader, I want the `skills/` directory grouped by workflow stage, so that I can understand the Harness Engineering process from the folder tree.
2. As a Codex user, I want a single install command, so that nested repository organization does not break Codex skill discovery.
3. As a Harness Engineering user, I want `harness-engineering` to act as the top-level coordinator, so that project structure, `AGENTS.md`, docs, specs, tools, and workflow rules are centralized.
4. As a developer, I want `mattpocock-skill-router` included as the workflow router, so that coding process choices are constrained by the Matt Pocock workflow suite.
5. As a developer, I want `grill-me` and `grill-with-docs` grouped under requirements, so that vague ideas are questioned before PRD or code.
6. As a product owner, I want `to-prd` and `spec` grouped under requirements/PRD, so that clarified intent becomes acceptance criteria and non-goals.
7. As an implementer, I want `to-issues`, `plan`, and `prototype` grouped under planning/prototyping, so that PRDs become executable slices.
8. As a delivery lead, I want `coding-manager` grouped as the delivery manager, so that it owns subagent selection, QA, review, integration, and fix loops.
9. As a delivery lead, I want `coding-manager/assets/subagents/*.toml` preserved unchanged, so that its subagent pack remains intact.
10. As a researcher, I want `research` grouped separately, so that external facts, APIs, libraries, papers, and current data are handled intentionally.
11. As a debugger, I want `debug` and `diagnose` grouped together, so that failure diagnosis is easy to find.
12. As a QA reviewer, I want `test`, `tdd`, and `review` grouped together, so that validation and independent audit are visible.
13. As a long-running project user, I want `memory`, `context-compress`, and `handoff` grouped together, so that persistence and transfer are explicit.
14. As an architecture maintainer, I want `improve-codebase-architecture`, `triage`, and `zoom-out` grouped together, so that broader project health workflows are discoverable.
15. As a project owner, I want `multi-agent` to be marked as fallback, so that it is not confused with `coding-manager`.
16. As a project owner, I want local verification before push, so that GitHub is not updated until the local structure is approved.
17. As a bilingual reader, I want English and Chinese README files to describe the same workflow, so that both audiences understand the repository.
18. As a future maintainer, I want `AGENTS.md` to describe the repo rules, so that future agents know not to flatten the workflow structure accidentally.
19. As a Harness Engineering user, I want project initialization to happen automatically after PRD readiness, so that I do not need to issue a separate initialization command.
20. As a user, I want generated projects to include `test/`, `debug/`, `review/`, and `reports/`, so that I can inspect evidence instead of trusting a chat summary.
21. As `coding-manager`, I want test, debug, review, and acceptance reports, so that I can judge whether delivery satisfies the PRD.
22. As a QA agent, I want `test/STANDARD.md` and `test/reports/`, so that testing method and results are explicit.
23. As a debugger agent, I want `debug/STANDARD.md` and `debug/reports/`, so that root-cause analysis is recorded.
24. As a reviewer agent, I want `review/STANDARD.md` and `review/reports/`, so that independent audit results are durable.

## Implementation Decisions

- Use workflow-stage directories under `skills/`:
  - `00-harness`
  - `10-workflow-router`
  - `20-requirements-prd`
  - `30-planning-prototyping`
  - `40-delivery-manager`
  - `50-research`
  - `60-debugging`
  - `70-validation-review`
  - `80-memory-handoff`
  - `90-architecture-triage`
  - `99-fallback-multi-agent`
- Keep individual skill folders unchanged inside their stage directories unless the user explicitly asks to edit them.
- Add a PowerShell installer that recursively finds `SKILL.md` files and copies each containing folder into Codex's flat skills directory.
- Keep `coding-manager` as the delivery controller, not as `multi-agent`.
- Keep `multi-agent` only as a fallback for non-software-delivery multi-agent work or cases where `coding-manager` is not the right controller.
- Treat target-project harness initialization as an automatic workflow step after PRD or implementation brief readiness.
- Ask before initialization only when existing files would be overwritten, existing conventions conflict, or the target project root is ambiguous.
- Add execution evidence directories to the target-project template:
  - `test/`
  - `debug/`
  - `review/`
  - `reports/`
  - `memory/`
  - `handoff/`
- Include `STANDARD.md` files that define how each execution directory should be used.
- Require final acceptance to reference test, debug when applicable, and review reports.
- Do not push changes until local PRD compliance has been audited and the user approves.

## Testing Decisions

- Test the install script against a temporary destination to prove nested repository layout can become flat Codex installation layout.
- Validate representative critical skills with the Codex skill validator:
  - `harness-engineering`
  - `mattpocock-skill-router`
  - `coding-manager`
  - `spec`
  - `plan`
  - `research`
  - `debug`
  - `test`
  - `review`
  - `memory`
  - `context-compress`
  - `multi-agent`
- Check that the installer installs 23 skills.
- Check that `coding-manager/assets/subagents/*.toml` exists after reorganization.
- Check that README and Chinese README describe the staged structure and installer.
- Check that the target-project template includes execution evidence directories and standards.
- Check that `AGENTS.md` tells agents to write test, debug, review, and acceptance reports.
- Review git status to ensure changes are local and unpushed.

## Out of Scope

- Rewriting the original Matt Pocock workflow skills.
- Rewriting `coding-manager` or its bundled subagent TOML files.
- Publishing to GitHub before local approval.
- Creating a new package manager or marketplace format.
- Solving Windows terminal encoding display issues unless the underlying files are actually corrupted.

## Further Notes

The repository may use a nested layout for human comprehension while installing into a flat layout for Codex compatibility. This dual representation is intentional and should be documented clearly.
