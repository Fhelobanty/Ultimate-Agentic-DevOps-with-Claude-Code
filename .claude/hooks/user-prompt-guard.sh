#!/bin/bash

PROMPT="$1"

if [[ "$PROMPT" == *"delete all"* ]] || [[ "$PROMPT" == *"destroy"* ]]; then
  echo "❌ Destructive prompt blocked!"
  exit 1
fi

exit 0