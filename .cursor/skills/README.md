# fund-lab 安装说明

请用 Skills CLI 安装到全局（推荐）：

```bash
npx skills add rebecha1227-a11y/fund-lab -g -a cursor -y
```

安装后 Cursor 读取：`~/.cursor/skills/fund-lab/`（含 `SKILL.md`、`references/`、`templates/`、`dashboard.html`）。

维护者改完仓库正本后，可运行：

```bash
./scripts/sync-skill-to-global.sh
```

普通用户更新请用：`npx skills update`
