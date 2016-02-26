#!/bin/bash
# copies "cut" demos to the Encoding Server when complete

source config/config.conf

inotifywait -m -e close_write -e moved_to -e create --format '%w%f' ${WORKING_DIR} | \
        parallel -u ./bin/demotc-ctf-record-extractor.sh {} new

