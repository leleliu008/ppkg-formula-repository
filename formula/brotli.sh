pkg_set summary "Generic-purpose lossless compression algorithm by Google"
pkg_set git.url "https://github.com/google/brotli.git"
pkg_set src.url "https://github.com/google/brotli/archive/v1.0.9.tar.gz"
pkg_set src.sha "f9e8d81d0405ba66d181529af42a3354f838c939095ff99930da6aa9cdf6fe46"
pkg_set license "MIT"
pkg_set bsystem "cmake"

build() {
    cmakew
    (
        cd "$PACKAGE_INSTALL_DIR/lib"
        mv libbrotlicommon-static.a libbrotlicommon.a
        mv libbrotlienc-static.a    libbrotlienc.a
        mv libbrotlidec-static.a    libbrotlidec.a
    )
}
