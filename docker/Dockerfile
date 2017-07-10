FROM       cyberdojofoundation/gpp-5.3
MAINTAINER Byran Wills-Heath <byran@adgico.co.uk>

ENV CXX=clang++ CC=clang

RUN wget http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
RUN tar -xvf clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
RUN  cp -r clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04/* /usr/
# Make clang the default compiler
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100
# Clean up to make the image smaller
RUN rm -rf clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04
RUN rm -f clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz



RUN apt-get update
RUN apt-get install -y libgtest-dev cmake

#export CXX=clang++
#export CC=clang

WORKDIR /usr/src/gtest
RUN cmake .
RUN make
RUN mv libg* /usr/lib

# Remove cmake as it's no longer needed to make the image smaller
RUN apt-get remove -y cmake






#RUN apt-get update
#RUN apt-get install --yes libgtest-dev
#RUN apt-get install --yes cmake

#RUN cd /usr/src/gtest && cmake .
#RUN cd /usr/src/gtest && make
#RUN cd /usr/src/gtest && mv libg* /usr/lib

COPY red_amber_green.rb /usr/local/bin

