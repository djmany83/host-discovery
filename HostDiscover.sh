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
    timeout 1 bash -c "ping -c 1 $network.$i > /dev/null 2>&1" && {
        mac=$(arp -n $network.$i | awk '{print $3}')
        mac=$(echo $mac | sed 's/HWaddress //' | tr '[:lower:]' '[:upper:]')
        printf "Host: %-10s - Estado: %-7s - MAC: %s\n" "$network.$i" "ACTIVO" "$mac"
    } &
done
wait
