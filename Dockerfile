FROM python:3.6.4-alpine3.7

RUN addgroup -g 1000 -S docker \
  && adduser -u 1000 -g docker -S docker \
  && mkdir -p /usr/src/app

RUN apk update \
  && apk --no-cache add lapack \
  && apk --no-cache add --virtual .build-deps \
    g++ \
    gcc \
    gfortran \
    lapack-dev

COPY requirements.txt /usr/src/app/

RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt \
  && apk del .build-deps

COPY --chown=docker:docker . /usr/src/app

WORKDIR /usr/src/app

USER docker
