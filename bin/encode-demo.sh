#!/bin/bash
# Usage: ./encode-demo.sh <demo file> <Xfvb output>

source config/config.conf

demo_with_path=$1
demo=$(basename $demo_with_path)
name=${demo%.*}
output=$2

echo "Processing demo: $demo"

# Record the demo (the bottleneck)
echo ./bin/xonotic-headless.sh -w "$demo" $output
./bin/xonotic-headless.sh -w "$demo" $output

# rm $demo_with_path

echo "Moving video file: $demo"

VIDEO_FILE="${name}_000.ogv"

# echo mv "${RAW_VIDEO_DIR}${VIDEO_FILE}" "${VIDEO_DIR}${demo%.*}.ogv"
mv "${RAW_VIDEO_DIR}${VIDEO_FILE}" "${VIDEO_DIR}${name}.ogv"

echo "Done encoding."
