#!/bin/bash

#allows test execution
if [ -z $SERVICE_DIR ]; then
    export SCA_SERVICE_DIR=`pwd`
fi

export MATLABPATH=$SERVICE_DIR
nohup matlab -r main &
echo $! > pid
