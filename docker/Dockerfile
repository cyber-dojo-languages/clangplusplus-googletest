FROM  cyberdojofoundation/clangplusplus:4.0.0
LABEL maintainer=byran@adgico.co.uk

ADD install.sh /

RUN /install.sh && \
    rm -f /install.sh

COPY red_amber_green.rb /usr/local/bin

