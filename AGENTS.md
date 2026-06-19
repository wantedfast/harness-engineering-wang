# AGENTS.md

## Project

This repository packages a Codex skill stack for Harness Engineering in AI-assisted software delivery.

## Directory Map

- `skills/`: Codex skills grouped by workflow stage.
- `scripts/install-skills.ps1`: installs grouped skills into Codex's flat skills directory.
- `README.md`: English documentation.
- `README.zh-CN.md`: Chinese documentation.
- `outputs/`: local generated deliverables; do not commit by default.
- `work/`: local scratch space; do not commit by default.

## Working Rules

- Keep skills concise and operational.
- Keep `skills/` grouped by workflow stage in this repository; do not flatten it here. Only `scripts/install-skills.ps1` should flatten skills into Codex's install directory.
- Put project-specific truth in target projects, not inside generic skills.
- Preserve the Codex Project workspace layout rule in `harness-engineering`: workspace-level harness files live at the Codex Project root, and implementation repos live under `repos/<repo-name>/` by default.
- Validate changed skills with the Codex skill validator when possible.
- Do not copy external companion skills into this repository unless explicitly requested and licensing is clear.

## Validation

Run:

```powershell
python "$env:USERPROFILE\.codex\skills\.system\skill-creator\scripts\quick_validate.py" ".\skills\00-harness\harness-engineering"
```

Repeat for changed skill directories.
