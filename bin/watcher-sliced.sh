#!/bin/bash
# copies "cut" demos to the Encoding Server when complete

source config/config.conf

inotifywait -m -e close_write -e moved_to --format '%w%f' ${WORKING_DIR}sliced/ | \
    parallel -u ./bin/encode-demo.sh {} '$'PARALLEL_SEQ
