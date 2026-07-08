#!/usr/bin/env bash
# 将项目根目录 skill 正本同步到 Cursor 全局技能目录。
# 用法：在项目根目录执行 ./scripts/sync-skill-to-global.sh
# 将来 npx fund-lab update 可替代本脚本。

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
GLOBAL="${HOME}/.cursor/skills/fund-lab"

mkdir -p "$GLOBAL"
cp "$ROOT/SKILL.md" "$GLOBAL/SKILL.md"
cp "$ROOT/dashboard.html" "$GLOBAL/dashboard.html"
cp -R "$ROOT/references" "$GLOBAL/"
cp -R "$ROOT/templates" "$GLOBAL/"
find "$GLOBAL" -name '.DS_Store' -delete 2>/dev/null || true

echo "已同步到 ${GLOBAL}"
find "$GLOBAL" -type f | wc -l | xargs echo "文件数:"
