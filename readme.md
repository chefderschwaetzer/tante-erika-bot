# 🤖 Tante Erika Bot

Ein automatisierter Bash-Bot für Linux, der "Grüße aus dem Internet" (Standard: r/grussbilder) herunterlädt und sie automatisch an eine Liste von WhatsApp-Kontakten sendet.

Perfekt, um der Verwandtschaft zuvorzukommen oder einfach täglich Freude (und Kitsch) zu verbreiten.

## ✨ Features

* **Automatischer Content:** Holt zufällige Bilder (Hot/Top) von einem Reddit-Subreddit.
* **Massenversand:** Sendet das Bild an beliebig viele Kontakte.
* **Human-Like Behavior:** Zufällige Wartezeiten zwischen den Nachrichten, um Spam-Erkennung zu vermeiden.
* **Portable:** Nutzt relative Pfade und Environment-Variablen (läuft überall, wo Bash ist).
* **Technologie:** Basiert auf Bash, `curl`, `jq` und [Mudslide](https://github.com/robvanderleek/mudslide) (WhatsApp CLI).

---

## 🚀 Voraussetzungen

Das Skript wurde für **Linux** (getestet auf CachyOS/Arch) entwickelt, läuft aber auch auf **macOS**.

Du benötigst folgende installierte Tools:
* `curl` (Download)
* `jq` (JSON Parsing)
* `nodejs` & `npm` (Runtime für den WhatsApp-Client)

**Installation unter Arch Linux / CachyOS:**
```bash
sudo pacman -S jq curl nodejs npm

Installation unter Debian / Ubuntu:
Bash

sudo apt install jq curl nodejs npm
```
# .env Konfiguration

# Welches Subreddit soll genutzt werden? (ohne "r/")
SUBREDDIT=grussbilder

# User-Agent für den Reddit-Zugriff (Verhindert Blockierung)
USER_AGENT="LinuxBot/1.0"

# Wartezeit zwischen Nachrichten in Sekunden (Spam-Schutz)
# Beispiel: Wartet mindestens 8s + zufällig 0-5s
SLEEP_MIN=8
SLEEP_RANDOM=5
