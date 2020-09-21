#!/bin/bash

# Unofficial Bash strict mode
set -euo pipefail
IFS=$'\n\t'


source config.bash


cd "${srcdir}"
(
  # Compile erlang - OSC and pi_server
  cd app/server/erlang
  erlc {osc,pi_server}.erl
)

(
  # Compile ruby extensions
  cd app/server/ruby/bin
  ./compile-extensions.rb
  ./i18n-tool.rb -t
)

(
  # OSMID
  cd app/gui/qt/external/osmid/

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -S .
  make -j$(nproc) VERBOSE=1 -C build
)

(
  # GUI
  cd app/gui/qt/

  # Generate help template
  cp -vf utils/ruby_help.{tmpl,h}
  ../../server/ruby/bin/qt-doc.rb -o utils/ruby_help.h

  # Generate translations
  lrelease lang/*.ts

  # Compile GUI
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -S .
  make -j$(nproc) VERBOSE=1 -C build
)
