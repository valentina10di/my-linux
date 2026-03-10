#!/bin/bash
 TARGET=${1:-8.8.8.8}
 MAX_PING_TIME_MS=100
 MAX_FAILURES=3
 failures=0
    echo "--- Monitoring $TARGET started ---"
    while true; do
       ping_result=$(ping -c 1 -W 1 "$TARGET" 2>&1)
       ping_time=$(echo "$ping_result" | grep -o 'time=[0-9.]*' | cut -d= -f2)
 
      if [ -n "$ping_time" ]; then
        failures=0
       if awk "BEGIN {exit !($ping_time > $MAX_PING_TIME_MS)}"; then
          echo "[!] PING HIGHER THAN $MAX_PING_TIME_MS ms: $ping_time ms"
       fi
     else
       ((failures++))
       if [ "$failures" -eq "$MAX_FAILURES" ]; then
        echo "[!] WARNING: Ping failed 3 times in a row!"
 
       fi
     fi
     sleep 1
 done