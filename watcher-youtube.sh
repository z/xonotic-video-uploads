#!/bin/bash
# uploads ogv files to YouTube when Complete

# TODO find config
source config.conf

inotifywait -m $VIDEO_DIR -e create -e moved_to |
    while read path action file; do

        echo "The file '$file' appeared in directory '$path' via '$action'"

        # upload to youtube
        ./upload.py --file="${path}${file}" \
                       --title="$file" \
                       --description="testing upload" \
                       --keywords="xonotic" \
                       --category="22" \
                       --privacyStatus="private"
        

    done
