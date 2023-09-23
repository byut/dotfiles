# Launch a display server upon logging into a shell session
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    echo "Starting a display server..."
    startx &> /dev/null
    pkill -U $USER
    exit 0
fi
