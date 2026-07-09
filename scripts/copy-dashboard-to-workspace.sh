#!/usr/bin/env bash
# 将 skill 包内的 dashboard.html 复制到工作区根目录，方便用户找到并打开看板。
# 用法：在项目根目录执行 ./scripts/copy-dashboard-to-workspace.sh

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${ROOT}/dashboard.html"

SRC=""
for candidate in \
  "${ROOT}/skills/fund-lab/dashboard.html" \
  "${HOME}/.cursor/skills/fund-lab/dashboard.html" \
  "${ROOT}/.agents/skills/fund-lab/dashboard.html"; do
  if [[ -f "$candidate" ]]; then
    SRC="$candidate"
    break
  fi
done

if [[ -z "$SRC" ]]; then
  echo "找不到 skill 里的 dashboard.html。请先运行：npx skills@latest add rebecha1227-a11y/fund-lab" >&2
  exit 1
fi

cp "$SRC" "$DEST"
echo "已复制看板到：${DEST}"
