#!/bin/bash

# # Ścieżka do katalogu z informacjami o baterii
# BATTERY_PATH="/sys/class/power_supply/BAT0"
#
# # Sprawdzenie, czy katalog istnieje
# if [ -d "$BATTERY_PATH" ]; then
#   # Odczytanie procentowego stopnia naładowania baterii
#   if [ -f "$BATTERY_PATH/capacity" ]; then
#     CAPACITY=$(cat "$BATTERY_PATH/capacity")
#     echo "bat $CAPACITY%" # bat = battery
#   else
#     echo "Nie znaleziono pliku capacity w katalogu $BATTERY_PATH"
#   fi
# else
#   echo "Nie znaleziono katalogu $BATTERY_PATH"
# fi

# Ścieżka do katalogu z informacjami o baterii
BATTERY_PATH="/sys/class/power_supply/BAT0"

# Definicje kolorów Pango
RED='<span foreground="red">'
YELLOW='<span foreground="yellow">'
WHITE='<span foreground="#FFFFFF">'
END='</span>'

# Sprawdzenie, czy katalog istnieje
if [ -d "$BATTERY_PATH" ]; then
  # Odczytanie procentowego stopnia naładowania baterii
  if [ -f "$BATTERY_PATH/capacity" ]; then
    CAPACITY=$(cat "$BATTERY_PATH/capacity")

    # Sprawdzenie poziomu naładowania i ustawienie odpowiedniego koloru
    if [ "$CAPACITY" -le 10 ]; then
      COLOR=$RED
    elif [ "$CAPACITY" -le 18 ]; then
      COLOR=$YELLOW
    else
      COLOR=$WHITE
    fi

    # Wydrukowanie procentowego stopnia naładowania baterii z odpowiednim kolorem
    echo "${COLOR}bat ${CAPACITY}%${END}"
  else
    echo "Nie znaleziono pliku capacity w katalogu $BATTERY_PATH"
  fi
else
  echo "Nie znaleziono katalogu $BATTERY_PATH"
fi
