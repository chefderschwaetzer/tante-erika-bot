#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJECT_ROOT="$SCRIPT_DIR/.."
ENV_FILE="$PROJECT_ROOT/.env"

if [ -f "$ENV_FILE" ]; then
    source "$ENV_FILE"
else
    echo "❌ Fehler: .env Datei nicht gefunden in $PROJECT_ROOT"
    exit 1
fi

SUBREDDIT="${SUBREDDIT:-grussbilder}"
ZIEL_DATEI="$PROJECT_ROOT/tmp/reddit_bot_bild.jpg"

mkdir -p "$PROJECT_ROOT/tmp"

echo "1. Suche Bild auf r/$SUBREDDIT..."

BILD_URL=$(curl -s -H "User-Agent: $USER_AGENT" "https://www.reddit.com/r/$SUBREDDIT/hot.json?limit=25" | \
jq -r '.data.children[].data.url_overridden_by_dest' | \
grep -E '\.jpg$|\.png$' | \
shuf -n 1)

if [ -z "$BILD_URL" ]; then
    echo "❌ FEHLER: Kein Bild gefunden!"
    exit 1
fi

echo "2. Gefunden: $BILD_URL"
echo "3. Lade herunter nach $ZIEL_DATEI ..."

curl -s -o "$ZIEL_DATEI" "$BILD_URL"

if [ $? -eq 0 ]; then
    echo "✅ Fertig! Bild gespeichert."
else
    echo "❌ Download fehlgeschlagen."
    exit 1
fi