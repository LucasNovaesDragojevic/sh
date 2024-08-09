#!/bin/bash

mount="/dev/nvme1n1p3"
fileLogName=$(date -Is)
pathLogName="/home/lucas/Documentos/alura"

diskUsage=$(df -h | grep $mount | awk '{print $5}')

cho "Disk usage $diskUsage" > "$pathLogName/$fileLogName.log"
