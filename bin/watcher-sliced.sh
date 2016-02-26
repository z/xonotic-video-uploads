#!/bin/bash
# copies "cut" demos to the Encoding Server when complete

source config/config.conf

echo ${WORKING_DIR}${MARKED_DIR}

inotifywait -m -e close_write -e moved_to -e create --format '%w%f' ${WORKING_DIR}${MARKED_DIR} | \
    parallel -u ./bin/encode-demo.sh {} '$'PARALLEL_SEQ
