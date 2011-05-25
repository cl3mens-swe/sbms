#!/bin/bash
# Written by cl3mens 2011-02-24

workdir=/tmp
htmlout=/var/www/monitor.html

echo "Looking for data files in $workdir"

echo "<html><head><title>Statistics for cl3mnet</title></head>
<body>
<h1>What's up on cl3mnet</h1>

<table border=1>
<th>Hostname</th><th>IP</th><th>CPU idle</th><th>RAM</th><th>Swap</th><th>Used on /</th><th>Last seen at</th>" > $htmlout

echo 

for datafile in /tmp/*.data
do
echo $datafile "found, generating table row . . ."

host=`grep host $datafile | cut -d" " -f2-` 
ip=`grep ip $datafile | cut -d" " -f2-`
cpuIdle=`grep cpu $datafile | cut -d" " -f2-`
ram=`grep ram $datafile | cut -d" " -f2-`
swap=`grep swap $datafile | cut -d" " -f2-`
rootfs=`grep rootfs $datafile | cut -d" " -f2-`
generated=`grep generated $datafile | cut -d" " -f2-`

echo "<tr><td>$host</td><td>$ip</td><td>$cpuIdle</td><td>$ram</td><td>$swap</td><td>$rootfs</td><td>$generated</td></tr>" >> $htmlout

done

echo "No more data files found, finishing up"

echo "</table>
<br />
Page generated at `date`
</body>
</html>
" >> $htmlout
