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

demo=$1
name=$(basename "$demo" .dem)

echo "Looking for records in: $name"

i=0
./bin/demotc.pl grep "$demo" "$PATTERN" | while IFS=" " read -r timecode result; do
	timecode=${timecode%:}
	result=${result#\"}
	result=${result%\"}
	result=${result%% *}

	echo "Possible record found at $timecode: $result, extracting..."

	minutes=${result%%:*}
	result=${result#*:}
	seconds=${result%%.*}
	tenths=${result#*.}

	timecode_start=`echo "$timecode - $minutes*60 - $seconds - $tenths*0.1 - 2" | bc -l`
	timecode_end=`echo "$timecode + 2" | bc -l`
	i=$(($i + 1))
   	#./demotc.pl cut "$demo" "playback-$i.dem" "$timecode_start" "$timecode_end"
	./bin/demotc.pl cut "$demo" "capture-${seconds}.${tenths}_-_$name-$i.dem" "$timecode_start" "$timecode_end" --capture
done

mv "$demo" ${WORKING_DIR}${ARCHIVED_DIR}
find -name "capture-*.dem" -exec mv {} ${WORKING_DIR}${MARKED_DIR} \; 

echo "Done."
