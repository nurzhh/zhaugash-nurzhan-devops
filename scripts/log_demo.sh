#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PROJECT_DIR=$(dirname "$SCRIPT_DIR")
LOG_FILE="$PROJECT_DIR/logs/application.log"

printf '%s\n' 'Log file found at:'
find "$PROJECT_DIR" -type f -name application.log -print
printf '\n%s\n' 'ERROR lines:'
grep 'ERROR' "$LOG_FILE"
printf '\n%s\n' 'WARNING lines:'
grep 'WARNING' "$LOG_FILE"
printf '\nERROR count: '
grep -c 'ERROR' "$LOG_FILE"
printf '\n%s\n' 'Last five lines:'
tail -n 5 "$LOG_FILE"
