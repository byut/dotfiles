#!/bin/bash

function join_by {
    local d=${1-} f=${2-}
    if shift 2; then
        printf %s "$f" "${@/#/$d}"
    fi
}

join_by " | " \
    "Battery: $(($(cat /sys/class/power_supply/BATT/charge_now) * 100 / $(cat /sys/class/power_supply/BATT/charge_full)))%" \
    "$(date +"%a %F %H:%M")"
