FROM       cyberdojofoundation/clangplusplus:4.0.0
MAINTAINER Byran Wills-Heath <byran@adgico.co.uk>

RUN apt-get update
RUN apt-get install --yes libgtest-dev
RUN apt-get install --yes cmake

RUN cd /usr/src/gtest && cmake .
RUN cd /usr/src/gtest && make
RUN cd /usr/src/gtest && mv libg* /usr/lib

COPY red_amber_green.rb /usr/local/bin

