#!/bin/bash
# Usage: ./xonotic-headless.sh <demo file>

source config/config.conf

output=$3

echo "Running Xonotic..."

echo cd ${ENGINE_PATH}
cd ${ENGINE_PATH}

if [[ "$1" == "-w" ]]; then

    echo xinit ./${ENGINE_BIN} run -simsound -sessionid client-$output -userdir "$USER_DIR" +cl_capturevideo_nameformat "job-"$(date +%s)"-$output-" +playdemo "${RELATIVE_WORKING_DIR}sliced/$2" -- /usr/bin/Xvfb :$output -screen 0 1920x1080x16 +extension RENDER

    xinit ./${ENGINE_BIN} run -simsound -sessionid client-$output -userdir "$USER_DIR" +cl_capturevideo_nameformat "job-"$(date +%s)"-$output-" +playdemo "${RELATIVE_WORKING_DIR}sliced/$2" -- /usr/bin/Xvfb :$output -screen 0 1920x1080x16 +extension RENDER

    sleep 1

    cd -

elif [[ "$1" == "-d" ]]; then

    echo xinit ./${ENGINE_BIN} run -simsound -sessionid client -userdir "$USER_DIR" +cl_capturevideo_nameformat "job-"$(date +%s)"-$output-" +playdemo "$2" -- /usr/bin/Xvfb :$output -screen 0 1920x1080x16 +extension RENDER

    xinit ./${ENGINE_BIN} run -simsound -sessionid client -userdir "$USER_DIR" +cl_capturevideo_nameformat "job-"$(date +%s)"-$output-" +playdemo "$2" -- /usr/bin/Xvfb :$output -screen 0 1920x1080x16 +extension RENDER

    cd -

else
    echo "No parameter. Use either -w or -d"
    cd -
    exit 1
fi
