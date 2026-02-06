#!/bin/bash

# Konfiguration
SUBREDDIT="grussbilder"
ZIEL_DATEI="/home/mortem/dev/tante_erika_bot/tmp/reddit_bot_bild.jpg"

echo "1. Suche Bild auf r/$SUBREDDIT..."

# URL holen (mit User-Agent, damit Reddit nicht blockt)
BILD_URL=$(curl -s -H "User-Agent: LinuxBot/1.0" "https://www.reddit.com/r/$SUBREDDIT/hot.json?limit=25" | \
jq -r '.data.children[].data.url_overridden_by_dest' | \
grep -E '\.jpg$|\.png$' | \
shuf -n 1)

# Prüfen ob eine URL gefunden wurde
if [ -z "$BILD_URL" ]; then
    echo "FEHLER: Kein Bild gefunden!"
    exit 1
fi

echo "2. Gefunden: $BILD_URL"
echo "3. Lade herunter nach $ZIEL_DATEI ..."

# Herunterladen
curl -s -o "$ZIEL_DATEI" "$BILD_URL"

echo "✅ Fertig! Das Bild liegt jetzt bereit unter: $ZIEL_DATEI"
echo "Du kannst es dir anschauen oder mit dem zweiten Skript versenden."