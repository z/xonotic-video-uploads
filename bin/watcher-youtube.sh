#!/bin/bash
# uploads ogv files to YouTube when Complete

source config/config.conf

inotifywait -m $VIDEO_DIR -e close_write -e moved_to |
    while read path action file; do

        echo "-> $file"

    	name=$(echo $file | sed 's/capture-//g;s/_/ - /g;
                            s/- [0-9]\{1,3\}-[0-9]\{1,3\}-[0-9]\{1,3\}-\{1,3\}[0-9]\{1,3\}-[0-9]\{4,7\}-[0-9]\{1,3\}.ogv//g;
                            s/- \([0-9]\{1,3\}\)-\([0-9]\{1,3\}\) -/\1:\2 -/')

        # upload to youtube
        ./bin/upload-youtube.py --file="${path}${file}" \
                       --title="$name" \
                       --description="This file was automatically uploaded when a flag capture was discovered by the server" \
                       --keywords="xonotic" \
                       --category="22" \
                       --privacyStatus="private"
        
    done
