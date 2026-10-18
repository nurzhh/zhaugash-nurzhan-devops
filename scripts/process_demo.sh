#!/bin/sh
set -eu

printf '%s\n' 'Current shell process:'
ps -p $$ -o pid=,user=,%cpu=,%mem=,command=
printf '\n%s\n' 'First five processes from ps aux:'
ps aux | head -n 6
