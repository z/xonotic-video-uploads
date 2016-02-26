#!/bin/bash
# Usage: ./xonotic-headless.sh <demo file>

source config/config.conf

param=$1
demo=$2
name=${demo%.*}
output=$3

echo "Running Xonotic..."

echo cd ${ENGINE_PATH}
cd ${ENGINE_PATH}

if [[ "$param" == "-w" ]]; then

    echo xinit ./${ENGINE_BIN} run -simsound -nostdout -sessionid client-$output -userdir "${USER_DIR}" +cl_capturevideo_nameformat "${name}_" +cl_capturevideo_number "0" +playdemo "${RELATIVE_WORKING_DIR}${MARKED_DIR}${demo}" -- /usr/bin/Xvfb :${output} -screen 0 1920x1080x16 +extension RENDER

    xinit ./${ENGINE_BIN} run -simsound -nostdout -sessionid client-$output -userdir "${USER_DIR}" +cl_capturevideo_nameformat "${name}_" +cl_capturevideo_number "0" +playdemo "${RELATIVE_WORKING_DIR}${MARKED_DIR}${demo}" -- /usr/bin/Xvfb :${output} -screen 0 1920x1080x16 +extension RENDER

    cd -

elif [[ "$param" == "-d" ]]; then

    echo xinit ./${ENGINE_BIN} run -simsound -nostdout -sessionid client -userdir "${USER_DIR}" +cl_capturevideo_nameformat "${name}_" +cl_capturevideo_number "0" +playdemo "$demo" -- /usr/bin/Xvfb :$output -screen 0 1920x1080x16 +extension RENDER

    xinit ./${ENGINE_BIN} run -simsound -nostdout -sessionid client -userdir "$USER_DIR" +cl_capturevideo_nameformat "${name}_" +cl_capturevideo_number "0" +playdemo "$demo" -- /usr/bin/Xvfb :$output -screen 0 1920x1080x16 +extension RENDER

    cd -

else
    echo "No parameter. Use either -w or -d"
    cd -
    exit 1
fi
