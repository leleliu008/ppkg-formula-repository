pkg_set summary "C library of Git core methods that is re-entrant and linkable"
pkg_set webpage "https://libgit2.github.com"
pkg_set git.url "https://github.com/libgit2/libgit2.git"
pkg_set src.url "https://github.com/libgit2/libgit2/releases/download/v1.0.1/libgit2-1.0.1.tar.gz"
pkg_set src.sha "689f442c39c4117df515d1a0ffd7b401b91a500d7e2875ac45a440d86f198f5a"
pkg_set bsystem "cmake"
pkg_set dep.cmd "pkg-config"
pkg_set dep.pkg "openssl pcre2 libssh2 zlib"

build() {
    cmakew \
    -DBUILD_CLAR=OFF \
    -DBUILD_FUZZERS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_WERROR=OFF \
    -DENABLE_TRACE=OFF \
    -DDEPRECATE_HARD=OFF \
    -DPROFILE=OFF \
    -DTHREADSAFE=ON \
    -DUSE_SSH=ON \
    -DUSE_HTTPS=OpenSSL \
    -DUSE_BUNDLED_ZLIB=OFF \
    -DREGEX_BACKEND=pcre2 \
    -DPCRE2_INCLUDE_DIR="$pcre2_INCLUDE_DIR" \
    -DPCRE2_LIBRARY="$pcre2_LIBRARY_DIR/libpcre2-8.a" \
    -DZLIB_INCLUDE_DIR="$zlib_INCLUDE_DIR" \
    -DZLIB_LIBRARY_RELEASE="$zlib_LIBRARY_DIR/libz.a"
}
