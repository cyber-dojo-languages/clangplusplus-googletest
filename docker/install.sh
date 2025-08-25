#!/bin/bash -Eeu

# From https://gist.github.com/Cartexius/4c437c084d6e388288201aadf9c8cdd5

apt-get install --yes \
  cmake \
  libgtest-dev

mkdir -p $HOME/build
cd $HOME/build
cmake /usr/src/googletest/googletest
make
cp lib/libgtest* /usr/lib/
cd ..
rm -rf build
mkdir /usr/local/lib/googletest
ln -s /usr/lib/libgtest.a /usr/local/lib/googletest/libgtest.a
ln -s /usr/lib/libgtest_main.a /usr/local/lib/googletest/libgtest_main.a

apt-get remove --yes cmake
