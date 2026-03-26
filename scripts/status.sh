#!/usr/bin/env bash
# Show status of all SIMILAR notebooks in the repository
# Usage: ./scripts/status.sh [root-path]
# Example: ./scripts/status.sh
# Example: ./scripts/status.sh notebooks/my-system

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SEARCH_ROOT="${1:-$REPO_ROOT/notebooks}"

if [ ! -d "$SEARCH_ROOT" ]; then
  echo "No notebooks directory found at: $SEARCH_ROOT"
  exit 1
fi

phase_symbol() {
  case "$1" in
    complete)       echo "■" ;;
    in_progress)    echo "◧" ;;
    needs_re-eval*) echo "↺" ;;
    not_started)    echo "□" ;;
    *)              echo "?" ;;
  esac
}

phase_from_md() {
  local notebook="$1"
  local phase_name="$2"
  local status
  status=$(grep -A 0 "^## $phase_name" "$notebook" | head -1 || echo "")
  if [ -z "$status" ]; then
    echo "not_started"
    return
  fi
  local phase_status
  phase_status=$(awk "/^## $phase_name/,/^---$/" "$notebook" | grep "^\*\*Phase status:\*\*" | head -1 | sed 's/.*\*\*Phase status:\*\* *//' | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -d '/')
  if [ -z "$phase_status" ] || echo "$phase_status" | grep -q '/'; then
    echo "not_started"
  else
    echo "$phase_status"
  fi
}

print_notebook() {
  local notebook="$1"
  local indent="$2"
  local dir
  dir=$(dirname "$notebook")
  local title
  title=$(head -1 "$notebook" | sed 's/^# //')
  
  local s i1 m i2 l a r
  s=$(phase_from_md "$notebook" "S — State the Problem")
  i1=$(phase_from_md "$notebook" "I — Investigate Alternatives")
  m=$(phase_from_md "$notebook" "M — Model the System")
  i2=$(phase_from_md "$notebook" "I — Integrate")
  l=$(phase_from_md "$notebook" "L — Launch")
  a=$(phase_from_md "$notebook" "A — Assess Performance")
  r=$(phase_from_md "$notebook" "R — Re-evaluate")

  printf "%s%-40s S:%s I:%s M:%s I:%s L:%s A:%s R:%s\n" \
    "$indent" "$title" \
    "$(phase_symbol "$s")" \
    "$(phase_symbol "$i1")" \
    "$(phase_symbol "$m")" \
    "$(phase_symbol "$i2")" \
    "$(phase_symbol "$l")" \
    "$(phase_symbol "$a")" \
    "$(phase_symbol "$r")"

  local sub_dir="$dir/sub-notebooks"
  if [ -d "$sub_dir" ]; then
    for sub in "$sub_dir"/*/notebook.md; do
      [ -f "$sub" ] || continue
      print_notebook "$sub" "${indent}  └─ "
    done
  fi
}

echo "SIMILAR Notebook Status"
echo "Legend: ■ complete  ◧ in progress  □ not started  ↺ needs re-evaluation"
echo "---"

for notebook in "$SEARCH_ROOT"/*/notebook.md; do
  [ -f "$notebook" ] || continue
  # Skip sub-notebooks at this level (they'll be printed recursively)
  case "$notebook" in
    */sub-notebooks/*) continue ;;
  esac
  print_notebook "$notebook" ""
done
