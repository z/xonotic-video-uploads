#!/bin/bash
# Usage: ./xonotic-headless.sh <demo file>

source config.conf

DISPLAY=:1.0

echo "Running Xonotic..."

echo cd ${ENGINE_PATH}
echo ./all run -userdir "$USER_DIR" +playdemo "${RELATIVE_WORKING_DIR}sliced/$1"

cd ${ENGINE_PATH}
./all run -userdir "$USER_DIR" +playdemo "${RELATIVE_WORKING_DIR}sliced/$1"
cd -
