# Fund Lab · 基金实验室

面向基金小白的 **AI 投资学习陪练**，附带一个 **本地 HTML 看板**。

帮你把持仓、收益、纪律、复盘整理成自己电脑上的 Markdown 档案，用 AI 做透视、周报、快照更新；看板负责把这一切可视化。**不连接任何基金账户 API**。

> **免责声明**：仅供学习与研究框架，不构成投资建议，最终决策权在你自己。

---

## 你能用它做什么

| 能力 | 说明 |
|------|------|
| 持仓透视 | 看清组合结构、缺口与风险集中度 |
| 亏损体检 | 分析「基金赚了但我亏了」的原因 |
| 市场周报 | 每周环境简报，对照自己的组合 |
| 每日快照 | 记录当日收益，驱动看板日历/曲线 |
| 投资纪律 | 止盈止损、加仓规则，写下来并跟踪 |
| 复盘日记 | 记录心态与决策，支持心情标签 |
| 基金词典 | 小白术语 + 你的个性化笔记 |
| 本地看板 | 收益日历、KPI、知识中枢，一键浏览 |

---

## 安装

需要已安装 [Node.js](https://nodejs.org/)（用于运行 `npx`）。

使用 [Skills CLI](https://github.com/vercel-labs/skills) 一行安装，支持 **Cursor、Claude Code、Codex** 等主流 AI Agent：

```bash
# Cursor（最常用）
npx skills add rebecha1227-a11y/fund-lab -g -a cursor -y
```

```bash
# 其他工具（按需选一个）
npx skills add rebecha1227-a11y/fund-lab -g -a claude-code -y
npx skills add rebecha1227-a11y/fund-lab -g -a codex -y
```

安装完成后，skill 位于：

- **macOS / Linux**：`~/.cursor/skills/fund-lab/`（Cursor）
- 内含：`SKILL.md`、`references/`、`templates/`、**`dashboard.html`（看板）**

### 更新

```bash
npx skills update
```

---

## 快速开始

### 第 1 步：准备你的工作区文件夹

在电脑上新建或选一个文件夹，例如 `我的基金档案`，用 Cursor **打开这个文件夹**。

你的私人数据都会放在这里的 `assets/` 目录，**不会上传到 GitHub**。

### 第 2 步：初始化

在 Cursor 聊天框输入：

```
/fund-lab 初始化
```

AI 会引导你说明：在哪些平台买基、持有哪些基金、收益从哪个 App 看，并帮你在 `assets/` 里建好档案。

> 也可以手动从 skill 里的 `templates/*.example.md` 复制到 `assets/` 后改名填写；但让 AI 带你走一遍更省事。

### 第 3 步：打开看板

```bash
open ~/.cursor/skills/fund-lab/dashboard.html
```

或在 Finder 中双击该文件用浏览器打开。

**重要**：看板里点击 **「授权项目目录」**，选择第 1 步那个含 `assets/` 的文件夹。  
之后 AI 更新 Markdown，在看板点「立即刷新」即可看到最新数据。

### 第 4 步：日常使用

```
/fund-lab 透视              # 看持仓结构与缺口
/fund-lab 环境              # 生成本周市场简报
/fund-lab 更新今日快照       # 写入今日收益
/fund-lab 复盘              # 写复盘日记
/fund-lab 更新持仓           # 买卖后更新持仓
```

完整命令列表见 skill 内的 `SKILL.md`。

---

## 看板有哪些板块

| 板块 | 读什么文件 |
|------|-----------|
| 首页 · 持仓总览 / 收益日历 | `assets/portfolio-template.md`、`assets/daily-snapshots.md` |
| 基金市场周报 | `assets/weekly-briefs/*.md` |
| 知识中枢 · 个人基金知识库 | `QA_Log.md`（工作区根目录） |
| 知识中枢 · 术语词典 | `references/fund-glossary.md` + `assets/personal-glossary.md` |
| 知识中枢 · 复盘日记 | `assets/review-journal/*.md` |
| 知识中枢 · 穿透研究 | `assets/fund-research/*.md` |
| 投资纪律 | `assets/discipline-rules.md` |

看板**只读**本地文件，不联网查净值。

---

## 你的数据存在哪

所有私人信息都在**你自己电脑的工作区**里：

```
你的工作区/
├── assets/
│   ├── portfolio-template.md    # 持仓（慢变量）
│   ├── daily-snapshots.md       # 每日收益（快变量）
│   ├── discipline-rules.md      # 纪律守则
│   ├── personal-glossary.md     # 你的词典
│   ├── weekly-briefs/           # 周报
│   ├── review-journal/          # 复盘日记
│   └── fund-research/           # 基金研究报告
└── QA_Log.md                    # 学习问答沉淀（可选）
```

**请勿**把 `assets/` 和 `QA_Log.md` 上传到公开仓库或发给他人。

---

## 常见问题

**Q：一定要克隆 GitHub 仓库吗？**  
不用。`npx skills add` 就够了。克隆仓库只适合想顺便用 git 备份私人数据的人。

**Q：看板打开是空的？**  
先完成「授权项目目录」，并确认该文件夹里已有 `assets/` 且文件已填写。

**Q：换了电脑怎么办？**  
复制整个工作区文件夹（含 `assets/`）到新电脑，重新 `npx skills add ...` 安装 skill，再授权目录即可。

**Q：和其他 AI 工具能用吗？**  
可以。用对应的 `-a` 参数安装 skill，用自然语言说「按 fund-lab 帮我透视」等即可，不必有 `/fund-lab` 斜杠命令。

---

## 许可

MIT License · 见 [SKILL.md](./SKILL.md)

虚构基金研究范例见 `references/examples/`，仅供学习格式参考。
