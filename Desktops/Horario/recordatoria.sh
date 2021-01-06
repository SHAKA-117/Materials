#!/bin/bash

hrs=$(date +"%H:%M")
dias=$(date +"%A")
TOKEN="954962311:AAHzwXYXnE1EU6Ggdnc8vDMh_sJMyeJI5B0"
ID="754199278"

URL="https://api.telegram.org/bot$TOKEN/sendMessage"

case $dias in
    "lunes" | "monday")
        while IFS=$ read -r HORAS ACTIVIDAD; do
            if [ "$HORAS" == "$hrs" ]; then
                MENSAJE="Son las $hrs Hora de $ACTIVIDAD" 
            fi
        done < Lunes.txt
    ;;
    "martes" | "tuesday")
        while IFS=$ read -r HORAS ACTIVIDAD; do
            if [ "$HORAS" == "$hrs" ]; then
            echo "entre"
                MENSAJE="Son las $hrs Hora de $ACTIVIDAD" 
            fi
        done < Martes.txt
    ;;
    "miercoles" | "wednesday")
        while IFS=$ read -r HORAS ACTIVIDAD; do
            if [ "$HORAS" == "$hrs" ]; then
                MENSAJE="Son las $hrs Hora de $ACTIVIDAD" 
            fi
        done < Miercoles.txt
    ;;
    "jueves" | "thursday")
        while IFS=$ read -r HORAS ACTIVIDAD; do
            if [ "$HORAS" == "$hrs" ]; then
                MENSAJE="Son las $hrs Hora de $ACTIVIDAD" 
            fi
        done < Jueves.txt
    ;;
    "viernes" | "friday")
        while IFS=$ read -r HORAS ACTIVIDAD; do
            if [ "$HORAS" == "$hrs" ]; then
                MENSAJE="Son las $hrs Hora de $ACTIVIDAD" 
            fi
        done < Viernes.txt
    ;;
esac

curl -s -X POST $URL -d chat_id=$ID -d text="$MENSAJE"
