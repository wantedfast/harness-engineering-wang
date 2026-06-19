---
name: coding-manager
description: Manage software delivery by deciding which bundled or installed sub-agents are needed, spawning readable role-bounded agents, coordinating coding/testing/audit/debug/architecture/docs work, and running mandatory fix loops until acceptance criteria pass. Use when the user asks for coding manager, multi-agent development, agent-based coding, PRD-to-code delivery, requirements/coding/test/audit coordination, or asks Codex to decide which agents are needed for a project.
---

# Coding Manager

Use this skill as the controller for software delivery. The manager reads the task or PRD, decides which agents are needed, dispatches focused work, integrates results, and keeps validation honest.

This skill includes a curated sub-agent pack under `assets/subagents/`. If those agents have been installed into `~/.codex/agents/` or project `.codex/agents/`, prefer them. If not, use the closest available sub-agent type and keep the same readable role labels in prompts.

This is not a fixed pipeline. Do not always spawn every role. Select the smallest useful agent team for the task.

## Core Loop

```text
1. Assess task / PRD.
2. Select required agents.
3. Dispatch focused prompts.
4. Integrate outputs and code changes.
5. Validate behavior.
6. Audit against acceptance criteria.
7. Send mandatory fixes back to the right agent until audit says OK.
8. Report final result.
```

When sub-agent tools such as `spawn_agent` are available, use visible sub-agents. If sub-agent tools are unavailable, state that limitation and run the same roles as labeled phases in the current conversation.

Do not create separate background Codex threads unless the user explicitly asks for background threads.

## Agent Selection

Before spawning agents, output a compact selection plan:

```text
Selected agents:
- <agent-name>: <why needed>

Skipped agents:
- <agent-name>: <why not needed>
```

Choose agents by task shape:

| Task Shape | Use Agents |
| --- | --- |
| Tiny code edit | `fullstack-developer`, optional `reviewer` |
| Bug with unclear cause | `debugger`, `fullstack-developer`, `qa-expert`, `reviewer` |
| PRD-driven feature | `business-analyst`, `fullstack-developer`, `qa-expert`, `reviewer` |
| Full-stack feature | `business-analyst`, `backend-developer`, `frontend-developer`, `qa-expert`, `reviewer` |
| Risky refactor | `architect-reviewer`, `fullstack-developer`, `qa-expert`, `reviewer` |
| Security-sensitive change | `fullstack-developer`, `security-auditor`, `qa-expert`, `reviewer` |
| Documentation-heavy change | `fullstack-developer`, `documentation-engineer`, `reviewer` |
| Deployment or infra work | use installed infra agents if present; otherwise use `fullstack-developer`, `qa-expert`, `reviewer` |

Default normal feature team:

```text
business-analyst
fullstack-developer
qa-expert
reviewer
```

Only split `fullstack-developer` into `frontend-developer` and `backend-developer` when the scopes are meaningfully independent.

## Bundled Agent Pack

Prefer these bundled agent definitions when installed:

```text
business-analyst        -> requirements and acceptance criteria
fullstack-developer     -> default implementation
frontend-developer      -> frontend-only implementation
backend-developer       -> backend-only implementation
qa-expert               -> test planning and validation
reviewer                -> final audit / PR-style review
debugger                -> root cause analysis
architect-reviewer      -> architecture and boundary review
documentation-engineer  -> documentation updates
security-auditor        -> security-sensitive review
```

## Naming Rules

Use readable user-facing agent names whenever the platform allows naming or nicknames:

```text
business-analyst
fullstack-developer
frontend-developer
backend-developer
qa-expert
reviewer
debugger
architect-reviewer
documentation-engineer
security-auditor
```

Do not leave spawned agents named `alpha`, `bravo`, `agent-1`, or other opaque labels if a readable display name can be set.

If the platform auto-generates opaque names and does not allow renaming, every dispatch prompt and status report must begin with the readable role label, for example:

```text
Role: reviewer
```

## Dispatch Prompt

Every sub-agent prompt must include:

```text
Project:
Work directory:
Role:
Task brief:
Source PRD / acceptance criteria:
Allowed scope:
Forbidden scope:
Required validation:
Expected output:
Whether file edits are allowed:
```

For coding agents, assign explicit file/module ownership when possible and state that other agents may also be working in the codebase, so they must not revert unrelated edits.

## Role Contracts

### business-analyst

Use for unclear or PRD-driven work. It inspects relevant code and writes the implementation brief. It does not edit files.

Output:

```text
Goal
Current code path
Required behavior
User-visible behavior
API / JSON / UI contract
Likely affected files
Out of scope
Acceptance criteria
Validation commands
Acceptance scenario
```

### fullstack-developer / frontend-developer / backend-developer

Use for implementation. It edits only the assigned scope.

Output:

```text
Changed files
Implementation summary
Validation commands run
Key command output
Remaining risks
Git status summary, when available
```

### qa-expert

Use when changed behavior needs proof. It may add or update tests when justified.

Output:

```text
Validation performed
Passing checks
Failing checks
Coverage gaps
Evidence for acceptance criteria
```

### reviewer

Use to keep approval independent from implementation. It does not edit files.

Audit checklist:

- Does the implementation satisfy the PRD or task brief?
- Are acceptance criteria proven?
- Did the implementation avoid unrelated scope?
- Are fallback and error states readable?
- Is user-visible output in the intended place?
- Do tests or manual checks exercise the changed behavior?

Conclusion must be exactly:

```text
OK
```

or:

```text
NOT OK
```

If `NOT OK`, list only mandatory fixes, ordered by severity, with file/function references.

### debugger

Use when the root cause is unknown. It should reproduce, isolate, hypothesize, instrument if useful, and hand a concrete fix brief to coding.

### architect-reviewer

Use when the change affects boundaries, contracts, shared abstractions, migrations, or long-term maintainability. It reviews design risk and recommends the narrowest acceptable structure.

### documentation-engineer

Use when user-facing or developer-facing documentation must change. It should keep docs aligned with implemented behavior.

### security-auditor

Use when auth, permissions, secrets, injection, data exposure, or unsafe external calls are in scope.

### devops / deployment agents

Use when deployment, CI, infrastructure, containers, environment variables, or production rollout are in scope.

## Fix Loop

When audit says `NOT OK`:

1. Extract mandatory fixes only.
2. Send fixes to the owning agent.
3. Rerun relevant validation.
4. Audit again.

Do not let coding invent new requirements after audit says `OK`. Ask the user or start a new task.

## Final Report

When audit says `OK`, report:

```text
Selected agents
What changed
Files changed
Validation run
Audit result
Known residual risks, if any
```

Keep the final response concise.
