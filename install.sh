#!/usr/bin/env bash
# Dotfiles installer — symlinks each config into place.
#
# Usage:
#   ./install.sh            # link everything
#   ./install.sh nvim zsh   # link only specific packages
#   ./install.sh -n         # dry run (show what would happen)

set -euo pipefail
cd "$(dirname "$0")"
ROOT="$(pwd)"

# "package:source -> dest" map. source is relative to ROOT.
LINKS=(
  "zsh:zsh/.zshrc:$HOME/.zshrc"
  "vim:vim/.vimrc:$HOME/.vimrc"
  "tmux:tmux/.tmux.conf:$HOME/.tmux.conf"
  "wezterm:wezterm:$HOME/.config/wezterm"
  "nvim:nvim:$HOME/.config/nvim"
  "claude:claude/skills:$HOME/.claude/skills"
  "claude:claude/settings.json:$HOME/.claude/settings.json"
  "claude:claude/CLAUDE.md:$HOME/.claude/CLAUDE.md"
)

DRY=""
TARGETS=""
for arg in "$@"; do
  if [ "$arg" = "-n" ]; then DRY="1"; else TARGETS="$TARGETS $arg"; fi
done

for entry in "${LINKS[@]}"; do
  pkg="${entry%%:*}"
  rest="${entry#*:}"
  src="$ROOT/${rest%%:*}"
  dest="${rest#*:}"

  # if TARGETS given, skip packages not listed
  if [ -n "$TARGETS" ]; then
    case " $TARGETS " in *" $pkg "*) ;; *) continue ;; esac
  fi

  if [ -n "$DRY" ]; then
    echo "would link: $dest -> $src"
    continue
  fi
  mkdir -p "$(dirname "$dest")"
  rm -rf "$dest"
  ln -s "$src" "$dest"
  echo "linked: $dest -> $src"
done

echo "Done. Restart your terminal (or run: tmux source ~/.tmux.conf)."
