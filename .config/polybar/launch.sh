#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# do you have multiple monitors?
for m in $(polybar --list-monitors | cut -d":" -f1); do
   MONITOR=$m polybar --reload -c $HOME/.config/polybar/top top &
   MONITOR=$m polybar --reload -c $HOME/.config/polybar/bottom bottom &
done
