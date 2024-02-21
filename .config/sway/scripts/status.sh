#!/bin/bash

modules=(
	"$(date +"%a %F %H:%M")"
)

printf "%s" "${modules[0]}"
# printf " | %s" "${modules[@]:1}"
