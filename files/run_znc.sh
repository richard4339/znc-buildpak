./znc/bin/znc -f &
export ZNCPID=$!
./ngrok start znc --authtoken $NGROK_API_TOKEN --log "stdout" --config ngrok.conf &
export NGROKPID=$!
echo "waiting for znc ($ZNCPID) to exit......."
while [ -e /proc/$ZNCPID ]
do
    echo "$ZNCPID is running"
    sleep 600
done

kill $NGROKPID
kill $ZNCPID
