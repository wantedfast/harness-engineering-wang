# Harness Engineering Wang

这是一套面向 Codex 类 AI 编程工作流的 Harness Engineering 技能组。

它的目标不是让 AI “直接猜着写代码”，而是把软件开发变成一条可控流程：先问需求，写 PRD，拆任务，再由 coding manager 分配 subagent 写代码，最后测试、调试、审查、沉淀记忆。

## 这是什么

Harness Engineering 可以理解为 AI 编程项目的工程护栏：

- 标准项目结构
- 清晰的 Agent 工作规则
- 需求规格和验收标准
- 可重复运行的工具脚本
- 测试、调试、审查闭环
- 长期记忆和上下文交接

核心流程是：

```text
问需求
↓
写 PRD
↓
拆实现切片
↓
coding-manager 调 subagent 交付
↓
测试、调试、审查
↓
记录 memory 和 handoff
```

## 技能组

本仓库包含：

```text
harness-engineering   总控：项目结构、AGENTS.md、docs/spec/tools/assets、流程规则
spec                  需求、PRD 辅助、验收标准、非目标
plan                  执行顺序、风险、验证步骤
research              技术调研，优先可信来源
debug                 复现、隔离、修复、验证 bug
test                  测试和回归验证
review                代码审查，检查 bug、风险、测试缺口
memory                长期项目事实和约定
context-compress      上下文压缩和交接
multi-agent           通用多 Agent 备用方案
```

完整工作流已包含这些 companion skills：

```text
mattpocock-skill-router   编程范式路由：选择 grill-me、to-prd、to-issues、tdd、diagnose、handoff 等流程
coding-manager            PRD 到代码交付：分配 subagent、集成、验证、审查、fix loop
grill-me                  需求访谈，把模糊想法一个个问清楚
grill-with-docs           结合项目文档、术语、ADR 的需求访谈
to-prd                    生成 PRD
to-issues                 拆 issue
tdd                       测试驱动开发
diagnose                  纪律化调试
handoff                   上下文交接
```

## 标准主流程

```text
用户提出模糊想法
↓
harness-engineering 判断项目阶段
↓
mattpocock-skill-router 选择需求澄清流程
↓
grill-me / grill-with-docs 逐步追问需求
↓
to-prd / spec 写 PRD 和验收标准
↓
to-issues / plan 拆实现切片
↓
coding-manager 选择 subagent 并交付代码
↓
test / debug / review 闭环验证
↓
memory / context-compress 沉淀项目上下文
```

## 项目 Harness 标准

`harness-engineering` 使用这个项目结构：

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

- `AGENTS.md`：给 AI Agent 看的项目工作规则。
- `spec/`：需求、PRD、验收标准、任务切片。
- `docs/`：架构说明、决策记录、领域上下文、运行手册。
- `tools/`：构建、测试、检查、生成、评估等可重复脚本。
- `assets/`：项目素材或可复用模板。
- `README.md`：给人看的项目入口。

## 安装

把 `skills/` 里的技能复制到 Codex 技能目录：

```powershell
Copy-Item -Recurse .\skills\* "$env:USERPROFILE\.codex\skills\"
```

然后重启或刷新 Codex，让新技能被发现。

## 使用示例

```text
Use $harness-engineering to initialize this repo for AI-assisted software delivery.
```

```text
Use $spec to question me until the requirements are clear, then write the PRD.
```

```text
Use $harness-engineering and $coding-manager to deliver this PRD with subagents.
```

## 说明

- 每个 skill 都刻意保持轻量。项目事实应该写在项目自身，尤其是 `AGENTS.md`、`spec/` 和 `docs/`。
- `coding-manager`、`mattpocock-skill-router` 以及它们路由到的 Matt 工作流 skills 已包含在本仓库中，可以随完整 harness 一起安装。
- 本仓库内置 skills 已通过 Codex skill validator 验证。
