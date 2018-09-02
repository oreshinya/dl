#!/usr/bin/env bash

docker build \
  --build-arg user=$(id -un) \
  --build-arg uid=$(id -u) \
  -t dlfs2 .

docker run --rm -ti \
  --user=$(id -u) \
  -v `pwd`:/app \
  -v /etc/group:/etc/group:ro \
  -v /etc/passwd:/etc/passwd:ro \
  -v /etc/shadow:/etc/shadow:ro \
  -v /etc/sudoers.d:/etc/sudoers.d:ro \
  dlfs2 \
  bash -l
