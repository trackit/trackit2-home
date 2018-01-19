#!/bin/bash

echo "===> updating git submodules"
git submodule add --force https://github.com/trackit/trackit2-client trackit2-client
git submodule add --force https://github.com/trackit/trackit2 trackit2
git submodule update --recursive --remote
