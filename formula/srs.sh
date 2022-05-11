pkg_set summary "Simple Realtime Server"
pkg_set webpage "https://ossrs.net"
pkg_set git.url "https://github.com/ossrs/srs.git"
pkg_set version "3.0-r3"
pkg_set src.url "https://github.com/ossrs/srs/archive/v${PACKAGE_VERSION}.tar.gz"
pkg_set src.sha "a28a3b152dd51e58ad96caefa71c4310d29adbb0d1623581c13a5521afe04724"
pkg_set license "MIT"
pkg_set bsystem "make"
pkg_set sourced "trunk"
pkg_set binbstd 'YES'

build() {
    export SRS_EXTRA_FLAGS="$CFLAGS $CPPFLAGS"

    case $TARGET_OS_ARCH in
        armv7a)  CONFIGURE_EXTRA_FLAGS=--arm ;;
        aarch64) CONFIGURE_EXTRA_FLAGS=--arm ;;
        i686)    CONFIGURE_EXTRA_FLAGS=--x86-64  ;;
        x86_64)  CONFIGURE_EXTRA_FLAGS=--x86-x64 ;;
    esac
    
    run ./configure \
        --prefix="$PACKAGE_INSTALL_DIR" \
        --static \
        "$CONFIGURE_EXTRA_FLAGS" \
        --cc=$CC \
        --cxx=$CXX \
        --ar=$AR \
        --ld=$LD \
        --randlib=$RANLIB &&
    makew clean &&
    makew &&
    makew install
}
