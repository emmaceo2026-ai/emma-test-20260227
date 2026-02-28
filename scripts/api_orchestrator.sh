#!/bin/bash
set -euo pipefail
if [ $# -lt 1 ]; then
  echo "Usage: api_orchestrator.sh <curl-args...>"
  exit 1
fi
CACHE_DIR="$HOME/.openclaw/workspace/memory/warm-json/api-cache"
mkdir -p "$CACHE_DIR"
REQ_HASH=$(printf '%s' "$*" | sha256sum | cut -d' ' -f1)
CACHE_FILE="$CACHE_DIR/$REQ_HASH.json"
if [ -f "$CACHE_FILE" ] && find "$CACHE_FILE" -mmin -lt 15 >/dev/null; then
  cat "$CACHE_FILE"
  exit 0
fi
"$HOME/.openclaw/workspace/scripts/api_rate_monitor.sh" || true
attempt=1
max_attempts=5
base_delay=2
while [ $attempt -le $max_attempts ]; do
  if RESPONSE=$(curl -s "$@" 2>/dev/null); then
    echo "$RESPONSE" | tee "$CACHE_FILE"
    exit 0
  fi
  sleep $((base_delay * attempt))
  attempt=$((attempt + 1))
done
echo "API orchestrator: request failed after $max_attempts attempts" >&2
exit 1
