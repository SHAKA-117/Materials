#!/bin/bash

hrs=$(date +"%H:%M")
dias=$(date +"%A")
TOKEN="1381048140:AAGnpVO1m-Pw1Op25Q8AscmY3gnC2jT9Yv4"
ID="-424794087"

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
