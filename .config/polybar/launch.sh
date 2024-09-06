#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit

# Otherwise you can use the nuclear option:
# killall -q polybar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log

HOSTNAME=`hostname`
if [ "$HOSTNAME" = "Jlab-Ptbl-Acer" ]; then
	echo "Portable!!"
    polybar --config=~/.config/polybar/config_ptbl.ini main 2>&1 | tee -a /tmp/polybar1.log & disown
else
    polybar --config=~/.config/polybar/config.ini main 2>&1 | tee -a /tmp/polybar1.log & disown
    polybar --config=~/.config/polybar/config.ini bottom 2>&1 | tee -a /tmp/polybar1.log & disown
fi

# polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
