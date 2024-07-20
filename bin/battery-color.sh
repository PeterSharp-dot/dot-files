#!/bin/bash
# Ścieżka do katalogu z informacjami o baterii
BATTERY_PATH="/sys/class/power_supply/BAT0"

# Definicje kolorów
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # Brak koloru (No Color)

# Sprawdzenie, czy katalog istnieje
if [ -d "$BATTERY_PATH" ]; then
  # Odczytanie procentowego stopnia naładowania baterii
  if [ -f "$BATTERY_PATH/capacity" ]; then
    CAPACITY=$(cat "$BATTERY_PATH/capacity")

    # Sprawdzenie poziomu naładowania i ustawienie odpowiedniego koloru
    if [ "$CAPACITY" -le 98 ]; then
      COLOR=$RED
    elif [ "$CAPACITY" -le 18 ]; then
      COLOR=$YELLOW
    else
      COLOR=$NC
    fi

    # Wydrukowanie procentowego stopnia naładowania baterii z odpowiednim kolorem
    echo -e "bat ${COLOR}${CAPACITY}%${NC}"
  else
    echo "Nie znaleziono pliku capacity w katalogu $BATTERY_PATH"
  fi
else
  echo "Nie znaleziono katalogu $BATTERY_PATH"
fi
