#!/bin/sh
# Location: /etc/acpi/handlers/backlight.sh
# A script to control backlight brightness with ACPI events
# Argument $1: either '-' for brightness up or '+' for brightness down

# Path to the sysfs file controlling backlight brightness
brightness_file="/sys/class/backlight/intel_backlight/brightness"

# Step size for increasing/decreasing brightness.
# Adjust this to a reasonable value based on the value of the file
# `/sys/class/backlight/intel_backlight/max_brightness` on your computer.
step=500

# Some scary-looking but straightforward Bash arithmetic and input/output redirection
case $1 in
  # Increase current brightness by `step` when `+` is passed to the script
  +) echo $(($(< "${brightness_file}") + ${step})) > "${brightness_file}";;

  # Decrease current brightness by `step` when `-` is passed to the script
  -) echo $(($(< "${brightness_file}") - ${step})) > "${brightness_file}";;
esac
