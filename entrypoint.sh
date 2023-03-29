#!/bin/bash

CMD='node /app/index.js > /proc/1/fd/1 2>/proc/1/fd/2'

printenv | sed 's/^\(.*\)=\(.*\)$/export \1="\2"/g' | grep -E "^export SCRAPPER_" > /root/environment.sh
chmod +x /root/environment.sh
echo "$SCRAPPER_CRON root . /root/environment.sh; $CMD" >> /etc/crontab
$CMD
echo "Start cron" > /proc/1/fd/1 2>/proc/1/fd/2
cron -f
