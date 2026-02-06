#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "🤖 Bot wird gestartet..."
echo "--------------------------------"

"$SCRIPT_DIR/fetch_reddit.sh"

if [ $? -ne 0 ]; then
    echo "❌ Fehler beim Download. Breche ab."
    read -p "Drücke Enter zum Schließen..."
    exit 1
fi

echo "--------------------------------"
echo "Bild erfolgreich geladen."

"$SCRIPT_DIR/send.sh"

echo "--------------------------------"
echo "✅ Alles erledigt."

read -p "Drücke Enter zum Schließen..."