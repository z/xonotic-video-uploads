#!/bin/bash
# copies demos to the Processing Server when complete.

source config.conf

inotifywait -m $DEMO_DIR -e create -e moved_to |
    while read path action file; do

        echo "The file '$file' appeared in directory '$path' via '$action'"

        echo $WORKING_DIR

        mv "${path}${file}" "$WORKING_DIR"

    done
