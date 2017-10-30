#!/bin/bash

readonly SOURCE_PATH='/sources';
readonly OUTPUT_DIR='/output';
readonly TEST_REPORT='test-results.xml';

set -e

options=`getopt -o h -l path:,output-dir: -- "$@"`

eval set -- "$options"

while true
do
    case "$1" in
    --path)
        path=$2;
        shift 2;;
    --)
        shift 1; break ;;
    *)
        break ;;
    esac
done

# Run tests
if [ -n "$path" ]; then
    cd "$SOURCE_PATH/$path"
    REPORT_OUTPUT_FOLDER="$OUTPUT_DIR" npm run test
else
    echo "You must specify --path argument"
    exit 1;
fi
