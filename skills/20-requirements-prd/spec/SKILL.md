---
name: spec
description: Elicit requirements, research existing solutions, compare implementation options, show the execution flow, and convert software ideas into user-confirmed buildable specifications. Use when the user asks for a spec, PRD, requirements, acceptance criteria, design doc, issue breakdown, solution recommendation, or spec-driven development before implementation, especially when the idea must be clarified through questions first.
---

# Spec

Turn an idea into a specification that can drive code and tests. Requirements are discovered by questioning the user and checking existing solutions, not guessed from vague intent or rebuilt from scratch by default.

## Workflow

1. Ask focused questions until the user problem, target outcome, users, workflow, constraints, and success criteria are clear enough.
2. Reflect back the understood scope and ask for correction when stakes are high.
3. Analyze the request for likely existing products, libraries, services, templates, prior art, or established design patterns.
4. Use `$research` or web research when current external facts matter: APIs, library maturity, active maintenance, pricing, licensing, security, or ecosystem fit.
5. Summarize existing solutions before proposing custom work.
6. Present multiple solution paths, normally A/B/C/D:
   - A: reuse an existing product, library, or template,
   - B: integrate existing components with light custom glue,
   - C: build a focused custom implementation,
   - D: defer, prototype, or choose a narrower first slice.
7. Compare options against constraints: user value, time, cost, complexity, maintenance, risk, lock-in, testability, and fit with the existing codebase.
8. Recommend one option and explain why it is the best default.
9. Identify users, workflows, inputs, outputs, and constraints.
10. Write functional requirements as observable behavior.
11. Write non-functional requirements only when they affect implementation.
12. Add acceptance criteria that can be tested.
13. Note out-of-scope items to protect the first version.
14. Split the PRD into staged tasks such as `TASK-1`, `TASK-2`, and `TASK-3`.
15. Define a gate for every task: coding-manager delivery, test evidence, review evidence, final status.
16. Require serialized execution: do not start the next task until the current task is implemented by `coding-manager`, audited, and accepted.
17. Show the user the PRD summary, staged task plan, execution flow diagram, and AGENTS.md-relevant operating rules in the current conversation.
18. Ask the user to confirm or revise the PRD and AGENTS.md rules before implementation begins.

## Output Shape

- Problem
- Goals
- Non-goals
- Existing Solutions / Prior Art
- Options
- Recommendation
- Execution Flow Diagram
- User flows
- Requirements
- Acceptance criteria
- Staged Tasks
- Per-Task Gates
- AGENTS.md Rules To Apply
- Risks
- Implementation slices

## Rules

- Avoid vague requirements such as "fast" or "simple" without a measurable meaning.
- Do not invent core product decisions when the user can answer them.
- Do not default to building from scratch before checking existing solutions.
- Separate facts from recommendations; cite or name sources when research was used.
- If research was skipped, state why the answer is based on local/project knowledge only.
- Always show a Mermaid flowchart in the current conversation before implementation.
- Always show PRD and AGENTS.md-relevant rules to the user for confirmation before coding.
- Treat staged tasks as gates: `TASK-N+1` starts only after `TASK-N` is accepted.
- Each task must produce or reference `test/reports/`, `debug/reports/` when applicable, `review/reports/`, and final `reports/` evidence.
- Ask one small batch of high-value questions at a time.
- Keep the first version small enough to ship.
- Tests should trace back to acceptance criteria.
