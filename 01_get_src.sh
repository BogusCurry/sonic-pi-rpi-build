#!/bin/bash

# Unofficial Bash strict mode
set -euo pipefail
IFS=$'\n\t'


source config.bash

tar_filename="${pkgname}-${pkgver}.tar.gz"

wget "https://github.com/sonic-pi-net/sonic-pi/archive/v${pkgver}.tar.gz" -O "${tar_filename}"
tar xvf "${tar_filename}"
rm "${tar_filename}"
