#!/bin/bash

# Unofficial Bash strict mode
set -euo pipefail
IFS=$'\n\t'


source config.bash


cd "${srcdir}"
# patch app/server/ruby/lib/sonicpi/util.rb to set proper paths to external components
# NOTE: this can only be done after running
# app/server/ruby/bin/compile-extensions.rb, as ruby-wavefile uses a
# hardcoded location of a file
patch -Np1 -i "../patches/ruby_paths.patch"
