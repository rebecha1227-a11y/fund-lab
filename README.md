# Fund Lab · 基金实验室

面向基金小白的 **AI 投资学习陪练** + **本地 HTML 看板**。  
不连接任何基金账户 API；你的持仓与收益写在本地 Markdown 里，看板负责读取展示。

> **免责声明**：仅供学习与研究框架，不构成投资建议，最终决策权在你自己。

---

## 项目结构（必读）

本项目 = **skill 开发正本** + **你的私人笔记本**。  
Skill 在 **Cursor 全局**：`~/.cursor/skills/fund-lab/`（`/fund-lab` 读那里）。  
**以后只改根目录** `SKILL.md`、`references/`、`templates/`，改完运行 `./scripts/sync-skill-to-global.sh`。

```
投资研究复盘预测模拟/                 ← 工作区（开源仓 + 私人 assets）
├── SKILL.md                         ← 【正本】
├── references/                      ← 【正本】
├── templates/                       ← 【正本】
├── dashboard.html                   ← 【正本】看板（含全部 JS 联动逻辑）
├── scripts/sync-skill-to-global.sh
├── assets/                          ← 【仅私人】
└── QA_Log.md

~/.cursor/skills/fund-lab/           ← Cursor 全局 skill 包（sync 后含 dashboard.html）
    ├── SKILL.md
    ├── references/
    ├── templates/
    └── dashboard.html
```

### 三层职责

| 层级 | 目录 | 内容 | 提交 GitHub |
|------|------|------|-------------|
| **方法论 + 看板** | `references/`、`dashboard.html` | 流程说明 + HTML 看板（只读展示） | ✅ |
| **安装模板** | `templates/` | 空白 `.example.md`，复制到 `assets/` 后填写 | ✅ |
| **私人数据** | `assets/` + `QA_Log.md` | 持仓、收益、周报、词典、穿透研究 | ❌ |

### AI 改文件时的规则

| 任务 | 只改这些 |
|------|----------|
| 改 skill、看板、模板 | 根目录 `SKILL.md`、`references/`、`templates/`、`dashboard.html` → sync |
| 更新你的持仓、周报、词典 | `assets/`、`QA_Log.md` |
| 改看板读取逻辑 | `dashboard.html` |

**禁止**：把真实基金名、金额、持仓写进 `references/` 或 skill 目录。

### 同步到 Cursor 全局

```bash
./scripts/sync-skill-to-global.sh
```

将来可用 `npx fund-lab update` 覆盖全局 skill。

---

## 第一次使用（5 步）

### 1. 安装 Skill

**Cursor（推荐）**

1. 将本仓库 `SKILL.md` + `references/` + `templates/` 同步到 Cursor 全局（已安装则跳过）：
   ```bash
   ./scripts/sync-skill-to-global.sh
   ```
   全局路径：`~/.cursor/skills/fund-lab/`
2. 在 Cursor 打开**本项目文件夹**（私人 `assets/` 在这里）
3. 聊天输入：`/fund-lab 初始化`

**其他 AI 工具**：把 `SKILL.md` + `references/` 加入项目规则；用自然语言说「按 fund-lab 初始化」。

### 2. 准备私人数据文件

```bash
mkdir -p assets/weekly-briefs assets/review-journal assets/fund-research
cp templates/portfolio-template.example.md assets/portfolio-template.md
cp templates/daily-snapshots.example.md assets/daily-snapshots.md
cp templates/discipline-rules.example.md assets/discipline-rules.md
cp templates/personal-glossary.example.md assets/personal-glossary.md
# 周报不需预先复制：首次 /fund-lab 环境 时 AI 会按 templates/weekly-brief.example.md 写入 assets/weekly-briefs/日期.md
```

### 3. 告诉 AI 你的情况（`/fund-lab 初始化`）

按 `references/onboarding.md` 提供：交易平台、持仓截图/清单、收益从哪个 App 看。

### 4. 打开看板

看板在 **skill 包内**（`~/.cursor/skills/fund-lab/dashboard.html`），也可使用工作区根目录的 `dashboard.html` 副本（内容应一致）。

```bash
# 方式 A：从 skill 包打开（推荐，始终最新 sync 版）
open ~/.cursor/skills/fund-lab/dashboard.html
# 方式 B：本地起服务打开工作区副本
python3 -m http.server 4173
# 浏览器 http://localhost:4173/dashboard.html
```

**必做**：看板里点击「授权项目目录」→ 选择**本工作区文件夹**（含 `assets/` 的目录）。  
看板内嵌解析与联动（`loadFromDirectory`、`parseAll`、收益日历/曲线等），只读 md，不连基金 API。

### 5. 常用命令

```
/fund-lab 透视
/fund-lab 环境          → 写入 assets/weekly-briefs/YYYY-MM-DD.md
/fund-lab 更新今日快照
/fund-lab 复盘          → 写入 assets/review-journal/YYYY-MM-DD.md
```

---

## 看板读什么

| 看板板块 | 数据来源 |
|----------|---------|
| KPI / 收益日历 / 曲线 | `assets/daily-snapshots.md` + `assets/portfolio-template.md` |
| 基金市场周报 | `assets/weekly-briefs/*.md` |
| 知识中枢 · QA | `QA_Log.md` |
| 知识中枢 · 穿透研究 | `assets/fund-research/*.md` |
| 知识中枢 · 相关词汇 | `references/fund-glossary.md` + `assets/personal-glossary.md` + QA |
| 知识中枢 · 复盘日记 | `assets/review-journal/*.md` |
| 纪律 / 建议 | `assets/discipline-rules.md` + 持仓解析 |

---

## 数据文件说明

| 文件 | 更新频率 | 谁写 |
|------|----------|------|
| `assets/portfolio-template.md` | 交易后 | 你 + AI `/更新持仓` |
| `assets/daily-snapshots.md` | 每交易日 | AI `/更新今日快照` |
| `assets/weekly-briefs/日期.md` | 每周 | AI `/环境` |
| `assets/review-journal/日期.md` | 按需 | AI `/复盘` 或看板手写 |
| `assets/fund-research/*.md` | 按需 | AI `/透视` 某只基金后 |
| `assets/personal-glossary.md` | 随学习 | AI `/词典` 或聊天 |

---

## 开源前检查清单

推 GitHub 前确认：

- [ ] 根目录 `SKILL.md`、`references/`、`templates/` 无真实持仓/基金名
- [ ] 已运行 `./scripts/sync-skill-to-global.sh` 或确认全局 skill 版本一致
- [ ] 未提交 `QA_Log.md`、`assets/` 下私人文件

---

## 自动化（可选）

看板只**读**本地 md；每日更新需要「写层」：

- Cursor Automation + cron：定时跑「读 inbox 截图 → 更新 daily-snapshots」
- 或手动：聊天 `/fund-lab 更新今日快照`

详见 `references/daily-snapshot.md`。

---

## 许可与隐私

- Skill 代码与方法论：MIT（见 `SKILL.md`）
- `assets/`、`QA_Log.md`：**仅留本地或私有仓**，勿公开
- 虚构穿透范例：`references/examples/sample-active-equity-research.md`
