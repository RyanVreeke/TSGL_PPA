#!/bin/bash

# Credit to assafmo for this update.sh script file
set -e
set -v

export KEYNAME=6C90E5D341B40FEDBCFD715460546F83CDE8DB2C

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

