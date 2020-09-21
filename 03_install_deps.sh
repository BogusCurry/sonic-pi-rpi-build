#!/bin/bash

# Unofficial Bash strict mode
set -euo pipefail
IFS=$'\n\t'


sudo apt install -y ruby-dev ruby-activesupport ruby-bundler ruby-ffi \
  ruby-i18n ruby-kramdown ruby-minitest ruby-mocha ruby-rouge ruby-rugged \
  sc3-plugins sox supercollider cmake erlang-nox git wkhtmltopdf libaubio-dev \
  ruby-multi-json qttools5-dev-tools libqt5svg5-dev qt5-default \
  libqscintilla2-qt5-dev debhelper \
  g++ ruby ruby-dev pkg-config git build-essential libjack-jackd2-dev \
  libsndfile1-dev libasound2-dev libavahi-client-dev libicu-dev \
  libreadline6-dev libfftw3-dev libxt-dev libudev-dev cmake \
  libqt5svg5-dev qt5-qmake qt5-default \
  qttools5-dev qttools5-dev-tools qtdeclarative5-dev libqt5webkit5-dev \
  qtpositioning5-dev libqt5sensors5-dev libqt5opengl5-dev qtmultimedia5-dev libffi-dev \
  curl python erlang-base libssl-dev libaubio5 supercollider-server sc3-plugins-server compton
