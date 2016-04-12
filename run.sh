#!/bin/bash

install_environment(){
    npm install
    bower install --allow-root --config.interactive=false
}

BASE_PATH="/tuleap";
TEST_REPORT="test-results.xml";

set -e

options=`getopt -o h -l path:,output-dir:,build: -- "$@"`

eval set -- "$options"

while true
do
    case "$1" in
	--path)
	    path=$2;
	    shift 2;;
    --output-dir)
        output_dir=$2;
        shift 2;;
    --build)
        spec_file=$2;
        shift 2;;
	--)
	    shift 1; break ;;
	*)
	    break ;;
    esac
done

if [ -z "$output_dir" ]; then
    echo "You must specify an output dir argument";
    exit 1;
fi

# Run tests
if [ -n "$path" ]; then
    cd $BASE_PATH/$path
    install_environment
    npm run test
else
    echo "You must specify --path argument"
    exit 1;
fi

# Build rpm
if [ -n "$spec_file" ]; then
    plugin_base=$BASE_PATH/$path/../../..
    if [ -f $plugin_base/Makefile -a -f $plugin_base/$spec_file ]; then
        make -C $BASE_PATH less
        make -C $plugin_base RPM_TMP=$output_dir/packages
    fi
fi

if [ -n "$output_dir" ]; then
    mkdir -p $output_dir
    mv $BASE_PATH/$path/$TEST_REPORT $output_dir/
fi
