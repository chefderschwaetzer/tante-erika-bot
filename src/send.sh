#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJECT_ROOT="$SCRIPT_DIR/.."
ENV_FILE="$PROJECT_ROOT/.env"

if [ -f "$ENV_FILE" ]; then
    source "$ENV_FILE"
fi

RECIPIENTS_DIR="$PROJECT_ROOT/recipients"
BILD_DATEI="$PROJECT_ROOT/tmp/reddit_bot_bild.jpg"

if [ ! -f "$BILD_DATEI" ]; then
    echo "❌ STOPP: Es liegt kein Bild unter $BILD_DATEI bereit."
    echo "Bitte führe erst fetch_reddit.sh aus!"
    exit 1
fi

echo "Bild gefunden. Starte Versand..."

if [ -z "$(ls -A $RECIPIENTS_DIR/*.txt 2>/dev/null)" ]; then
   echo "⚠️ Keine Empfänger-Dateien (.txt) in $RECIPIENTS_DIR gefunden."
   exit 0
fi

for DATEI in "$RECIPIENTS_DIR"/*.txt
do
  [ -e "$DATEI" ] || continue

  NUMMER=$(cat "$DATEI" | tr -d '[:space:]')
  
  if [ -z "$NUMMER" ]; then continue; fi

  NAME=$(basename "$DATEI" .txt)

  echo "➡️ Sende an: $NAME..."

  npx mudslide send-image "$NUMMER@s.whatsapp.net" "$BILD_DATEI"
  
  BASE_SLEEP=${SLEEP_MIN:-8}
  RAND_SLEEP=${SLEEP_RANDOM:-5}
  ACTUAL_SLEEP=$((BASE_SLEEP + RANDOM % RAND_SLEEP))
  
  echo "   ... warte ${ACTUAL_SLEEP}s"
  sleep $ACTUAL_SLEEP
done

echo "✅ Alle Nachrichten versendet."

rm "$BILD_DATEI"
echo "Temp-Bild wurde gelöscht."