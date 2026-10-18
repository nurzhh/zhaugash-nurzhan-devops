#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PROJECT_DIR=$(dirname "$SCRIPT_DIR")

chmod 600 "$PROJECT_DIR/private.txt"
chmod 644 "$PROJECT_DIR/public.txt"
ls -l "$PROJECT_DIR/private.txt" "$PROJECT_DIR/public.txt"
