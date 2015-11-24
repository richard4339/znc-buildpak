set -e

echo "starting znc on port ($PORT)"
sed "s/HEROKUPORT/$PORT/" /app/.znc/configs/znc.conf
./znc/bin/znc -fD
