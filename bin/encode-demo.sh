#!/bin/bash
# Usage: ./encode-demo.sh <demo file> <Xfvb output>

source config/config.conf

demo_with_path=$1
demo=$(basename $demo_with_path)
output=$2

echo "Processing demo: $demo"

# Record the demo (the bottleneck)
./bin/xonotic-headless.sh -w "$demo" $screen &>/dev/null

mv $demo_with_path ${WORKING_DIR}archived/

# Move capture-*.ogv to VIDEO_DIR -- TODO improve this

#LAST_FILE=$(ls -Art "$RAW_VIDEO_DIR" | tail -n 1)
LAST_FILE=$(find ${RAW_VIDEO_DIR} -type f -name "*.ogv" -printf "%T@ %Tc %p\n" | sort -nr |head -n1 | awk '{ print $9 }')

echo "Moving Last Video File: $LAST_FILE"

#echo mv "${RAW_VIDEO_DIR}${LAST_FILE}" "${VIDEO_DIR}${demo%.*}.ogv"
mv "${LAST_FILE}" "${VIDEO_DIR}${demo%.*}.ogv"

echo "Done."
