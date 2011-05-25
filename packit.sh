#!/bin/bash
# Written by cl3mens 2011-02-24

workdir=/tmp
host=`hostname`
ip=`ifconfig  | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`

outfile=$workdir\/$host.data

echo Working with $outfile
echo

echo "host" $host > $outfile
echo "ip" $ip >> $outfile
echo `./cpu.sh` >> $outfile
echo `./mem.sh human | grep ram` >> $outfile
echo `./mem.sh human | grep swap` >> $outfile
echo `./rootfs.sh` >> $outfile
echo "generated" `date +%F" "%H":"%M` >> $outfile