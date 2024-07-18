#!/bin/bash

# Pobranie wyniku komendy uptime
uptime_output=$(uptime)

# Wyciągnięcie wartości load average dla ostatniej 1 minuty
load_average_1min=$(echo $uptime_output | awk -F 'load average: ' '{print $2}' | awk -F ', ' '{print $1}')

# Wyświetlenie wartości load average dla ostatniej 1 minuty
echo "load $load_average_1min"
