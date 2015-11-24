echo "starting znc on port ($PORT)"
sed -i s/\$PORT/${PORT}/ .znc/configs/znc.conf
./znc/bin/znc -f &
export ZNCPID=$!
echo "waiting for znc ($ZNCPID) to exit......."
while [ -e /proc/$ZNCPID ]
do
    echo "$ZNCPID is running"
    sleep 600
done

kill $ZNCPID
