# Harness Skill Stack

Use this reference when coordinating the software harness skill group.

## Complete Stack

```text
/harness-engineering        总控：项目结构、AGENTS.md、流程规则
/mattpocock-skill-router    编程范式路由：选择 grill / PRD / issues / TDD / diagnose 等流程
grill-me                    需求访谈：把模糊想法一个个问清楚
grill-with-docs             带项目文档的需求访谈：结合术语、ADR、上下文追问
to-prd                      PRD 生成：把澄清后的需求沉淀成产品需求文档
/spec                       规格补强：需求、验收标准、非目标、实现切片
to-issues                   任务拆分：把 PRD 拆成可执行 issue
/plan                       执行计划：排序、风险、验证步骤
/coding-manager             交付经理：分配 subagent、集成代码、QA、review、fix loop
/research                   查资料：API、库、论文、方案调研
/debug 或 diagnose          定位 bug：复现、隔离、修复、回归
/test 或 tdd                验证：测试设计、测试优先、回归检查
/review                     审查：独立代码审查和验收
/memory                     长期记忆：项目事实、命令、约定、决策
/context-compress 或 handoff 上下文交接：压缩给下一轮或下个 agent
/multi-agent                通用多 Agent：非软件交付或 coding-manager 不适用时使用
```

## Canonical Flow

```text
用户模糊想法
↓
/harness-engineering 判断项目阶段和目录标准
↓
/mattpocock-skill-router 选择需求澄清流程
↓
grill-me / grill-with-docs 逐个追问需求
↓
to-prd / spec 写 PRD、验收标准、非目标
↓
to-issues / plan 拆实现切片和执行顺序
↓
/coding-manager 选择 subagent 并交付代码
↓
test / debug / review 形成验证和修复闭环
↓
memory / context-compress 沉淀项目上下文或交接
```

## Layers

1. Project layer: `harness-engineering`
   Creates and maintains the repo structure, `AGENTS.md`, docs, specs, tools, and workflow rules.

2. Requirements layer: `mattpocock-skill-router`, `grill-me`, `grill-with-docs`, `to-prd`, `spec`
   Questions the user, resolves ambiguity, writes the PRD, and defines acceptance criteria.

3. Planning layer: `plan`, `to-issues`, `prototype`, `tdd`
   Converts the PRD into implementation slices, prototypes, and test-first work when useful.

4. Delivery layer: `coding-manager`
   Selects sub-agents, dispatches coding/testing/review work, integrates results, and runs fix loops.

5. Knowledge layer: `research`, `memory`, `context-compress`
   Pulls external facts, stores durable project context, and prepares handoffs.

6. Execution layer: coding agents plus `debug` or `diagnose`
   Implements changes and fixes failures with reproduction-first diagnosis.

7. Validation layer: `test`, `review`
   Proves behavior and catches regressions before completion.

8. Scale layer: `multi-agent`
   Use only when `coding-manager` is unavailable or the task is not software delivery.

## Routing

- New project or messy repo: start with `harness-engineering`.
- Vague feature: use `mattpocock-skill-router` -> `grill-me`, then `to-prd`.
- Requirements need repo vocabulary or decisions: use `mattpocock-skill-router` -> `grill-with-docs`, then `to-prd`.
- PRD ready for execution: use `coding-manager`.
- Multi-file software change: use `coding-manager`; it selects implementer, QA, reviewer, and fix loops.
- Unknown library/API: use `research` before editing.
- Error or failing test: use `debug` or route through `mattpocock-skill-router` -> `diagnose`.
- Finished implementation: use `test`, then `review`.
- Repeated project facts: use `memory`.
- Large handoff: use `context-compress`.
- Large software project with separable workstreams: use `coding-manager`.

## Definition Of Done

A harnessed software change is done only when:

- The target behavior is written in `spec/` or an issue.
- Ambiguous requirements were resolved through questions before implementation.
- The implementation follows repo conventions.
- `coding-manager` or an equivalent delivery loop has integrated implementation, QA, and review.
- A targeted verification command has passed.
- Important failures or decisions are documented.
- `AGENTS.md` remains accurate for the next agent.
