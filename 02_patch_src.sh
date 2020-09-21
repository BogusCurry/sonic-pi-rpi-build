#!/bin/bash

# Unofficial Bash strict mode
set -euo pipefail
IFS=$'\n\t'


source config.bash


cd "${srcdir}"

# patch app/gui/qt/{model/sonicpitheme,mainwindow}.cpp to set path to
# external components in /usr/{lib,share}/sonic-pi
patch -Np1 -i "../patches/gui_paths.patch"

# enable Raspberry Pi transparency
patch -Np1 -i "../patches/rpi_transparency.patch"

# see files in the load/save dialog window
# (white on a white background)
patch -Np1 -i "../patches/rpi_color_fix.patch"

# add 8GB RPi encoding
patch -Np1 -i "../patches/rpi_8gb_encoding.patch"

# fix error line numbers
patch -Np1 -i "../patches/rpi_error_line_numbers.patch"

# devendor qscintilla-qt5: https://github.com/samaaron/sonic-pi/issues/2278
patch -Np1 -i "../patches/devendor_qscintilla-qt5.patch"

# E: Unable to locate package ruby-did_you_mean
# E: Unable to locate package ruby-fast_osc
# E: Unable to locate package ruby-interception
# E: Unable to locate package ruby-rubame
# E: Unable to locate package ruby-aubio-prerelease
# E: Unable to locate package ruby-thread_safe

# TODO: devendor boost from GUI components (only headers required during
# build time)
#TODO: devendor ruby-ast
#TODO: devendor ruby-atomic (bin)
#TODO: devendor ruby-benchmark-ips
#TODO: devendor ruby-blankslate
#TODO: devendor ruby-did_you_mean (bin)
#TODO: devendor ruby-fast_osc (bin)
#TODO: devendor ruby-gettext
#TODO: devendor ruby-hamster
#TODO: devendor ruby-interception (bin)
#TODO: devendor ruby-locale
#TODO: devendor ruby-memoist
#TODO: devendor ruby-metaclass
#TODO: devendor ruby-parser
#TODO: devendor ruby-parslet
#TODO: devendor ruby-rubame
#TODO: devendor ruby-aubio-prerelease
#TODO: devendor ruby-beautify
#TODO: devendor ruby-text
#TODO: devendor ruby-thread_safe
#TODO: devendor ruby-wavefile
#TODO: devendor ruby-websocket

# devendor gems requiring compilation:
# ffi, ruby-prof, rugged
sed -e '/rugged/d' \
    -e '/ffi/d' \
    -e '/ruby-prof/d' \
    -i app/server/ruby/bin/compile-extensions.rb

# remove unrequired gems, so we don't create any doc for them
rm -rvf app/server/ruby/vendor/{activesupport,ffi,i18n,kramdown,minitest,mocha,multi_json,rouge,rugged,sys-proctable}*
rm -rvf app/server/ruby/vendor/{narray,ruby-coreaudio,ruby-prof,rake-compiler}*

# Remove unused directory from source
rm -rvf app/server/native
