#!/bin/bash

# Unofficial Bash strict mode
set -euo pipefail
IFS=$'\n\t'

source config.bash

if [[ ! -f "${pkgname}_${pkgver}.orig.tar.gz" ]]; then
	wget "https://github.com/sonic-pi-net/sonic-pi/archive/v${pkgver}.tar.gz" \
		-O "${pkgname}_${pkgver}.orig.tar.gz"
fi

if [[ ! -d "${srcdir}" ]]; then
	tar xvf "${pkgname}_${pkgver}.orig.tar.gz"
	mv sonic-pi-3.2.2 "${srcdir}"
fi
