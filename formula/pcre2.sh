package set summary "Perl compatible regular expressions library with a new API"
package set webpage "https://www.pcre.org"
package set src.url "https://ftp.pcre.org/pub/pcre/pcre2-10.35.tar.bz2"
package set src.sum "9ccba8e02b0ce78046cdfb52e5c177f0f445e421059e43becca4359c669d4613"
package set bsystem "cmake"
package set dep.pkg "zlib bzip2 readline"

build() {
    cmakew \
        -DPCRE2_BUILD_PCRE2_8=ON \
        -DPCRE2_BUILD_PCRE2_16=ON \
        -DPCRE2_BUILD_PCRE2_32=ON \
        -DPCRE2_BUILD_PCRE2GREP=ON \
        -DPCRE2_BUILD_TESTS=OFF \
        -DPCRE2_DEBUG=OFF \
        -DPCRE2_SUPPORT_VALGRIND=OFF \
        -DPCRE2_SUPPORT_UNICODE=ON \
        -DPCRE2_SUPPORT_LIBZ=ON \
        -DPCRE2_SUPPORT_LIBBZ2=ON \
        -DPCRE2_SUPPORT_LIBREADLINE=ON \
        -DZLIB_INCLUDE_DIR="$zlib_INCLUDE_DIR" \
        -DZLIB_LIBRARY_RELEASE="$zlib_LIBRARY_DIR/libz.a" \
        -DBZIP2_INCLUDE_DIR="$bzip2_INCLUDE_DIR" \
        -DBZIP2_LIBRARY_RELEASE="$bzip2_LIBRARY_DIR/libbz2.a" \
        -DREADLINE_INCLUDE_DIR="$readline_INCLUDE_DIR" \
        -DREADLINE_LIBRARY="$readline_LIBRARY_DIR/libreadline.a"
}
