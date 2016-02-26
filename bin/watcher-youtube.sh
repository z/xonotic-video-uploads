#!/bin/bash
# uploads ogv files to YouTube when Complete

source config/config.conf

inotifywait -m -e close_write -e moved_to -e create ${VIDEO_DIR} |
    while read path action file; do

        echo "-> $file"

        # You had a problem, so you used a regex...
    	name=$(echo $file | sed 's/capture-//;
                                s/[0-9-]*-\([0-9]*\)\.ogv/ - cap \1/;
                                s/_\([0-9]*\)_\( - cap\)/ - player \1\2/;
                                s/_/ /g;
                                s/ \([0-9]\{2\}\)-\([0-9]\{2\}\)/ \1:\2 -/;')

        echo "Uploading as: $name"

        # upload to youtube
        ./bin/upload-youtube.py --file="${path}${file}" \
                       --title="$name" \
                       --description="$YT_DESCRIPTION" \
                       --keywords="$YT_KEYWORDS" \
                       --category="$YT_CAT_ID" \
                       --privacyStatus="$YT_PRIVACY"
        
    done
