# TelegramNotificationSkill

## Purpose
Guarantee delivery of operational alerts (cron status, API failures, escalations) with retries, logging, and PARA mirroring.

## Components
1. `telegram_notify.sh` – sends messages via Telegram using credentials fetched from SecretManager.
2. `notification_queue.jsonl` – local queue for mirroring every outbound alert.
3. `notification_health.sh` – cron-friendly script that pings Telegram API every 5 minutes and activates fallback channels after 2 failures.

## Workflow
1. Skill queries SecretManager for `TELEGRAM_BOT_TOKEN` and `TELEGRAM_CHAT_ID`.
2. Messages are sent with exponential backoff + jitter, logged to `memory/warm-json/notifications/`.
3. Health script records latency, sets `fallback_active=true` if API is unreachable twice, and notifies alternate channel (email/Slack placeholder) until recovery.

## Fallback Channels
- Primary: Telegram (@MasterSDFo7)
- Secondary (placeholder): email ops list or Slack DM (hook to be configured)

## Integration
- Called from cron jobs, API orchestrator, and escalation tiers defined in `SecuritySkill.yaml`.
- Adds compact summaries to PARA nightly consolidation.