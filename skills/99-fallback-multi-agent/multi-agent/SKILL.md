---
name: multi-agent
description: Fallback coordination for multiple agents when coding-manager is unavailable, inappropriate, or the task is not software delivery. Use for general multi-agent work, agent roles, parallel research, documentation, analysis, or non-coding orchestration; for PRD-to-code delivery, prefer coding-manager.
---

# Multi Agent

Split complex non-delivery work into role-bounded agents with clear inputs, outputs, and merge checkpoints.

For software delivery from PRD to code, prefer `coding-manager`. Use this skill only when `coding-manager` is unavailable, too heavy, or not the right controller for the task.

## Workflow

1. Decide whether multiple agents are justified by scope or uncertainty.
2. Define the shared objective and acceptance criteria.
3. Assign narrow roles such as planner, researcher, implementer, tester, reviewer, or docs writer.
4. Give each agent only the context it needs.
5. Require concrete artifacts: patches, notes, test results, findings, or reports.
6. Integrate results in the main thread and resolve conflicts explicitly.
7. Run final verification after integration.

## Role Patterns

- Planner: requirements, decomposition, risks.
- Researcher: external docs, APIs, examples.
- Implementer: scoped code changes.
- Tester: test design and execution.
- Reviewer: defects and missing coverage.
- Documenter: user-facing or repo docs.

## Rules

- Do not spawn agents for tiny tasks.
- Do not use this as a replacement for `coding-manager` in PRD-to-code delivery.
- Do not let agents make incompatible assumptions silently.
- Main agent remains responsible for final correctness.
