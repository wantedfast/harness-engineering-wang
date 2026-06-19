---
name: mattpocock-skill-router
description: Route engineering, product planning, prototyping, debugging, testing, architecture, issue breakdown, and handoff requests to the right Matt Pocock workflow skill. Use when the user asks to use the Matt Pocock skills, wants a main router or controller for those skills, says they do not know which skill to use, or asks to continue an engineering project through requirements, PRD, issues, prototype, implementation, diagnosis, review, or handoff.
---

# Matt Pocock Skill Router

## Overview

Use this as the dispatcher for the Matt Pocock skill suite. First identify the user's current intent, then either invoke the matching installed skill or follow that skill's workflow if it is not available in the active skill list.

This skill cannot mechanically call another skill like a function. It gives Codex a routing policy: choose the smallest relevant workflow, announce that choice briefly, then proceed.

## Routing Table

- Ambiguous plan, vague product idea, or user asks to be questioned:
  Use `grill-me`.

- Requirements need domain terms, ADRs, or durable project docs:
  Use `grill-with-docs`.

- Current conversation should become a product requirements document:
  Use `to-prd`.

- PRD, plan, or feature needs to become implementation tickets:
  Use `to-issues`.

- User wants to sanity-check a state model, workflow, or UI direction quickly:
  Use `prototype`.

- User explicitly wants test-first development, or a risky logic change benefits from tests:
  Use `tdd`.

- Bug, failure, flaky behavior, broken command, or performance regression:
  Use `diagnose`.

- User is lost in unfamiliar code or asks how a module fits into the system:
  Use `zoom-out`.

- Codebase is becoming tangled, hard to test, or needs architecture/refactor review:
  Use `improve-codebase-architecture`.

- Incoming issue/bug/request needs classification, clarification, or readiness checks:
  Use `triage`.

- Conversation needs to be compacted for another agent, thread, or future session:
  Use `handoff`.

- User asks for terse output or low-token mode:
  Use `caveman`.

- User wants to learn a concept over multiple sessions:
  Use `teach`.

- User wants to create or improve a skill:
  Use `write-a-skill` unless the built-in `skill-creator` skill is a better fit for Codex-native skill packaging.

## Default Project Flow

For a new MVP or feature project, prefer this sequence unless the user redirects:

1. `grill-me` or `grill-with-docs` to resolve ambiguity.
2. `to-prd` to capture the agreed scope.
3. `to-issues` to split vertical slices.
4. `prototype` when the UI, state model, or workflow still needs a quick proof.
5. `tdd` for core logic and risky behavior.
6. `diagnose` when verification fails.
7. `improve-codebase-architecture` after meaningful code exists and starts to sprawl.
8. `handoff` when context must move to another session or agent.

## Operating Rules

- Do not run every skill in the suite. Pick one workflow for the current user intent.
- If two skills apply, prefer the one closest to the user's requested artifact.
- If the user already provided enough context, skip interrogation and move to synthesis or implementation.
- If the selected skill is not installed or not active until restart, say so and continue with the equivalent workflow manually.
- Keep the user-facing routing explanation to one short sentence.

## Example Triggers

- "Use the Matt Pocock skills and continue this project" -> choose the next step from Default Project Flow.
- "I do not know which skill to use" -> route based on the user's goal.
- "Continue this project" -> inspect the latest project state, choose PRD, issues, prototype, implementation, or diagnose.
- "The requirements are unclear" -> `grill-me`.
- "Turn this into a PRD" -> `to-prd`.
- "Break this into development tasks" -> `to-issues`.
- "Make a playable prototype first" -> `prototype`.
- "Use test-driven development" -> `tdd`.
- "This command is failing" -> `diagnose`.
