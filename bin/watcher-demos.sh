#!/bin/bash
# copies demos to the Processing Server when complete.

source config/config.conf

inotifywait -m -e close_write -e moved_to ${DEMO_DIR} | 
    while read path action file; do

        echo "-> $file"

        # Set $ENCODING_SERVER in config.conf (should match entry in ~/.ssh/config)
        # scp "${path}${file}" ${ENCODING_SERVER}:${WORKING_DIR}
        mv "${path}${file}" "${WORKING_DIR}"

    done
