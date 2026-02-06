#!/bin/bash

ORDNER="../recipients"
BILD_DATEI="../tmp/reddit_bot_bild.jpg"

if [ ! -f "$BILD_DATEI" ]; then
    echo "❌ STOPP: Es liegt kein Bild unter $BILD_DATEI bereit."
    echo "Bitte führe erst ./fetch_reddit.sh aus!"
    exit 1
fi

echo "Bild gefunden. Starte Versand..."

for DATEI in "$ORDNER"/*.txt
do
  [ -e "$DATEI" ] || continue

  NUMMER=$(cat "$DATEI" | tr -d '[:space:]')
  
  if [ -z "$NUMMER" ]; then continue; fi

  NAME=$(basename "$DATEI" .txt)

  echo "➡️ Sende an: $NAME ($NUMMER)..."

  /usr/bin/npx mudslide send-image "$NUMMER@s.whatsapp.net" "$BILD_DATEI"
  
  sleep $((8 + RANDOM % 5))
done

echo "✅ Alle Nachrichten versendet."

rm "$BILD_DATEI"
echo "Temp-Bild wurde gelöscht."