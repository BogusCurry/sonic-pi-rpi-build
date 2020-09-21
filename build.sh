#!/bin/bash

# Unofficial Bash strict mode
set -euo pipefail
IFS=$'\n\t'


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source config.bash


"${DIR}/01_get_src.sh"
"${DIR}/02_patch_src.sh"
"${DIR}/03_install_deps.sh"
"${DIR}/04_compile_src.sh"
"${DIR}/05_late_temp_patch.sh"
"${DIR}/06_prepare_package.sh"
"${DIR}/07_build_package.sh"
