#!/bin/bash
set -euo pipefail
if [ $# -eq 0 ]; then
  echo "Usage: telegram_notify.sh 'message'"
  exit 1
fi
MSG="$1"
SECRETS_FILE="$HOME/.openclaw/workspace/skills/SecretManager_v2.yaml"
if [ ! -f "$SECRETS_FILE" ]; then
  echo "Secret file $SECRETS_FILE not found"
  exit 1
fi
export SECRETS_FILE_PATH="$SECRETS_FILE"
read -r TOKEN CHAT_ID < <(python3 - <<'PY'
import yaml, sys, os
secrets_file = os.environ['SECRETS_FILE_PATH']
with open(secrets_file, 'r') as f:
    data = yaml.safe_load(f)
secrets = data.get('secrets', {}) if isinstance(data, dict) else {}
token = secrets.get('TELEGRAM_BOT_TOKEN')
chat_id = secrets.get('TELEGRAM_CHAT_ID')
if not token or not chat_id:
    sys.exit('Missing TELEGRAM_BOT_TOKEN or TELEGRAM_CHAT_ID in secrets file')
print(token, chat_id)
PY
)
QUEUE_FILE="$HOME/.openclaw/workspace/memory/warm-json/notifications/notification_queue.jsonl"
mkdir -p "$(dirname "$QUEUE_FILE")"
MAX_RETRIES=5
DELAY=2
for ((attempt=1; attempt<=MAX_RETRIES; attempt++)); do
  RESPONSE=$(curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" \
    -d chat_id="$CHAT_ID" \
    --data-urlencode text="$MSG") || true
  echo "$(date -Is)\t$MSG" >> "$QUEUE_FILE"
  if echo "$RESPONSE" | grep -q '"ok":true'; then
    echo "Telegram notification sent"
    exit 0
  fi
  echo "Telegram send failed (attempt $attempt). Retrying in ${DELAY}s..."
  sleep $DELAY
  DELAY=$((DELAY * 2))
done
exit 1