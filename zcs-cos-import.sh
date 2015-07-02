#!/bin/bash

# Create COS
cosList=`cat $PWD/cos/cos.lst`

arr=$(echo $cosList | tr " " "\n");
for cosName in $arr
do
	echo "Creating $cosName"
	su - zimbra -c 'zmprov -l cc '$cosName
done

# Modify Attributes
cosFileList=`ls $PWD/cos/*.cos`
arr=$(echo $cosFileList | tr " " "\n");
for cosFile in $arr
do
	echo "Importing $cosFile"
	su - zimbra -c 'zmprov -l < '$cosFile
done

echo "Import Done!!"
echo ""
