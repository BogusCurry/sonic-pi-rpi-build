# Debian package build process for Sonic Pi

## Sources
Much of this process was taken from the [Arch Linux community package](https://aur.archlinux.org/packages/sonic-pi-git/).
Some of it was taken from already available Sonic Pi [Debian packages for Raspberry Pi](http://archive.raspberrypi.org/debian/pool/main/s/sonic-pi/).
Guidance was provided by Robin Newman, who created a ['community version' of Sonic Pi](https://in-thread.sonic-pi.net/t/v3-2-2-for-raspberry-pi-os-now-available/3976) of v3.2.2 that works on Raspberry Pi OS.


### TODO
* devendor boost from GUI components (only headers required during build time)
* devendor ruby-ast
* devendor ruby-atomic (bin)
* devendor ruby-benchmark-ips
* devendor ruby-blankslate
* devendor ruby-did_you_mean (bin)
* devendor ruby-fast_osc (bin)
* devendor ruby-gettext
* devendor ruby-hamster
* devendor ruby-interception (bin)
* devendor ruby-locale
* devendor ruby-memoist
* devendor ruby-metaclass
* devendor ruby-parser
* devendor ruby-parslet
* devendor ruby-rubame
* devendor ruby-aubio-prerelease
* devendor ruby-beautify
* devendor ruby-text
* devendor ruby-thread_safe
* devendor ruby-wavefile
* devendor ruby-websocket
* move stage 5 patch to stage 2

Note - the following are not packages available on Debian:
* ruby-did_you_mean
* ruby-fast_osc
* ruby-interception
* ruby-rubame
* ruby-aubio-prerelease
* ruby-thread_safe
