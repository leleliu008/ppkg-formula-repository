pkg_set summary "Extraction utility for .zip compressed archives"
pkg_set webpage "https://infozip.sourceforge.io/UnZip.html"
pkg_set src.url "https://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz"
pkg_set src.sha "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
pkg_set version "6.0-26"
pkg_set bsystem "make"
pkg_set dep.pkg "zip bzip2"
pkg_set binbstd 'YES'
pkg_set patches "https://deb.debian.org/debian/pool/main/u/unzip/unzip_${PACKAGE_VERSION}.debian.tar.xz" \
                    "88cb7c0f1fd13252b662dfd224b64b352f9e75cd86389557fcb23fa6d2638599"
# https://packages.debian.org/buster/unzip

prepare() {
    tar xf $PACKAGE_PATCHES -C "$PACKAGE_BSCRIPT_DIR" || return 1
    while read patch
    do
        patch -p1 < "debian/patches/$patch" || return 1
    done < debian/patches/series
}

build() {
    makew -f unix/Makefile clean &&
    makew -f unix/Makefile generic \
        CC="$CC" \
        CFLAGS="'$CFLAGS $CPPFLAGS $LDFLAGS'" \
        AS="$AS" \
        STRIP="$STRIP" \
        LOCAL_UNZIP="'$CFLAGS $CPPFLAGS $LDFLAGS'" &&
    makew -f unix/Makefile install \
        prefix="$PACKAGE_INSTALL_DIR" \
        MANDIR="$PACKAGE_INSTALL_DIR/share/man/man1"
}
