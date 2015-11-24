#!/bin/bash
set -e

sed -i s/\$PORT/${PORT}/ .znc/configs/znc.conf
echo "starting znc on port ($PORT)"
./znc/bin/znc -f --no-color &
