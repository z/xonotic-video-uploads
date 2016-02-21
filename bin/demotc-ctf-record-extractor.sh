#!/bin/bash
# creates "sliced" demo files

source config/config.conf

case "$2" in
	old) # left here in case I want to use it later
		PATTERN='all-time fastest lap record with (.*)\n'
		;;
	new|*)
		PATTERN='//CTF RECORD SET (.*)\n'
		;;
esac

d=$1
echo "processing $d"
name=$(basename "$d" .dem)
i=0
./demotc.pl grep "$d" "$PATTERN" | while IFS=" " read -r timecode result; do
	timecode=${timecode%:}
    echo "---> $result"
	result=${result#\"}
	result=${result%\"}
	result=${result%% *}

	echo "Possible record found at $timecode: $result, extracting..."

	minutes=${result%%:*}
	result=${result#*:}
	seconds=${result%%.*}
	result=${result#*.}
	tenths=$result

	timecode_start=`echo "$timecode - $minutes*60 - $seconds - $tenths*0.1 - 2" | bc -l`
	timecode_end=`echo "$timecode + 2" | bc -l`
	i=$(($i + 1))
    	#./demotc.pl cut "$d" "playback-$i.dem" "$timecode_start" "$timecode_end"
	./demotc.pl cut "$d" "capture-$name-$i.dem" "$timecode_start" "$timecode_end" --capture
done

find -name "capture-*.dem" -exec mv {} $WORKING_DIR/sliced \; 
