#!/bin/bash
if [ -f finished ]; then
    code=`cat finished`
    if [ $code -eq 0 ]; then
        echo "finished successfully"
        exit 1 #success!
    else
        echo "finished with code:$code"
        exit 2 #failed
    fi
fi

if [ -f pid ]; then
    kill -0 `cat pid` 2> /dev/null
    if [ $? -eq 0 ]; then
        echo "running"
        exit 0
    else
        echo "stopped running before finishing"
        exit 2
    fi
fi

echo "can't determine status - maybe not yet started"
exit 3
