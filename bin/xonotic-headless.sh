#!/bin/bash
# Usage: ./xonotic-headless.sh <demo file>

source config/config.conf

echo "Running Xonotic..."

echo cd ${ENGINE_PATH}

cd ${ENGINE_PATH}

if [[ "$1" == "-w" ]]; then

    echo xinit ./${ENGINE_BIN} run -simsound -sessionid client -userdir "$USER_DIR" +playdemo "${RELATIVE_WORKING_DIR}sliced/$2" -- /usr/bin/Xvfb :1 -screen 0 1920x1080x16 +extension RENDER

    xinit ./${ENGINE_BIN} run -simsound -sessionid client -userdir "$USER_DIR" +playdemo "${RELATIVE_WORKING_DIR}sliced/$2" -- /usr/bin/Xvfb :1 -screen 0 1920x1080x16 +extension RENDER

    cd -

elif [[ "$1" == "-d" ]]; then

    echo xinit ./${ENGINE_BIN} run -simsound -sessionid client -userdir "$USER_DIR" +playdemo "$2" -- /usr/bin/Xvfb :1 -screen 0 1920x1080x16 +extension RENDER

    xinit ./${ENGINE_BIN} run -simsound -sessionid client -userdir "$USER_DIR" +playdemo "$2" -- /usr/bin/Xvfb :1 -screen 0 1920x1080x16 +extension RENDER

    cd -

else
    echo "No parameter. Use either -w or -d"
    cd -
    exit 1
fi
