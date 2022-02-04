#!/bin/bash

for i in $(cat images.csv); do
	wget -O temp.jpg $i
	f=$(echo $i | cut -d '/' -f 7)
	echo $f
	convert temp.jpg +repage -background white -gravity west -extent 1920x1080 images-west/$f
done
