#!/bin/bash

cd /root/go/src/github.com/trackit/trackit-server
echo "===> fetching dependencies"
govendor sync -v

echo "===> compiling trackit server"
set -ex
rm -f ./server/main
if [[ ! -f "server/main" ]]
then
	pushd "server"
	./buildstatic.sh
	popd
fi
mv ./server/main /trackit-server
