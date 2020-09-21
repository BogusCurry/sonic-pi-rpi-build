#!/bin/bash

# Unofficial Bash strict mode
set -euo pipefail
IFS=$'\n\t'


source config.bash


cd "${pkgdir}"

set +e  # Fails w/ "clear-sign failed: No secret key" but should still work
dpkg-buildpackage -d -aarmhf
dpkg-buildpackage -d -aarm64
