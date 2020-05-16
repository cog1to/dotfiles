#!/usr/bin/env bash

# Check the update process every 10 seconds for 60 seconds total.
# Kill it if it hangs for longer than 60 seconds.
function monitor() {
  local pid=$1 i=0

  while ps $pid &>/dev/null; do
    if (( i++ > 5 )); then
      echo "Max checks reached. Sending SIGKILL to ${pid}..." >&2
      kill -9 $pid; return 1
    fi

    sleep 10
  done
}

offlineimap -o -u quiet & monitor $!
