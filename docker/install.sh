#!/bin/bash
set -e

apt-get update
apt-get install --yes libgtest-dev
apt-get install --yes cmake

cd /usr/src/gtest
cmake .
make
mv libg* /usr/lib

apt-get remove --yes cmake
