#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CACHE_DIR="$ROOT_DIR/.cache"
TARGET_DIR="$CACHE_DIR/legalize-kr"
REPO_URL="https://github.com/legalize-kr/legalize-kr.git"

mkdir -p "$CACHE_DIR"

if [ ! -d "$TARGET_DIR/.git" ]; then
  echo "처음 받는 중..."
  git clone --depth 1 --single-branch --no-tags "$REPO_URL" "$TARGET_DIR"
else
  echo "최신으로 업데이트 중..."
  git -C "$TARGET_DIR" fetch --depth 1 origin
  git -C "$TARGET_DIR" reset --hard origin/HEAD
fi

echo "완료: $TARGET_DIR"
