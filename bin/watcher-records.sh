#!/bin/bash
# copies "cut" demos to the Encoding Server when complete

source config/config.conf

inotifywait -m $WORKING_DIR -e close_write -e moved_to |
    while read path action file; do

        # TODO: check if file has .dem extension

        echo "-> $file"

        # Process all records
        echo ./bin/demotc-ctf-record-extractor.sh "${path}${file}" new
        ./bin/demotc-ctf-record-extractor.sh "${path}${file}" new

        for demo in $(find "${WORKING_DIR}sliced/" -name "capture-*.dem"); do

            demo_with_path=$demo
            demo=$(basename $demo)

            echo "Processing demo: $demo"

            # Record the demo (the bottleneck)
            ./bin/xonotic-headless.sh -w "$demo"

            mv $demo_with_path ${WORKING_DIR}archived/

            # Move capture-*.ogv to VIDEO_DIR -- TODO improve this

            LAST_FILE=$(ls -Art "$RAW_VIDEO_DIR" | tail -n 1)
            echo "Last File: $LAST_FILE"

            echo mv "${RAW_VIDEO_DIR}${LAST_FILE}" "$VIDEO_DIR/${demo%.*}.ogv"
            mv "${RAW_VIDEO_DIR}${LAST_FILE}" "$VIDEO_DIR/${demo%.*}.ogv"

        done

    done
