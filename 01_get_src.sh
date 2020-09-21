#!/bin/bash

# Unofficial Bash strict mode
set -euo pipefail
IFS=$'\n\t'


source config.bash

wget "https://github.com/sonic-pi-net/sonic-pi/archive/v${pkgver}.tar.gz" \
  -O "${pkgname}_${pkgver}.orig.tar.gz"
