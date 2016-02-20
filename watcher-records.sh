#!/bin/bash
# copies "cut" demos to the Encoding Server when complete

source config/config.conf

#inotifywait -m $WORKING_DIR -e create -e moved_to |
inotifywait -m $WORKING_DIR -e create -e moved_to |
    while read path action file; do

        echo "-> $file"

        # Process all records
        echo ./demotc-ctf-record-extractor.sh "${path}${file}" new
        ./demotc-ctf-record-extractor.sh "${path}${file}" new

        for demo in $(find "${WORKING_DIR}sliced/" -name "capture-*.dem"); do

            demo=$(basename $demo)

            echo "Processing demo: $demo"

            # Record the demo (the bottleneck)
            ./xonotic-headless.sh "$demo"

            # Move capture-*.ogv to VIDEO_DIR -- TODO improve this
            LAST_FILE=$(ls -Art "$RAW_VIDEO_DIR" | tail -n 1)
            echo "Last File: $LAST_FILE"
            echo mv "${RAW_VIDEO_DIR}${LAST_FILE}" "$VIDEO_DIR/${demo%.*}.ogv"
            mv "${RAW_VIDEO_DIR}${LAST_FILE}" "$VIDEO_DIR/${demo%.*}.ogv"

        done

    done
