#!/bin/bash

rm frames/*
let cf=0
let fr=52
randi=()
randx=()
randy=()
idx=0

for i in $(ls -r1 images-west/*.jpg); do

	if [[ $RANDOM%3 -ne 0 ]]; then # randomly skip
		continue
	fi

	randi[$idx]=$i
	randx[$idx]=$(expr $RANDOM % 1920 - 540 )
	randy[$idx]=$(expr $RANDOM % 1080 - 540 )
	echo $idx ${randi[idx]}
	let idx=$idx+1
done

for i in $(ls -1 images-west/*.jpg); do

	if [[ $RANDOM%2 -ne 0 ]]; then # randomly skip
		continue
	fi

	for c in $(eval echo "{1..$fr}"); do
		let cf=$cf+1
		of=$(printf "%05d" $cf)
		composite -compose Src_Over -geometry 1920x1080+0+0 coinoverlay2.png $i "frames/$of.png"
		echo $cf $i
	done

	if [[ cf -gt 1424 ]]; then
		let off=$cf-1425
		echo "off $off"
		cp "frames/$of.png" result.png
		for ovidx in $(eval echo "{0..$off}"); do
			echo ovidx ${randi[ovidx]}
			convert ${randi[ovidx]} -fuzz 10% -transparent white overlay.png
			# convert result.png overlay.png -alpha off -compose copy_opacity -geometry +$randx[$ovidx]+randy[$ovidx] temp.png
			# composite -compose Src_Over -geometry 1920x1080+${randx[$ovidx]}+${randy[$ovidx]} overlay.png result.png temp.png
			composite -compose Src_Over -geometry 1920x1080+${randx[ovidx]}+${randy[ovidx]} overlay.png result.png temp.png
			# convert result.png overlay.png -composite temp.png
			mv temp.png result.png
		done
		cp result.png "frames/$of.png"
	fi

	if [[ fr -gt 1 ]]; then
		let fr=$fr-1
	fi

	if [[ cf -gt 1499 ]]; then
		exit
	fi

done
