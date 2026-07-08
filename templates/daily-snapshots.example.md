# 每日持仓快照（时间序列 · 模板）

> 复制为 `daily-snapshots.md` 后使用。写法见 skill：`references/daily-snapshot.md`

## 字段说明

- `date`: YYYY-MM-DD
- `total_assets`: 组合总资产（与用户 portfolio 口径一致）
- `daily_profit`: **主口径**当日收益（在 onboarding 中确认来源）
- `data_status`: `normal` / `partial_update` / `pending_nav`

## 快照记录

| date | total_assets | equity | cash | tech_ratio | defense_ratio | holding_profit | accum_profit | daily_profit | yesterday_profit | data_status |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|
| YYYY-MM-DD | — | — | — | — | — | — | — | 0.00 | — | partial_update |
