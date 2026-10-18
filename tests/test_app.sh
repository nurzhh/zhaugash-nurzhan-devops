#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PROJECT_DIR=$(dirname "$SCRIPT_DIR")
OUTPUT=$(STUDENT_GROUP=TEST-GROUP STUDENT_ID=123456 "$PROJECT_DIR/app/student_app.sh")

printf '%s\n' "$OUTPUT" | grep -q 'Name: Nurzhan'
printf '%s\n' "$OUTPUT" | grep -q 'Surname: Zhaugash'
printf '%s\n' "$OUTPUT" | grep -q 'Group: TEST-GROUP'
printf '%s\n' "$OUTPUT" | grep -q 'Student ID: 123456'
printf '%s\n' "$OUTPUT" | grep -q 'Application is running successfully!'
printf '%s\n' 'All application checks passed.'
