#!/usr/bin/env bash
set -euo pipefail

source_dir="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
codex_data_dir="${CODEX_HOME:-$HOME/.codex}"
pet_dir="$codex_data_dir/pets/subahibi-mini"

for pet_file in pet.json spritesheet.webp SHA256SUMS; do
  if [ ! -f "$source_dir/$pet_file" ]; then
    printf '缺少文件：%s\n请下载并解压完整仓库后重试。\n' "$pet_file" >&2
    exit 1
  fi
done

verify_files() {
  local check_dir="$1"
  (
    cd "$check_dir"
    if command -v shasum >/dev/null 2>&1; then
      shasum -a 256 -c "$source_dir/SHA256SUMS"
    elif command -v sha256sum >/dev/null 2>&1; then
      sha256sum -c "$source_dir/SHA256SUMS"
    else
      printf '未找到 shasum 或 sha256sum，无法校验文件。\n' >&2
      exit 1
    fi
  )
}

printf '校验宠物文件…\n'
verify_files "$source_dir"

if [ -e "$pet_dir" ] && [ ! -d "$pet_dir" ]; then
  printf '目标路径已存在且不是文件夹：%s\n' "$pet_dir" >&2
  exit 1
fi

if [ -d "$pet_dir" ]; then
  backup_root="$codex_data_dir/pet-backups"
  mkdir -p "$backup_root"
  backup_dir="$(mktemp -d "$backup_root/subahibi-mini.XXXXXXXX")"
  cp -R "$pet_dir/." "$backup_dir/"
  printf '原目录已备份：%s\n' "$backup_dir"
fi

mkdir -p "$pet_dir"
cp "$source_dir/pet.json" "$pet_dir/pet.json"
cp "$source_dir/spritesheet.webp" "$pet_dir/spritesheet.webp"
verify_files "$pet_dir"

printf '\n安装完成：%s\n' "$pet_dir"
printf '请在 Codex Desktop 的设置 → Pets / 宠物中选择「素晴日 Mini」。\n'
printf '若列表未刷新，请完整退出并重新打开客户端。\n'
