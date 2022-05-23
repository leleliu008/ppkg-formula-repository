pkg_set summary "Extraction utility for .zip compressed archives"
pkg_set webpage "https://infozip.sourceforge.io/UnZip.html"

pkg_set src.url "https://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz"
pkg_set src.sha "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"

# https://packages.debian.org/buster/unzip
pkg_set fix.url "https://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-26.debian.tar.xz"
pkg_set fix.sha "88cb7c0f1fd13252b662dfd224b64b352f9e75cd86389557fcb23fa6d2638599"

pkg_set version "6.0.26"

pkg_set license "Info-ZIP"
pkg_set depends "bzip2"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

prepare() {
    for patchfile in $(cat ../fix/patches/series)
    do
        patch -p1 < ../fix/patches/$patchfile || return 1
    done
}

build_on_linux() {
    gmakew -f unix/Makefile clean &&
    gmakew -f unix/Makefile generic \
        CC="$CC" \
        CFLAGS="'$CFLAGS $CPPFLAGS $LDFLAGS'" \
        AS="$AS" \
        LD="'$CC -static'" \
        STRIP="$STRIP" \
        LOCAL_UNZIP="'$CFLAGS $CPPFLAGS $LDFLAGS'" &&
    gmakew -f unix/Makefile install \
        prefix="$PACKAGE_INSTALL_DIR" \
        MANDIR="$PACKAGE_INSTALL_DIR/share/man/man1"
}

build_on_macos() {
    gmakew -f unix/Makefile clean &&
    gmakew -f unix/Makefile macosx \
        CC="$CC" \
        CFLAGS="'$CFLAGS $CPPFLAGS $LDFLAGS'" \
        AS="$AS" \
        LD="'$CC'" \
        STRIP="$STRIP" \
        LOCAL_UNZIP="'$CFLAGS $CPPFLAGS $LDFLAGS'" \
        LOC=-DLARGE_FILE_SUPPORT \
        D_USE_BZ2=-DUSE_BZIP2 \
        L_BZ2=-lbz2 \
        LFLAGS1=-liconv &&
    gmakew -f unix/Makefile install \
        prefix="$PACKAGE_INSTALL_DIR" \
        MANDIR="$PACKAGE_INSTALL_DIR/share/man/man1"
}

build() {
    case $NATIVE_OS_TYPE in
        macos) build_on_macos ;;
        *)     build_on_linux ;;
    esac
}
