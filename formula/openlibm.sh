package set summary "High quality, portable, open source libm implementation"
package set webpage "https://openlibm.org"
package set src.git "https://github.com/JuliaMath/openlibm.git"
package set src.url "https://github.com/JuliaMath/openlibm/archive/v0.7.3.tar.gz"
package set src.sum "d3bcc4ef21c033a0cc408a30186bb3dbe21219e0c52d328ca70eb688cf867354"
package set bsystem "make"

prepare() {
    sed_in_place 's|-mhard-float||g' Make.inc
}

build() {
    if [ "$TARGET_OS_ARCH" = 'x86_64' ] ; then
        LONG_DOUBLE_NOT_DOUBLE=1
    else
        LONG_DOUBLE_NOT_DOUBLE=0
    fi
    makew -C "$SOURCE_DIR" clean &&
    makew -C "$SOURCE_DIR" install \
        prefix="$PACKAGE_INSTALL_DIR" \
        CC="$CC" \
        CFLAGS="\"$CFLAGS\"" \
        CPPFLAGS="\"$CPPFLAGS\"" \
        LDFLAGS="\"$LDFLAGS\"" \
        AR="$AR" \
        OS=Linux \
        ARCH="$TARGET_OS_ARCH" \
        LONG_DOUBLE_NOT_DOUBLE="$LONG_DOUBLE_NOT_DOUBLE"
}
