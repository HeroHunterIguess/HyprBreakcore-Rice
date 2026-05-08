#!/bin/bash
LOCKFILE="/tmp/lockdown_start"
PIDFILE="/tmp/lockdown_pid"

if [ ! -f "$LOCKFILE" ] || [ ! -f "$PIDFILE" ]; then
    notify-send "You arent currently locked in!"
    exit 1
fi

start_time=$(cat "$LOCKFILE")
pid=$(cat "$PIDFILE")
now=$(date +%s)
elapsed=$((now - start_time))

if [ "$elapsed" -lt 600 ]; then
    remaining=$((600 - elapsed))
    mins=$((remaining / 60))
    secs=$((remaining % 60))
    notify-send "Stay locked in!" "Too early! You must wait ${mins}m ${secs}s more."
    exit 1
else
    # stop the specific PID
    kill "$pid" 2>/dev/null
    rm -f "$LOCKFILE" "$PIDFILE"

    mins=$((elapsed / 60))
    secs=$((elapsed % 60))
    notify-send "Lock in mode" "Disabled after ${mins}m ${secs}s."
fi
