#!/bin/bash

# Credit to assafmo for this update.sh script file
set -e
set -v

export KEYNAME=93F5DD2FC16991C7EA04BE56D41B4D8698494DBA

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

