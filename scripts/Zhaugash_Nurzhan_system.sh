#!/bin/sh
set -u

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PROJECT_DIR=$(dirname "$SCRIPT_DIR")
INFO_FILE="$PROJECT_DIR/Zhaugash_Nurzhan_info.txt"

printf '%s\n' '=============================='
printf '%s\n' 'Student Information'
printf '%s\n' '=============================='
printf '%s\n' 'Name: Nurzhan'
printf '%s\n' 'Surname: Zhaugash'
printf '%s\n' 'Group: REPLACE_WITH_GROUP'
printf '%s\n' 'Student ID: REPLACE_WITH_STUDENT_ID'
printf '\n%s\n' '=============================='
printf '%s\n' 'System Information'
printf '%s\n' '=============================='
printf 'Username: %s\n' "$(whoami)"
printf 'Hostname: %s\n' "$(hostname)"
printf 'Current Date: %s\n' "$(date '+%Y-%m-%d %H:%M:%S %Z')"
printf 'Operating System: %s\n' "$(uname -srm)"
printf '%s\n' 'Disk Usage:'
df -h "$PROJECT_DIR" | tail -n 1
printf '%s\n' 'Memory Usage:'
if command -v free >/dev/null 2>&1; then
  free -h
elif command -v vm_stat >/dev/null 2>&1; then
  vm_stat | head -n 6
else
  printf '%s\n' 'Memory command is not available on this operating system.'
fi

if [ -f "$INFO_FILE" ]; then
  printf '%s\n' 'Student information file exists.'
else
  printf '%s\n' 'Student information file does not exist.'
  exit 1
fi
