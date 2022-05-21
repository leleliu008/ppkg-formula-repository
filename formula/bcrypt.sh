pkg_set summary "Cross platform file encryption utility using blowfish"
pkg_set webpage "https://bcrypt.sourceforge.io"
pkg_set src.url "https://bcrypt.sourceforge.io/bcrypt-1.1.tar.gz"
pkg_set src.sha "b9c1a7c0996a305465135b90123b0c63adbb5fa7c47a24b3f347deb2696d417d"
pkg_set bsystem "gmake"
pkg_set ldflags "-lz"

prepare() {
    sed_in_place 's|man/man1|share/man/man1|g' Makefile
}

build() {
    gmakew -C "$PACKAGE_INSTALLING_BST_DIR" clean &&
    gmakew -C "$PACKAGE_INSTALLING_BST_DIR" install CC="$CC" CFLAGS="'$CFLAGS $CPPFLAGS'" LDFLAGS="'$LDFLAGS'" PREFIX="$PACKAGE_INSTALL_DIR"
}
