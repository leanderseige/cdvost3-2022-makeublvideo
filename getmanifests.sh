#!/bin/bash

for i in $(cat manifests.csv); do
	f=$(echo $i | cut -d '/' -f 6).json
	wget -O manifests/$f $i
done
