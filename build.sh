#/bin/bash

set -e

# Designed to be run within MSYS on Windows

#git clone --branch release-1.10.0 https://github.com/google/googletest.git
cd googletest
rm -r build
mkdir build
cd build

cmake ../ -G "MSYS Makefiles"
make -j
