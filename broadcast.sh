#!/bin/bash

cd /home/mortem/dev/tante_erika_bot/src

echo "🤖 Bot wird gestartet..."
echo "--------------------------------"

./fetch_reddit.sh
if [ $? -ne 0 ]; then
    echo "❌ Fehler beim Download. Breche ab."
    read -p "Drücke Enter zum Schließen..."
    exit 1
fi

echo "--------------------------------"
echo "Bild erfolgreich geladen."

./send.sh

echo "--------------------------------"
echo "✅ Alles erledigt."

read -p "Drücke Enter zum Schließen..."