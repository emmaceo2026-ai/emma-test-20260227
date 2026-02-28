#!/bin/bash
set -euo pipefail
USAGE_FILE="$HOME/.openclaw/workspace/memory/warm-json/api-cache/usage.json"
mkdir -p "$(dirname "$USAGE_FILE")"
usage=$(python3 - <<'PY'
import json, os, time
usage_file = os.environ['USAGE_FILE']
data = {'usage': 0, 'timestamp': time.time()}
if os.path.exists(usage_file):
    with open(usage_file) as f:
        try:
            data = json.load(f)
        except Exception:
            pass
print(data['usage'])
PY
)
if [ "$usage" -gt 90 ]; then
  echo "Critical API usage: $usage%" >&2
elif [ "$usage" -gt 70 ]; then
  echo "Warning: API usage $usage%" >&2
fi
