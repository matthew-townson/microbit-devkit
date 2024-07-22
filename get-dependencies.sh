#! /bin/bash
git clone https://github.com/lancaster-university/microbit-v2-samples.git build-tools
wait
./build.sh -x
wait
rm -rf ./build-tools/.git
rm -rf ./build-tools/.github
rm ./build-tools/.gitignore