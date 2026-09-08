#!/bin/bash

# Find the exact sysfs path for the internal keyboard dynamically
INT_KEYBOARD_PATH=$(grep -l "AT Translated Set 2 keyboard" /sys/class/input/event*/device/name | sed 's|/name||')

# Exit if we can't locate the hardware path
if [ -z "$INT_KEYBOARD_PATH" ]; then
    exit 0
fi

if [ "$1" = "disable" ]; then
    # 1 tells the kernel input layer to block all keypresses
    echo 1 > "$INT_KEYBOARD_PATH/inhibited"
elif [ "$1" = "enable" ]; then
    # 0 tells the kernel to resume reading the hardware
    echo 0 > "$INT_KEYBOARD_PATH/inhibited"
fi
