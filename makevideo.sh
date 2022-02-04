#!/bin/bash
#ffmpeg -y -f image2 -i frames/%5d.png \
#	-i /media/sf_VMSharedUbuntu/coinoverlay2.png \
#	-filter_complex [0]overlay=x=0:y=0[out] \
#	-map [out] -map 0:a? \
#	output.mp4

ffmpeg -y -f image2 -i frames/%5d.png \
	-i muenzsammlung-de.wav \
	-preset slower -g 1 output.mp4
