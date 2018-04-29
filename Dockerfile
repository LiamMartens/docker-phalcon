FROM liammartens/php
LABEL maintainer="Liam Martens <hi@liammartens.com>"

# @user Switch back to root user
USER root

# @run Install Phalcon
RUN apk add --update php${PHPV}-dev make autoconf \
                gcc pcre-dev git g++ alpine-sdk
RUN git clone --single-branch git://github.com/phalcon/cphalcon.git
RUN cd cphalcon/build && ./install
RUN apk del php${PHPV}-dev make autoconf gcc pcre-dev g++ alpine-sdk && \
    rm -rf cphalcon

# @copy files
COPY .docker ${DOCKER_DIR}/

# @run own it
RUN own

# @user Back to non-root user
USER ${USER}