#!/data/data/com.termux/files/usr/bin/bash

i=0

for filename in $(ls *-*-*-*.markdown | sort -n); do
	newfile="$(printf "%03d" $i)_${filename:2}"
	echo $newfile
	mv $filename $newfile
	
	((i++))
done
