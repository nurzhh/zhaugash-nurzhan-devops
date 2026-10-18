#!/bin/sh
set -eu

STUDENT_NAME="${STUDENT_NAME:-Nurzhan}"
STUDENT_SURNAME="${STUDENT_SURNAME:-Zhaugash}"
STUDENT_GROUP="${STUDENT_GROUP:-IT2-2312}"
STUDENT_ID="${STUDENT_ID:-38387}"

cat <<EOF
================================
DevOps Student Application
================================

Name: ${STUDENT_NAME}
Surname: ${STUDENT_SURNAME}
Group: ${STUDENT_GROUP}
Student ID: ${STUDENT_ID}

Application is running successfully!
EOF
