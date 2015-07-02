#!/bin/bash


cosList=`su - zimbra -c 'zmprov gac'`;

arr=$(echo $cosList | tr " " "\n");
for cosName in $arr
do
	echo $cosName >> $PWD/cos/cos.lst
	echo "Exporting $cosName"
	su - zimbra -c 'zmprov -l gc '$cosName' > '$PWD'/cos/'$cosName'.tmp'
	cat $PWD/cos/$cosName.tmp | sed 's/^/mc '$cosName' /g' | sed 's/: / /g' > $PWD/cos/$cosName.cos
done

rm $PWD/cos/*.tmp

echo ""
echo "Done!!"

