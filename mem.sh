#!/bin/bash
# Written by cl3mens on 20/2-2011

memInfo="/proc/meminfo"
unit="KB"

memPhys=`awk '/^MemTotal/ {print $2}' $memInfo`
memBuff=`awk '/^Buffers/ {print $2}' $memInfo`
memCached=`awk '/^Cached/ {print $2}' $memInfo`
memFree=`awk '/^MemFree/ {print $2}' $memInfo`
realFree=$((memBuff + memCached + memFree))
realUsed=$((memPhys - realFree))

swapTotal=`awk '/^SwapTotal/ {print $2}' $memInfo`
swapCached=`awk '/^SwapCached/ {print $2}' $memInfo`

if [[ $@ = 'debug' ]]
then

    echo "Requested debug mode"
    echo
    echo "Phys: " $memPhys
    echo "Buff: " $memBuff
    echo "Cached: " $memCached
    echo "Free: " $memFree
    echo "Free for real: " $realFree
    echo
    echo "Swap size: " $swapTotal
    echo "Swap used: " $swapCached
    echo

elif [[ $@ = 'human' ]]
then
    
#    echo "Requested human mode"
    realUsed=$((realUsed / 1024))
    memPhys=$((memPhys / 1024))
    swapCached=$((swapCached / 1024))
    swapTotal=$((swapTotal / 1024))
    unit="MB"

fi

echo  "ram" $realUsed "/" $memPhys $unit
echo  "swap" $swapCached "/" $swapTotal $unit

#echo -e "RAM:\t" $realUsed "/" $memPhys $unit "used"
#echo -e "Swap:\t" $swapCached "/" $swapTotal $unit "used"