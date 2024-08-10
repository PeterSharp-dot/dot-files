#!/bin/bash

# Ścieżka do katalogu z informacjami o baterii
BATTERY_PATH="/sys/class/power_supply/BAT0"

# Definicje kolorów dla dwmblocks
RED="%{F#FF0000}"    # Czerwony
YELLOW="%{F#FFFF00}" # Żółty
RESET="%{F-}"        # Resetowanie koloru do domyślnego

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
      COLOR=$RESET
    fi

    # Wydrukowanie procentowego stopnia naładowania baterii z odpowiednim kolorem
    echo "${COLOR}Procentowy stopień naładowania baterii: ${CAPACITY}%${RESET}"
  else
    echo "Nie znaleziono pliku capacity w katalogu $BATTERY_PATH"
  fi
else
  echo "Nie znaleziono katalogu $BATTERY_PATH"
fi
