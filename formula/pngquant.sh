pkg_set summary "PNG image optimizing utility"
pkg_set webpage "https://pngquant.org"
pkg_set src.url "https://pngquant.org/pngquant-2.17.0-src.tar.gz"
pkg_set src.sha "a27cf0e64db499ccb3ddae9b36036e881f78293e46ec27a9e7a86a3802fcda66"
pkg_set git.url "https://github.com/kornelski/pngquant.git"
pkg_set license "|COPYRIGHT|https://raw.githubusercontent.com/kornelski/pngquant/main/COPYRIGHT"
pkg_set dep.pkg "libpng lcms2"
pkg_set dep.cmd "pkg-config"
pkg_set bsystem "gmake"
pkg_set binbstd "yes"

build() {
    run ./configure \
        --prefix="$PACKAGE_INSTALL_DIR" \
        --disable-sse \
        --with-libpng="$libpng_INSTALL_DIR" \
        CC="$CC" \
        CFLAGS="'$CFLAGS $CPPFLAGS'" \
        LDFLAGS="'$LDFLAGS'" &&
    gmakew clean &&
    gmakew install
}
