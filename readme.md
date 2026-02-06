# 🤖 Tante Erika Bot

Ein automatisierter Bash-Bot, der "Grüße aus dem Internet" (Standard: r/grussbilder) holt und sie automatisch an eine Liste von WhatsApp-Kontakten sendet.

Perfekt, um der Verwandtschaft zuvorzukommen oder einfach täglich Freude (und Kitsch) zu verbreiten.

## ✨ Features

* **Automatischer Content:** Holt zufällige Bilder (Hot/Top) von einem Reddit-Subreddit.
* **Massenversand:** Sendet das Bild an beliebig viele Kontakte.
* **Anti-Spam:** Zufällige Wartezeiten zwischen den Nachrichten, um menschliches Verhalten zu simulieren.
* **Sauber:** Nutzt relative Pfade und Environment-Variablen (läuft überall).
* **Technologie:** Basiert auf Bash, `curl`, `jq` und [Mudslide](https://github.com/robvanderleek/mudslide) (WhatsApp CLI).

## 🚀 Voraussetzungen

Das Skript läuft unter Linux (getestet auf CachyOS/Arch) oder macOS.

Du benötigst folgende Tools:
* `curl` (Daten holen)
* `jq` (JSON verarbeiten)
* `nodejs` & `npm` (für Mudslide)

Unter Arch/CachyOS installieren:
```bash
sudo pacman -S jq curl nodejs npm