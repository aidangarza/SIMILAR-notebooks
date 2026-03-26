#!/usr/bin/env bash
# Create a new SIMILAR process notebook
# Usage: ./scripts/new-notebook.sh <notebook-name> [parent-path]
# Example: ./scripts/new-notebook.sh "Race Car Design"
# Example: ./scripts/new-notebook.sh "Engine Cooling" notebooks/race-car/sub-notebooks

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE_DIR="$REPO_ROOT/notebook-template"

usage() {
  echo "Usage: $0 <notebook-name> [output-path]"
  echo ""
  echo "Creates a new SIMILAR process notebook from the template."
  echo ""
  echo "  notebook-name   Title for the notebook (e.g., 'Race Car Design')"
  echo "  output-path     Optional. Default: notebooks/<slugified-name>/"
  echo ""
  echo "Examples:"
  echo "  $0 'My New System'"
  echo "  $0 'Engine Subsystem' notebooks/car-project/sub-notebooks"
  exit 1
}

slugify() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-'
}

if [ $# -lt 1 ]; then
  usage
fi

NOTEBOOK_NAME="$1"
SLUG="$(slugify "$NOTEBOOK_NAME")"
OUTPUT_PATH="${2:-$REPO_ROOT/notebooks}/$SLUG"
TODAY="$(date +%Y-%m-%d)"

mkdir -p "$OUTPUT_PATH"

cp "$TEMPLATE_DIR/notebook.md" "$OUTPUT_PATH/notebook.md"
cp "$TEMPLATE_DIR/config.yaml" "$OUTPUT_PATH/config.yaml" 2>/dev/null || true

if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s/{{TITLE}}/$NOTEBOOK_NAME/g" "$OUTPUT_PATH/notebook.md"
  sed -i '' "s/{{TITLE}}/$NOTEBOOK_NAME/g" "$OUTPUT_PATH/config.yaml"
  # Auto-populate dates
  sed -i '' "s/| \*\*Created\*\* | |/| **Created** | $TODAY |/" "$OUTPUT_PATH/notebook.md"
  sed -i '' "s/| \*\*Last Updated\*\* | |/| **Last Updated** | $TODAY |/" "$OUTPUT_PATH/notebook.md"
  sed -i '' "s/  created: \"\"/  created: \"$TODAY\"/" "$OUTPUT_PATH/config.yaml"
  sed -i '' "s/  last_updated: \"\"/  last_updated: \"$TODAY\"/" "$OUTPUT_PATH/config.yaml"
else
  sed -i "s/{{TITLE}}/$NOTEBOOK_NAME/g" "$OUTPUT_PATH/notebook.md"
  sed -i "s/{{TITLE}}/$NOTEBOOK_NAME/g" "$OUTPUT_PATH/config.yaml"
  sed -i "s/| \*\*Created\*\* | |/| **Created** | $TODAY |/" "$OUTPUT_PATH/notebook.md"
  sed -i "s/| \*\*Last Updated\*\* | |/| **Last Updated** | $TODAY |/" "$OUTPUT_PATH/notebook.md"
  sed -i "s/  created: \"\"/  created: \"$TODAY\"/" "$OUTPUT_PATH/config.yaml"
  sed -i "s/  last_updated: \"\"/  last_updated: \"$TODAY\"/" "$OUTPUT_PATH/config.yaml"
fi

# If creating a sub-notebook, set the parent reference
if [ $# -ge 2 ]; then
  PARENT_DIR="$(dirname "$2")"
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s|*(if this is a sub-system notebook)*|[$PARENT_DIR](../../notebook.md)|" "$OUTPUT_PATH/notebook.md"
    sed -i '' "s|  parent: \"\"|  parent: \"../../\"|" "$OUTPUT_PATH/config.yaml"
  else
    sed -i "s|*(if this is a sub-system notebook)*|[$PARENT_DIR](../../notebook.md)|" "$OUTPUT_PATH/notebook.md"
    sed -i "s|  parent: \"\"|  parent: \"../../\"|" "$OUTPUT_PATH/config.yaml"
  fi
fi

mkdir -p "$OUTPUT_PATH/sub-notebooks"

echo "Created SIMILAR notebook: $OUTPUT_PATH"
echo ""
echo "Next steps:"
echo "  1. Open $OUTPUT_PATH/notebook.md"
echo "  2. Work through each SIMILAR phase with the agent"
echo "  3. Create sub-notebooks for subsystems: $0 '<name>' $OUTPUT_PATH/sub-notebooks"
