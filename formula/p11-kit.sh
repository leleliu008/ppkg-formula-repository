pkg_set summary "Library to load and enumerate PKCS#11 modules"
pkg_set webpage "https://p11-glue.freedesktop.org"
pkg_set git.url "https://github.com/p11-glue/p11-kit.git"
pkg_set src.url "https://github.com/p11-glue/p11-kit/releases/download/0.23.20/p11-kit-0.23.20.tar.xz"
pkg_set src.sha "14d86024c3dfd6b967d9bc0b4ec7b2973014fe7423481f4d230a1a63b8aa6104"
pkg_set bsystem "configure"

prepare() {
    # p11-kit cannot be used as a static library
    sed_in_place 's/if test "$enable_static" = "yes"; then/if false ; then/' configure
}

build() {
    configure \
        --without-systemd \
        --without-libtasn1 \
        --without-libffi \
        --with-bash-completion \
        --disable-coverage \
        --disable-strict \
        --disable-doc
}
