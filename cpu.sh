#!/bin/bash
# Written by cl3mens 21/2-2011

cpuTotal1st=`cut -d" " -f1 /proc/uptime`
cpuIdle1st=`cut -d" " -f2 /proc/uptime`

sleep 5s

cpuTotal2nd=`cut -d" " -f1 /proc/uptime`
cpuIdle2nd=`cut -d" " -f2 /proc/uptime`

totalDiff=`echo "scale=4; $cpuTotal2nd - $cpuTotal1st" | bc; exit`
idleDiff=`echo "scale=4; $cpuIdle2nd - $cpuIdle1st" | bc; exit`
percentIdle=`echo "scale=2; ($idleDiff / $totalDiff) * 100" | bc; exit`

#echo "totalDiff: " $totalDiff
#echo "idleDiff: " $idleDiff
echo "cpu" $percentIdle
