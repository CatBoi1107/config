#!/bin/bash

# 1. Launch hyprlock in the background
hyprlock &

# 2. Get the Process ID of the hyprlock instance we just started
LOCK_PID=$!

# 3. Wait for 10 minutes (600 seconds)
sleep 600

# 4. Check if that specific hyprlock process is still alive
if ps -p $LOCK_PID > /dev/null; then
    # If hyprlock is still running, it means the session is still locked.
    systemctl suspend
fi
