---
name: spec
description: Elicit requirements and convert software ideas into buildable specifications. Use when the user asks for a spec, PRD, requirements, acceptance criteria, design doc, issue breakdown, or spec-driven development before implementation, especially when the idea must be clarified through questions first.
---

# Spec

Turn an idea into a specification that can drive code and tests. Requirements are discovered by questioning the user, not guessed from vague intent.

## Workflow

1. Ask focused questions until the user problem, target outcome, users, workflow, constraints, and success criteria are clear enough.
2. Reflect back the understood scope and ask for correction when stakes are high.
3. Identify users, workflows, inputs, outputs, and constraints.
4. Write functional requirements as observable behavior.
5. Write non-functional requirements only when they affect implementation.
6. Add acceptance criteria that can be tested.
7. Note out-of-scope items to protect the first version.
8. Convert the spec into implementation slices when the user is ready.

## Output Shape

- Problem
- Goals
- Non-goals
- User flows
- Requirements
- Acceptance criteria
- Risks
- Implementation slices

## Rules

- Avoid vague requirements such as "fast" or "simple" without a measurable meaning.
- Do not invent core product decisions when the user can answer them.
- Ask one small batch of high-value questions at a time.
- Keep the first version small enough to ship.
- Tests should trace back to acceptance criteria.
