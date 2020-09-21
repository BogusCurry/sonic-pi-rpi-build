#!/bin/bash

# Unofficial Bash strict mode
set -euo pipefail
IFS=$'\n\t'


source config.bash


cd "${srcdir}"


# GUI executable
install -vDm 755 "app/gui/qt/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

# OSMID
install -vDm 755 app/gui/qt/external/osmid/build/*2* -t "${pkgdir}/usr/bin/"

# book
install -vDm 644 app/gui/qt/book/*.html \
  -t "${pkgdir}/usr/share/${pkgname}/book"

# i18n
install -vDm 644 app/gui/qt/lang/*.qm \
  -t "${pkgdir}/usr/share/${pkgname}/lang"

# help
install -vDm 644 app/gui/qt/help/*.html \
  -t "${pkgdir}/usr/share/${pkgname}/help"

# html
install -vDm 644 app/gui/qt/html/*.html \
  -t "${pkgdir}/usr/share/${pkgname}/html"

# images
install -vDm 644 app/gui/qt/images/*.png \
  -t "${pkgdir}/usr/share/${pkgname}/images"
install -vDm 644 app/gui/qt/images/coreteam/*.png \
  -t "${pkgdir}/usr/share/${pkgname}/images/coreteam"
install -vDm 644 app/gui/qt/images/toolbar/default/*.png \
  -t "${pkgdir}/usr/share/${pkgname}/images/toolbar/default"
install -vDm 644 app/gui/qt/images/toolbar/pro/*.png \
  -t "${pkgdir}/usr/share/${pkgname}/images/toolbar/pro"
install -vDm 644 etc/doc/images/tutorial/*.png \
  -t "${pkgdir}/usr/share/${pkgname}/images/tutorial"

# theme
install -vDm 644 app/gui/qt/theme/app.qss \
  -t "${pkgdir}/usr/share/${pkgname}/theme/"
install -vDm 644 app/gui/qt/theme/dark/doc-styles.css \
  -t "${pkgdir}/usr/share/${pkgname}/theme/dark"
install -vDm 644 app/gui/qt/theme/light/doc-styles.css \
  -t "${pkgdir}/usr/share/${pkgname}/theme/light"

# samples
install -vDm 644 etc/samples/*.{flac,md} \
  -t "${pkgdir}/usr/share/${pkgname}/samples"

# snippets
install -vDm 644 etc/snippets/fx/*.sps \
  -t "${pkgdir}/usr/share/${pkgname}/snippets/fx"
install -vDm 644 etc/snippets/live_loop/*.sps \
  -t "${pkgdir}/usr/share/${pkgname}/snippets/live_loop"
install -vDm 644 etc/snippets/syntax/*.sps \
  -t "${pkgdir}/usr/share/${pkgname}/snippets/syntax"

# synthdefs
install -vDm 644 etc/synthdefs/compiled/*.scsyndef \
  -t "${pkgdir}/usr/share/${pkgname}/synthdefs/compiled"
install -vDm 644 etc/synthdefs/designs/overtone/${pkgname}/*.clj\
  -t "${pkgdir}/usr/share/${pkgname}/synthdefs/designs/overtone/"
install -vDm 644 etc/synthdefs/designs/overtone/${pkgname}/src/sonic_pi/*.clj\
  -t "${pkgdir}/usr/share/${pkgname}/synthdefs/designs/overtone/sonic_pi/src"
install -vDm 644 etc/synthdefs/designs/overtone/${pkgname}/test/sonic_pi/*.clj\
  -t "${pkgdir}/usr/share/${pkgname}/synthdefs/designs/overtone/sonic_pi/test"

# buffers
install -vDm 644 etc/buffers/rand-stream.wav \
  -t "${pkgdir}/usr/share/${pkgname}/buffers"

# docs
install -vDm 644 etc/doc/cheatsheets/*.md \
  -t "${pkgdir}/usr/share/doc/${pkgname}/cheatsheets"

# pdfs
install -vDm 644 etc/synthdefs/graphviz/pdf/*.pdf \
  -t "${pkgdir}/usr/share/doc/${pkgname}/synthdefs"

# tutorial
install -vDm 644 etc/doc/tutorial/*.md \
  -t "${pkgdir}/usr/share/doc/${pkgname}/tutorial"

# examples
install -vDm 644 etc/examples/algomancer/*.rb \
  -t "${pkgdir}/usr/share/doc/${pkgname}/examples/algomancer"
install -vDm 644 etc/examples/apprentice/*.rb \
  -t "${pkgdir}/usr/share/doc/${pkgname}/examples/apprentice"
install -vDm 644 etc/examples/illusionist/*.rb \
  -t "${pkgdir}/usr/share/doc/${pkgname}/examples/illusionist"
install -vDm 644 etc/examples/incubation/*.rb \
  -t "${pkgdir}/usr/share/doc/${pkgname}/examples/incubation"
install -vDm 644 etc/examples/magician/*.rb \
  -t "${pkgdir}/usr/share/doc/${pkgname}/examples/magician"
install -vDm 644 etc/examples/sorcerer/*.rb \
  -t "${pkgdir}/usr/share/doc/${pkgname}/examples/sorcerer"
install -vDm 644 etc/examples/wizard/*.rb \
  -t "${pkgdir}/usr/share/doc/${pkgname}/examples/wizard"

# erlang
install -vDm 755 app/server/erlang/*.beam \
  -t "${pkgdir}/usr/lib/${pkgname}"

# ruby
install -vdm 755 "${pkgdir}/usr/share/${pkgname}"
cp -av app/server/ruby "${pkgdir}/usr/lib/${pkgname}/server"
rm -fv "${pkgdir}/usr/lib/${pkgname}/server/vendor/"*/ext/*.{o,c}
rm -fv "${pkgdir}/usr/lib/${pkgname}/server/vendor/"*/ext/*/*.{o,c}
rm -fv "${pkgdir}/usr/lib/${pkgname}/server/Rakefile"
rm -fv "${pkgdir}/usr/lib/${pkgname}/server/vendor/"*/Rakefile

# xdg
install -vDm 644 "../pkg/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
install -vDm 644 app/gui/qt/images/icon-smaller.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

# license
install -vDm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"


# Debian package info
install -vDm 644 ../debian/* -t "${pkgdir}/debian"
