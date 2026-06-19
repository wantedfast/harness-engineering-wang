# Harness Engineering Wang

An AI-assisted software engineering harness for Codex-style skill workflows.

This repository packages a small, composable skill stack for turning vague software ideas into PRDs, executable implementation plans, agent-managed delivery, tests, review, and durable project memory.

## What This Is

Harness Engineering is the project infrastructure around an AI coding agent:

- a standard repo shape,
- clear agent instructions,
- specs and acceptance criteria,
- deterministic tools,
- validation loops,
- handoff and memory.

The core idea is simple:

```text
Ask requirements
↓
Write PRD
↓
Split implementation slices
↓
Use coding manager and subagents
↓
Test, debug, review
↓
Record memory and handoff context
```

## Skill Stack

This repo includes:

```text
harness-engineering   Project harness, AGENTS.md, docs/spec/tools/assets, workflow rules
spec                  Requirements, PRD support, acceptance criteria, non-goals
plan                  Implementation sequencing, risks, validation steps
research              Technical research from trusted sources
debug                 Reproduce, isolate, fix, and verify failures
test                  Verification and regression testing
review                Code review for bugs, risks, and missing tests
memory                Durable project facts and conventions
context-compress      Handoff and context compression
multi-agent           General multi-agent fallback
```

The full workflow also includes these companion skills:

```text
mattpocock-skill-router   Routes to grill-me, to-prd, to-issues, tdd, diagnose, handoff, etc.
coding-manager            Manages PRD-to-code delivery with subagents and fix loops
grill-me                  Requirement interrogation
grill-with-docs           Requirement interrogation with project docs
to-prd                    PRD generation
to-issues                 Issue breakdown
tdd                       Test-driven implementation
diagnose                  Disciplined debugging
handoff                   Context handoff
```

## Canonical Flow

```text
User has a vague idea
↓
harness-engineering detects the project phase
↓
mattpocock-skill-router chooses the requirement workflow
↓
grill-me / grill-with-docs asks focused questions
↓
to-prd / spec writes PRD and acceptance criteria
↓
to-issues / plan creates implementation slices
↓
coding-manager selects subagents and delivers code
↓
test / debug / review closes the validation loop
↓
memory / context-compress preserves project context
```

## Project Harness Standard

The `harness-engineering` skill uses this project shape:

```text
project/
  assets/
  docs/
  spec/
  tools/
  AGENTS.md
  README.md
  .gitignore
```

- `AGENTS.md`: operating rules for AI agents.
- `spec/`: requirements, PRDs, acceptance criteria, and task slices.
- `docs/`: architecture notes, decisions, domain context, runbooks.
- `tools/`: deterministic scripts for build, test, checks, generation, evaluation.
- `assets/`: project assets or reusable templates.
- `README.md`: human-facing project entrypoint.

## Install

Copy the skills into your Codex skills directory:

```powershell
Copy-Item -Recurse .\skills\* "$env:USERPROFILE\.codex\skills\"
```

Restart or refresh Codex so the new skills are discovered.

## Use

Example prompts:

```text
Use $harness-engineering to initialize this repo for AI-assisted software delivery.
```

```text
Use $spec to question me until the requirements are clear, then write the PRD.
```

```text
Use $harness-engineering and $coding-manager to deliver this PRD with subagents.
```

## Notes

- This repository intentionally keeps each skill small. Project-specific truth belongs in the project, especially `AGENTS.md`, `spec/`, and `docs/`.
- `coding-manager`, `mattpocock-skill-router`, and the Matt workflow skills they route to are included in this repository so the full harness can be installed together.
- The included skills were validated with the Codex skill validator.

## Chinese README

中文说明见 [README.zh-CN.md](README.zh-CN.md).
