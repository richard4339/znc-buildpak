./znc/bin/znc -f &
export ZNCPID=$!
./ngrok authtoken $NGROK_API_KEY
./ngrok start --log "stdout" --config /app/.ngrok2/ngrok.yml --config ngrok.conf znc
export NGROKPID=$!
echo "waiting for znc ($ZNCPID) to exit......."
while [ -e /proc/$ZNCPID ]
do
    echo "$ZNCPID is running"
    sleep 600
done

kill $NGROKPID
kill $ZNCPID
