./znc/bin/znc -f &
export ZNCPID=$!
./ngrok start znc --log "stdout" --config ngrok.conf
export NGROKPID=$!
echo "waiting for znc ($ZNCPID) to exit......."
while [ -e /proc/$ZNCPID ]
do
    echo "$ZNCPID is running"
    sleep 600
done

kill $NGROKPID
kill $ZNCPID
