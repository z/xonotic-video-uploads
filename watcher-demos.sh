#!/bin/bash
# copies demos to the Processing Server when complete.

source config.conf

inotifywait -m $DEMO_DIR -e close_write -e moved_to |
    while read path action file; do

        echo "-> $file"

#	scp "${path}${file}" encoding-server:~/watched_dir
        mv "${path}${file}" "$WORKING_DIR"

    done
