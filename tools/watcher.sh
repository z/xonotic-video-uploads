#!/bin/bash
DEMO_DIR=~/.xonotic/data/sv_autodemos/
WORKING_DIR=~/.xonotic/data/records/working/
SYNC_DIR=~/.xonotic/data/records/sync
inotifywait -m $DEMO_DIR -e create -e moved_to |
    while read path action file; do
        echo "The file '$file' appeared in directory '$path' via '$action'"
        # Process all records
        # Move all capture-*.dem files to SYNC_DIR
    done
