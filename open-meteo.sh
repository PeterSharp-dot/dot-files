#!/usr/bin/env bash
LAT=51.24
LON=22.70

# Pobranie prognozy godzinowej z Open-Meteo
RESP=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&hourly=temperature_2m,pressure_msl,precipitation,windspeed_10m,weathercode&timezone=Europe/Warsaw")

# Aktualna godzina
NOW=$(date +"%Y-%m-%dT%H:00")

# Szukanie indeksu aktualnej godziny
INDEX=$(echo "$RESP" | jq --arg NOW "$NOW" '.hourly.time | index($NOW)')

# Funkcja mapująca weathercode na ikonę Unicode
get_weather_icon() {
    code=$1
    case $code in
        0) echo "☀️" ;;            # clear sky
        1) echo "🌤️" ;;           # mainly clear
        2) echo "⛅" ;;           # partly cloudy
        3) echo "☁️" ;;           # overcast
        45|48) echo "🌫️" ;;       # fog
        51|53|55|56|57) echo "🌦️" ;; # drizzle
        61|63|65|66|67) echo "🌧️" ;; # rain
        71|73|75|77) echo "❄️" ;;     # snow
        80|81|82) echo "🌧️" ;;     # rain showers
        85|86) echo "❄️" ;;         # snow showers
        95|96|99) echo "⛈️" ;;      # thunderstorm
        *) echo "❓" ;;              # unknown
    esac
}

if [ "$INDEX" != "null" ]; then
    TEMP=$(echo "$RESP" | jq -r ".hourly.temperature_2m[$INDEX]")
    PRESSURE=$(echo "$RESP" | jq -r ".hourly.pressure_msl[$INDEX]")
    PRECIP=$(echo "$RESP" | jq -r ".hourly.precipitation[$INDEX]")
    WIND=$(echo "$RESP" | jq -r ".hourly.windspeed_10m[$INDEX]")
    WCODE=$(echo "$RESP" | jq -r ".hourly.weathercode[$INDEX]")

    ICON=$(get_weather_icon $WCODE)

    # Funkcja pomocnicza do wyciągania prognozy dla konkretnej godziny
    get_forecast_line() {
        HOUR=$1
        LEN=$(echo "$RESP" | jq '.hourly.time | length')
        IDX=$(echo "$RESP" | jq --arg HOUR "$HOUR" '.hourly.time | index($HOUR)')
        if [ "$IDX" != "null" ] && [ "$IDX" -lt "$LEN" ]; then
            T=$(echo "$RESP" | jq -r ".hourly.temperature_2m[$IDX]")
            P=$(echo "$RESP" | jq -r ".hourly.precipitation[$IDX]")
            W=$(echo "$RESP" | jq -r ".hourly.weathercode[$IDX]")
            ICONF=$(get_weather_icon $W)
            echo "Prognoza $HOUR: $T°C / $P mm $ICONF"
        else
            echo "Prognoza $HOUR: brak danych"
        fi
    }

    # Prognozy dla 12, 16 i 20
    FORECAST12=$(get_forecast_line "$(date +"%Y-%m-%dT12:00")")
    FORECAST16=$(get_forecast_line "$(date +"%Y-%m-%dT16:00")")
    FORECAST20=$(get_forecast_line "$(date +"%Y-%m-%dT20:00")")

    # Wyjście dla Waybara
    echo "{\"text\": \"$ICON ${TEMP}°C\", \"tooltip\": \"Ciśnienie: ${PRESSURE} hPa\nOpady: ${PRECIP} mm\nWiatr: ${WIND} km/h\n$FORECAST12\n$FORECAST16\n$FORECAST20\"}"
else
    echo "{\"text\": \"Świdnik: brak danych\", \"tooltip\": \"Brak danych dla aktualnej godziny\"}"
fi

