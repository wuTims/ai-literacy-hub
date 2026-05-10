#!/usr/bin/env bash
# Usage: bash scripts/check-banlist.sh <markdown-file>
# Reports any banned vocabulary from the voice directive.
# Exits 0 if clean, 1 if any matches found.

set -u

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <markdown-file>" >&2
  exit 2
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE" >&2
  exit 2
fi

# Banned tokens. Case-insensitive substring match.
# A few entries (register, roam, compounds) are word-boundary matched
# because they have legitimate uses in other senses.
BANNED_SUBSTR=(
  "load-bearing"
  "calibrate"
  "calibrates"
  "calibrated"
  "aggressively"
  "downstream of"
  "off-ramp"
  "the corrective"
  "category error"
  "category errors"
  "audit posture"
  "the spine of"
  "instantiated"
  "synthesize"
  "synthesizes"
  "synthesis"
  "lossy"
  "the giveaway"
  "pre-empt"
  "preempt"
  "essentially"
  "basically"
  "robust"
  "seamless"
)

# Word-boundary terms (need standalone match to avoid false positives).
BANNED_WORD=(
  "register"
  "roam"
  "compounds"
)

EXIT=0

for term in "${BANNED_SUBSTR[@]}"; do
  if grep -ni -- "$term" "$FILE" >/dev/null 2>&1; then
    echo "BANNED: \"$term\""
    grep -ni --color=never -- "$term" "$FILE" | sed 's/^/  /'
    EXIT=1
  fi
done

for term in "${BANNED_WORD[@]}"; do
  if grep -niE -- "\\b$term\\b" "$FILE" >/dev/null 2>&1; then
    echo "BANNED (word): \"$term\""
    grep -niE --color=never -- "\\b$term\\b" "$FILE" | sed 's/^/  /'
    EXIT=1
  fi
done

if [ $EXIT -eq 0 ]; then
  echo "OK"
fi

exit $EXIT
