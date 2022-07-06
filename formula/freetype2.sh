pkg_set summary "Software library to render fonts"
pkg_set webpage "https://www.freetype.org"
pkg_set src.url "https://downloads.sourceforge.net/project/freetype/freetype2/2.10.2/freetype-2.10.2.tar.xz"
pkg_set src.sha "1543d61025d2e6312e0a1c563652555f17378a204a61e99928c9fcef030a2d8b"
pkg_set bsystem "cmake"
pkg_set dep.pkg "brotli bzip2 libpng"

build() {
    cmakew \
    -DFT_WITH_BROTLI=ON \
    -DFT_WITH_BZIP2=ON \
    -DFT_WITH_ZLIB=ON \
    -DFT_WITH_PNG=ON \
    -DFT_WITH_HARFBUZZ=OFF \
    -DCMAKE_DISABLE_FIND_PACKAGE_HarfBuzz=TRUE \
    -DBROTLIDEC_INCLUDE_DIRS="$brotli_INCLUDE_DIR" \
    -DBROTLIDEC_LIBRARIES="$brotli_LIBRARY_DIR/libbrotlidec.a" \
    -DBZIP2_INCLUDE_DIR="$bzip2_INCLUDE_DIR" \
    -DBZIP2_LIBRARIES="$bzip2_LIBRARY_DIR/libbz2.a" \
    -DZLIB_INCLUDE_DIR="$zlib_INCLUDE_DIR" \
    -DZLIB_LIBRARY_RELEASE="$zlib_LIBRARY_DIR/libz.a" \
    -DPNG_PNG_INCLUDE_DIR="$libpng_INCLUDE_DIR" \
    -DPNG_LIBRARY_RELEASE="$libpng_LIBRARY_DIR/libpng.a"
}
