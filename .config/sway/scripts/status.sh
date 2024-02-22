#!/bin/bash

#
# Battery Info
# ---

charge_full=$(cat /sys/class/power_supply/BATT/charge_full)
charge_now=$(cat /sys/class/power_supply/BATT/charge_now)

modules=(
	"Battery: $(($charge_now * 100 / $charge_full))%"
	"$(date +"%a %F %H:%M")"
)

printf "%s" "${modules[0]}"
printf " | %s" "${modules[@]:1}"
