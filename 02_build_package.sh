#!/bin/bash

# Unofficial Bash strict mode
set -euo pipefail
IFS=$'\n\t'

source config.bash

cd "${srcdir}"

rm -rf ./debian || true
cp -r ../debian .

sudo apt install -y devscripts
sudo mk-build-deps \
	--install \
	--tool='apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends --yes' \
	--remove debian/control

set +e # Fails w/ "clear-sign failed: No secret key" but should still work
dpkg-buildpackage -d -aarmhf
dpkg-buildpackage -d -aarm64
