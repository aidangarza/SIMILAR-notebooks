#!/usr/bin/env bash
# Validate a SIMILAR process notebook for completeness and anti-patterns
# Usage: ./scripts/validate-notebook.sh <path-to-notebook.md>
# Example: ./scripts/validate-notebook.sh notebooks/my-system/notebook.md

set -e

if [ $# -lt 1 ]; then
  echo "Usage: $0 <path-to-notebook.md>"
  exit 1
fi

NOTEBOOK="$1"
ERRORS=0
WARNINGS=0

if [ ! -f "$NOTEBOOK" ]; then
  echo "ERROR: File not found: $NOTEBOOK"
  exit 1
fi

error() {
  echo "  ERROR: $1"
  ERRORS=$((ERRORS + 1))
}

warn() {
  echo "  WARN:  $1"
  WARNINGS=$((WARNINGS + 1))
}

echo "Validating: $NOTEBOOK"
echo "---"

# Check for forbidden words in requirements sections
echo "Checking anti-patterns..."

REQUIREMENTS_SECTION=$(awk '/### Requirements Discovery/,/### Requirements Verification/' "$NOTEBOOK")
REQUIREMENTS_SECTION="$REQUIREMENTS_SECTION$(awk '/### Requirements Verification/,/### System Functions/' "$NOTEBOOK")"

if echo "$REQUIREMENTS_SECTION" | grep -qi '\boptimal\b'; then
  error "Word 'optimal' found in requirements — SIMILAR forbids this"
fi
if echo "$REQUIREMENTS_SECTION" | grep -qi '\bmaximize\b'; then
  error "Word 'maximize' found in requirements — use specific targets instead"
fi
if echo "$REQUIREMENTS_SECTION" | grep -qi '\bminimize\b'; then
  error "Word 'minimize' found in requirements — use specific targets instead"
fi
if echo "$REQUIREMENTS_SECTION" | grep -qi '\bsimultaneous\b'; then
  error "Word 'simultaneous' found in requirements — criteria have tradeoffs"
fi

# Check for content in key sections
echo "Checking required content..."

PROBLEM_SECTION=$(awk '/### Problem Statement/,/### Stakeholders/' "$NOTEBOOK")
if ! echo "$PROBLEM_SECTION" | grep -q 'Reason for change:.\+'; then
  warn "Reason for change is empty in Problem Statement"
fi

STAKEHOLDERS=$(awk '/### Stakeholders/,/### Requirements/' "$NOTEBOOK")
STAKEHOLDER_ROWS=$(echo "$STAKEHOLDERS" | grep '^|' | grep -v '^| Stakeholder' | grep -v '^|---' | grep -v '^| *|' | wc -l)
if [ "$STAKEHOLDER_ROWS" -lt 1 ]; then
  warn "No stakeholders identified — consider: end users, operators, bill payers, regulators, victims"
fi

# Check for at least 2 alternatives
ALTERNATIVES=$(awk '/### Alternatives Identified/,/### Evaluation Criteria/' "$NOTEBOOK")
ALT_ROWS=$(echo "$ALTERNATIVES" | grep '^|' | grep -v '^| #' | grep -v '^|---' | grep -v '^| [0-9] *| *|' | wc -l)
if [ "$ALT_ROWS" -lt 2 ]; then
  warn "Fewer than 2 alternatives identified — require at least 2-3"
fi

# Check for sub-notebook links that don't exist
echo "Checking sub-notebook links..."
NOTEBOOK_DIR=$(dirname "$NOTEBOOK")
while IFS= read -r link; do
  [ -z "$link" ] && continue
  LINK_PATH="$NOTEBOOK_DIR/$link"
  if [ ! -f "$LINK_PATH" ]; then
    warn "Sub-notebook link does not exist: $link"
  fi
done < <(grep -o '(sub-notebooks/[^)]*' "$NOTEBOOK" 2>/dev/null | sed 's/^(//' || true)

echo "---"
echo "Results: $ERRORS error(s), $WARNINGS warning(s)"

if [ $ERRORS -gt 0 ]; then
  exit 1
fi
exit 0
