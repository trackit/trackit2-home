#!/bin/bash

./scripts/check_mmap.sh
if [[ $? -gt 0 ]]
then
  exit 1
fi

./scripts/update_submodules.sh
pushd "scripts"
./compile_server.sh
popd
mv -f ./main ./trackit2/docker/server

echo "===> pulling the docker containers"
./trackit2/scripts/awsenv default docker-compose pull
echo "===> building containers"
./trackit2/scripts/awsenv default docker-compose build
echo "===> starting trackit"
./trackit2/scripts/awsenv default docker-compose up -d

if [[ $(docker ps | grep "trackit_" | wc -l) -lt 4 ]]
then
  echo "An error occured while starting TrackIt"
  exit 1
fi
echo "===> installation completed, TrackIt is now running on port 80"
