#!/bin/bash

for i in $(ls -1 manifests/*json); do
# for i in $(ls -1 manifests/record_DE-15_kenom_186790.json); do
	imgbase0=$(cat $i | jq -r '.sequences[0].canvases[0].images[0].resource.service."@id"')
	imgbase1=$(cat $i | jq -r '.sequences[0].canvases[1].images[0].resource.service."@id"')
	if [ "$imgbase0" != "null" ]; then
		echo -e "$imgbase0/full/,1080/0/default.jpg"
	fi
	if [ "$imgbase1" != "null" ]; then
		echo -e "$imgbase1/full/,1080/0/default.jpg"
	fi
done

