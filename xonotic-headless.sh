#!/bin/bash
# Usage: ./xonotic-headless.sh <demo file>

source config/config.conf

echo "Running Xonotic..."

echo cd ${ENGINE_PATH}
echo xinit ./${ENGINE_BIN} run -sessionid client -userdir "$USER_DIR" +playdemo "${RELATIVE_WORKING_DIR}sliced/$1" -- /usr/bin/Xvfb :1 -screen 0 1920x1080x16 +extension GLX +extension XRANDR +extension RENDER

cd ${ENGINE_PATH}
xinit ./${ENGINE_BIN} run -sessionid client -userdir "$USER_DIR" +playdemo "${RELATIVE_WORKING_DIR}sliced/$1" -- /usr/bin/Xvfb :1 -screen 0 1920x1080x16 +extension GLX +extension XRANDR +extension RENDER
cd -
