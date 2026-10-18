#!/bin/sh
set -eu

if [ "$#" -ne 2 ]; then
  printf 'Usage: %s GROUP STUDENT_ID\n' "$0" >&2
  exit 2
fi

GROUP=$1
STUDENT_ID=$2
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PROJECT_DIR=$(dirname "$SCRIPT_DIR")

for relative_path in \
  Zhaugash_Nurzhan_info.txt \
  .env.example \
  app/student_app.sh \
  scripts/Zhaugash_Nurzhan_system.sh \
  docker-compose.yml \
  Jenkinsfile \
  README.md
do
  file="$PROJECT_DIR/$relative_path"
  sed -i.bak \
    -e "s/REPLACE_WITH_GROUP/$GROUP/g" \
    -e "s/REPLACE_WITH_STUDENT_ID/$STUDENT_ID/g" \
    "$file"
  rm -f "$file.bak"
done

printf 'Personalized project for group %s and Student ID %s.\n' "$GROUP" "$STUDENT_ID"
