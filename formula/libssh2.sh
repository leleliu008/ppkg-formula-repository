pkg_set summary "C library implementing the SSH2 protocol"
pkg_set webpage "https://libssh2.org"
pkg_set git.url "https://github.com/libssh2/libssh2.git"
pkg_set src.url "https://libssh2.org/download/libssh2-1.10.0.tar.gz"
pkg_set src.sha "2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51"
pkg_set license "BSD-3-Clause"
pkg_set dep.pkg "zlib openssl"
pkg_set bsystem "configure"

build() {
    configure \
        --disable-examples-build \
        --disable-werror \
        --with-crypto=openssl \
        --with-libssl-prefix="$openssl_INSTALL_DIR" \
        --with-libz \
        --with-libz-prefix="$zlib_INSTALL_DIR"
}
