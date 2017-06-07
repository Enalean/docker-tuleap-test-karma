#!/bin/bash

# loglevel warn lets us see what packages were installed as opposed to --quiet
install_environment(){
    npm install
    bower install --allow-root --loglevel=warn
}

configure_npm_registry(){
    if [ ! -z "$NPM_REGISTRY" ]; then
        npm config set registry "$NPM_REGISTRY"
    fi
    if [ ! -z "$NPM_USER" -a ! -z "$NPM_PASSWORD" -a ! -z "$NPM_EMAIL" ]; then
      ./npm-login.sh "$NPM_USER" "$NPM_PASSWORD" "$NPM_EMAIL"
    fi
}

readonly SOURCE_PATH='/tuleap';
readonly WORK_DIR="$(mktemp --directory)";
readonly TEST_REPORT='test-results.xml';

function copy_sources_to_workdir() {
    cp -Rf "$SOURCE_PATH/"* "$WORK_DIR"
}

set -e

options=`getopt -o h -l path:,output-dir: -- "$@"`

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

configure_npm_registry

# Run tests
if [ -n "$path" ]; then
    copy_sources_to_workdir
    cd $WORK_DIR/$path
    install_environment
    npm run test
else
    echo "You must specify --path argument"
    exit 1;
fi

if [ -n "$output_dir" ]; then
    mkdir -p $output_dir
    mv $WORK_DIR/$path/$TEST_REPORT $output_dir/
fi
