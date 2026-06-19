---
name: multi-agent
description: Coordinate multiple agents for larger software projects. Use when the user asks for multi-agent work, agent roles, parallel implementation, architecture plus coding plus testing, or a manager-style workflow for complex changes.
---

# Multi Agent

Split complex work into role-bounded agents with clear inputs, outputs, and merge checkpoints.

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
- Do not let agents make incompatible assumptions silently.
- Main agent remains responsible for final correctness.
