#!/usr/bin/env bash

# see: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -e # exit immediately if a pipeline returns a non-zero status
set -x # print a trace of simple commands

#yarn test-ci

mkdir -pv ./.build/hotels/android
mkdir -pv ./.build/hotels/ios

cp ./app/hotels/package.json ./.build/hotels/package.json
cp ./app/hotels/README.md ./.build/hotels/README.md

basicCommand="yarn react-native bundle --dev=false --verbose"

#$basicCommand \
#    --platform=ios \
#    --entry-file=./app/hotels/index.js \
#    --bundle-output=./.build/hotels/ios/hotels.ios.jsbundle \
#    --assets-dest ./.build/hotels/ios/
#
#$basicCommand \
#    --platform=android \
#    --entry-file=./app/hotels/index.js \
#    --bundle-output=./.build/hotels/android/hotels.android.jsbundle \
#    --assets-dest ./.build/hotels/android/

# TODO: bump version
npm publish ./.build/hotels --access public
cp ./.build/hotels/package.json ./app/hotels/package.json
