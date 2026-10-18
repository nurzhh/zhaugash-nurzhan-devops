#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PROJECT_DIR=$(dirname "$SCRIPT_DIR")

mkdir -p "$PROJECT_DIR/logs" "$PROJECT_DIR/backup"
if [ ! -f "$PROJECT_DIR/logs/application.log" ]; then
  cp "$PROJECT_DIR/config/application.log.example" "$PROJECT_DIR/logs/application.log"
fi

printf '%s\n' 'Local demonstration files are ready.'
