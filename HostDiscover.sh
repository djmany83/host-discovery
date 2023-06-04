#!/bin/bash

broadcast=$(ifconfig | awk '/broadcast/ {print $6}')
if [ -z "$broadcast" ]; then
    echo "No se pudo obtener la dirección de difusión (broadcast)."
    exit 1
fi

IFS='.' read -r -a ip_array <<< "$broadcast"

if [ ${#ip_array[@]} -ne 4 ]; then
    echo "La dirección de difusión proporcionada no es válida."
    exit 1
fi

network="${ip_array[0]}.${ip_array[1]}.${ip_array[2]}"

for i in $(seq 2 254); do
    {
        timeout 1 ping -c 1 $network.$i >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            ttl=$(ping -c 1 $network.$i | awk -F'ttl=' '/ttl=/ {print $2}' | awk '{print $1}')
            if [ -n "$ttl" ]; then
                if (( ttl <= 64 )); then
                    os="Linux"
                elif (( ttl <= 128 )); then
                    os="Windows"
                else
                    os="Desconocido"
                fi

                mac=$(arp -n $network.$i | awk '{print $3}')
                mac=$(echo $mac | sed 's/HWaddress //' | tr '[:lower:]' '[:upper:]')
                printf "Host: %-10s - Estado: %-7s - MAC: %s - Sistema: %s\n" "$network.$i" "ACTIVO" "$mac" "$os"
            fi
        fi
    } &
done

# Esperar a que todos los procesos en segundo plano finalicen
wait
