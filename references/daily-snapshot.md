# 每日快照（`/更新今日快照`）

命令词：`/更新今日快照`、`/今日快照`、`/更新快照`。

> **定位**：把「今天组合赚/亏了多少」写进 `assets/daily-snapshots.md`，供看板收益日历、收益曲线、当日/昨日 KPI 读取。
> 这是**快变量**（每天变），和 `portfolio-template.md` 里的份额/转换计划（慢变量）分开维护。

---

## 一、怎么触发

**Cursor / Codex / Claude Code 等**：使用项目配置的 skill 入口（如 `/fund-lab 更新今日快照`）。

```
/fund-lab 更新今日快照
/fund-lab 今日快照
```

自然语言示例：

```
帮我更新今天的收益快照
记一下今天组合盈亏
今日收益截图来了
```

**推荐节奏**

| 时机 | 做什么 |
|------|--------|
| 每个交易日收盘后 | 发「当日收益」截图 → `/fund-lab 更新今日快照` |
| 各平台总资产有更新时 | 顺带更新 `total_assets`、`holding_profit`、`accum_profit` |
| 有大额交易/转换确认后 | 快照 + `/fund-lab 更新持仓` |
| 周末 | 可不更新；看板日历周末格显示 `0.00`（灰色） |

---

## 二、执行前必读

1. `assets/daily-snapshots.md`
2. `assets/portfolio-template.md`「基本情况」
3. 用户提供的截图或口述（**标注来源**）

若只有当日收益：只填 `daily_profit`，其余列写 `—`，`data_status` = `partial_update`。

---

## 三、采集口径（按用户建档时约定的主口径）

| 字段 | 说明 |
|------|------|
| `daily_profit` | **用户主口径**的当日组合盈亏（在 onboarding 中已确认来源） |
| `yesterday_profit` | 通常由**前一行** `daily_profit` 推导；必要时可填 |
| `total_assets` | 用户定义的组合总资产（多平台则合计，口径与 portfolio 一致） |
| `holding_profit` / `accum_profit` | 与 portfolio 基本情况一致 |
| `tech_ratio` / `defense_ratio` | 来自 portfolio 赌注群汇总 |

**禁止**：把不同 App 的「昨日收益」与「当日收益」混加成一个 KPI。

---

## 四、写入格式（11 列，顺序固定）

```markdown
| date | total_assets | equity | cash | tech_ratio | defense_ratio | holding_profit | accum_profit | daily_profit | yesterday_profit | data_status |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|
```

- 金额：纯数字，如 `-120.50`（无「元」、无逗号）
- 暂无：`—`
- `data_status`：`normal` / `partial_update` / `pending_nav`
- **同日期只保留一行**（覆盖更新）

示例（仅当日收益）：

```markdown
| 2026-07-09 | — | — | — | — | — | — | — | -120.50 | — | partial_update |
```

---

## 五、同步 portfolio（按需）

若更新了总资产或持有/累计收益，同步 `portfolio-template.md`「基本情况」。

---

## 六、回复用户

确认日期、`daily_profit`、数据来源；提醒刷新看板（授权目录 → 立即刷新或轮询）。

---

## 七、自动化预留

定时 Agent 可读取 `inbox/` 下截图，按本文件更新 `daily-snapshots.md`。详见项目 `README.md`「数据自动化」章节。
