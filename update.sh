#!/bin/bash

# Credit to assafmo for this update.sh script file
set -e
set -v

export KEYNAME=894DA3E9EF8335101F9C041C479E75405454AF3F

(
    set -e
    set -v

    cd ./tsgl/

    # Packages & Packages.gz
    dpkg-scanpackages --multiversion . > Packages
    gzip -k -f Packages

    # Release, Release.gpg & InRelease
    apt-ftparchive release . > Release
    gpg --default-key "${KEYNAME}" -abs -o - Release > Release.gpg
    gpg --default-key "${KEYNAME}" --clearsign -o - Release > InRelease
)

