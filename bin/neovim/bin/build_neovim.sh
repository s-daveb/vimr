#!/bin/bash
set -Eeuo pipefail

readonly clean=${clean:?"true or false"}
readonly NVIM_BUILD_TYPE=${NVIM_BUILD_TYPE:-"Release"}
readonly gettext_version="0.22.5"
readonly gettext_url="https://ftp.gnu.org/pub/gnu/gettext/gettext-${gettext_version}.tar.gz"
declare temp_dir; temp_dir="$(mktemp -d)"; readonly temp_dir
readonly gettext_install_dir="${temp_dir}/universal"

build_gettext() {
  local -r -x MACOSX_DEPLOYMENT_TARGET=$1

  pushd "${temp_dir}" >/dev/null
    curl -L "${gettext_url}" -o gettext.tar.gz
    tar -xzf gettext.tar.gz

    mkdir universal

    pushd "./gettext-${gettext_version}" >/dev/null
      ./configure \
        CC="gcc -arch x86_64 -arch arm64" \
        CXX="g++ -arch x86_64 - arch arm64" \
        CPP="gcc -E" \
        CXXCPP="g++ -E" \
        --prefix "${gettext_install_dir}" \
        --disable-silent-rules \
        --with-included-glib \
        --with-included-libcroco \
        --with-included-libunistring \
        --with-included-libxml \
        --without-emacs \
        --disable-java \
        --disable-csharp \
        --without-git \
        --without-cvs \
        --without-xz

      make
      make install
    popd >/dev/null
  popd >/dev/null
}

build_neovim() {
  # slightly modified version of /Neovim/.github/scripts/build_universal_macos.sh
  local -r -x MACOSX_DEPLOYMENT_TARGET=$1
  local -r -x SDKROOT=$(xcrun --sdk macosx --show-sdk-path)

  # Brew's gettext does not get sym-linked to PATH
  export PATH="/opt/homebrew/opt/gettext/bin:/usr/local/opt/gettext/bin:${PATH}"

  cmake -S cmake.deps -B .deps -G Ninja \
    -D CMAKE_BUILD_TYPE="${NVIM_BUILD_TYPE}" \
    -D CMAKE_OSX_DEPLOYMENT_TARGET="${MACOSX_DEPLOYMENT_TARGET}" \
    -D CMAKE_OSX_ARCHITECTURES=arm64\;x86_64 \
    -D CMAKE_FIND_FRAMEWORK=NEVER
  cmake --build .deps

  # See https://matrix.to/#/!cylwlNXSwagQmZSkzs:matrix.org/$WxndooGmUtD0a4IqjnALvZ_okHw3Gb0TZJIrc77T-SM?via=matrix.org&via=gitter.im&via=envs.net for libintl

  cmake -B build -G Ninja \
    -D CMAKE_BUILD_TYPE="${NVIM_BUILD_TYPE}" \
    -D CMAKE_OSX_DEPLOYMENT_TARGET="${MACOSX_DEPLOYMENT_TARGET}" \
    -D CMAKE_OSX_ARCHITECTURES=arm64\;x86_64 \
    -D CMAKE_FIND_FRAMEWORK=LAST \
    -D LIBINTL_INCLUDE_DIR="${gettext_install_dir}/include" \
    -D LIBINTL_LIBRARY="${gettext_install_dir}/lib/libintl.a"
  cmake --build build

  cpack --config build/CPackConfig.cmake
}

main() {
  # This script is located in /bin/neovim/bin and we have to go to /
  pushd "$(dirname "${BASH_SOURCE[0]}")/../../../" >/dev/null

  local deployment_target
  deployment_target=$(jq -r .deploymentTarget ./bin/neovim/resources/buildInfo.json)
  readonly deployment_target

  pushd ./Neovim >/dev/null
    echo "### Building neovim binary"
    if [[ "${clean}" == true ]]; then
      make distclean
    fi

    build_gettext "${deployment_target}"
    build_neovim "${deployment_target}"
  popd >/dev/null

  popd >/dev/null
}

main

