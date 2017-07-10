FROM       cyberdojofoundation/gpp-5.3
MAINTAINER Byran Wills-Heath <byran@adgico.co.uk>

# install clang++
ENV CXX=clang++ CC=clang
ARG VERSION=3.8.0
RUN wget http://llvm.org/releases/${VERSION}/clang+llvm-${VERSION}-x86_64-linux-gnu-ubuntu-14.04.tar.xz
RUN tar -xvf clang+llvm-${VERSION}-x86_64-linux-gnu-ubuntu-14.04.tar.xz
RUN  cp -r clang+llvm-${VERSION}-x86_64-linux-gnu-ubuntu-14.04/* /usr/
# Make clang the default compiler
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100
# Clean up to make the image smaller
RUN rm -rf clang+llvm-${VERSION}-x86_64-linux-gnu-ubuntu-14.04
RUN rm -f clang+llvm-${VERSION}-x86_64-linux-gnu-ubuntu-14.04.tar.xz

# Install googletest
RUN apt-get update
RUN apt-get install -y libgtest-dev cmake
WORKDIR /usr/src/gtest
RUN cmake .
RUN make
RUN mv libg* /usr/lib
# Remove cmake as it's no longer needed to make the image smaller
RUN apt-get remove -y cmake

COPY red_amber_green.rb /usr/local/bin

