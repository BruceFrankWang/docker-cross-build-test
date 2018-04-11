FROM arm32v7/debian:jessie

LABEL maintainer="Bruce Frank Wang <bruce.frank.wang@gmail.com>"

# Copy file <qemu-arm-static> into image </usr/bin>, to build this ARM Docker image
# on Travis CI or other amd64/i386 arch.
COPY bin/ /usr/bin/

RUN [ "cross-build-start" ]

RUN echo Asia/Shanghai > /etc/timezone && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN [ "cross-build-end" ]

CMD bash
