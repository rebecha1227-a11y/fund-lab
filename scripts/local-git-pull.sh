#!/usr/bin/env bash
# 本机定时 git pull：把云端 Automation 推到私有仓的 assets 同步到本地，供看板读取。
# 用法：./scripts/local-git-pull.sh
# 推荐配合 Mac「快捷指令」每天 23:05 自动运行。

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LOG="${ROOT}/.local-sync.log"

cd "$ROOT"
{
  echo "===== $(date '+%Y-%m-%d %H:%M:%S') ====="
  git pull origin main
  echo "OK"
} >> "$LOG" 2>&1
