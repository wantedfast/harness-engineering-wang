# AGENTS.md

## Project

This repository packages a Codex skill stack for Harness Engineering in AI-assisted software delivery.

## Directory Map

- `skills/`: installable Codex skills.
- `README.md`: English documentation.
- `README.zh-CN.md`: Chinese documentation.
- `outputs/`: local generated deliverables; do not commit by default.
- `work/`: local scratch space; do not commit by default.

## Working Rules

- Keep skills concise and operational.
- Put project-specific truth in target projects, not inside generic skills.
- Validate changed skills with the Codex skill validator when possible.
- Do not copy external companion skills into this repository unless explicitly requested and licensing is clear.

## Validation

Run:

```powershell
python "$env:USERPROFILE\.codex\skills\.system\skill-creator\scripts\quick_validate.py" ".\skills\harness-engineering"
```

Repeat for changed skill directories.
