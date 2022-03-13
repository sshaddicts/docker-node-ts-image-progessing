FROM node:16-alpine

USER root

ENV HOME=/app

WORKDIR $HOME

RUN apk add --update make \
        python3 \
        g++ \
        build-base \
        cairo-dev \
        jpeg-dev \
        pango-dev \
        musl-dev \
        giflib-dev \
        pixman-dev \
        pangomm-dev \
        libjpeg-turbo-dev \
        freetype-dev && \
    rm -rf /var/cache/apk/* && \
    npm update && \
    npm i -g typescript ts-node

ENTRYPOINT ["ts-node", "--transpile-only"]