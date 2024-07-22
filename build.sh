#!/bin/bash
write="cp MICROBIT.hex /media/$USER/MICROBIT/"
customcopy=0

build()
{
    cd ./build-tools/
    python3 build.py
    cd ..
}

# default copy 
copy()
{
    cp -rf ./src/main.cpp ./build-tools/source/main.cpp
}

help()
{
    echo "Usage: build.sh [options]"
    echo "Options:"
    echo "  -f, --file           Specify a file to be built"
    echo "  -w, --write          Writes a built file to an attached micro:bit"
    echo "  -x, --force-build    Forces a build with the current main.cpp file in the build directory"
    echo "  -h, --help           Display this help message"
    exit 0
}

write()
{
    echo "Attempting to flash micro:bit"
    cd ./build-tools/
    $write
    if $write
    then
        printf "Successfully flashed micro:bit\n"
    else
        printf "Could not flash micro:bit, but .hex file has been built\n"
    fi
    cd ..
}

while [ -n "$1" ]; do
    case "$1" in
        -f | --file)
            if test -f "$2"; then
                cp -rf $2 ./build-tools/source/main.cpp
                build
            else
                printf "Invalid filename, check file name or location\n"
            fi
            ;;
        -w | --write)
            write
            ;;
        -h | --help)
            help
            ;;
        -x | --force-build)
            build
            ;;
        -*)
            echo "Invalid option: ./build.sh -h or --help for help"
            ;;
    esac
    shift 1
done