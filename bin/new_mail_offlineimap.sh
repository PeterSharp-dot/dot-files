#!/bin/bash

# Uruchomienie offlineimap
offlineimap

# Sprawdzenie czy są nowe wiadomości
# NEW_MAIL_COUNT=$(find ~/Mail -type f -wholename '*/new/*' | wc -l)
NEW_MAIL_COUNT=$(find ~/Mail -type d \( -name GeekForGeeks -o -name HowToGeek -o -name LanguageGymBlog -o -name Quora -o -name Reddit -o -name ReviewGeek -o -name StackOverflow \) -prune -o -type f -wholename '*/new/*' -print | wc -l)

if [ "$NEW_MAIL_COUNT" -gt 0 ]; then
  # Wyświetlenie powiadomienia o nowej poczcie
  notify-send "New mail" "You have $NEW_MAIL_COUNT new mails."
fi
