#!/bin/sh

# build
apk --update add git build-base
git clone https://github.com/sass/sassc
cd sassc
git checkout 3.2.0-beta.5
git clone https://github.com/sass/libsass
cd libsass
git checkout 3.2.0-beta.5
cd ..
SASS_LIBSASS_PATH=/sassc/libsass make

# install
mv bin/sassc /usr/bin/sassc

# cleanup
cd /
rm -rf /sassc
apk del git build-base
apk add libstdc++
rm -rf /var/cache/apk/*
