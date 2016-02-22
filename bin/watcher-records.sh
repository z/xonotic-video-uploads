#!/bin/bash
# copies "cut" demos to the Encoding Server when complete

source config/config.conf

inotifywait -m $WORKING_DIR -e close_write -e moved_to |
    while read path action file; do

        # TODO: check if file has .dem extension

        echo "-> $file"

        # Process all records
        ./bin/demotc-ctf-record-extractor.sh "${path}${file}" new

        echo "Processing sliced demos..."

        find "${WORKING_DIR}sliced/" -name "capture-*.dem" | parallel --eta ./bin/encode-demo.sh {} '$'PARALLEL_SEQ

        echo "Done. Processing sliced demos."

    done

