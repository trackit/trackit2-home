#!/bin/bash

echo "===> building intermediate container for server compilation"

docker build -t server_compiler -f ../compiler/Dockerfile ..
docker_id=$(docker images -q server_compiler)
docker run -v "$(dirname $PWD)":/trackit-server $docker_id
