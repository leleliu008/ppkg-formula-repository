pkg_set summary "Embedded SSL Library written in C"
pkg_set webpage "https://www.wolfssl.com"
pkg_set src.url "https://github.com/wolfSSL/wolfssl/archive/v4.4.0-stable.tar.gz"
pkg_set src.sha "7f854804c8ae0ca49cc77809e38e9a3b5a8c91ba7855ea928e6d6651b0d35f18"
pkg_set bsystem "autogen"
pkg_set ldflags "-lm"

build() {
    configure \
        --disable-asm \
        --disable-bump \
        --disable-examples \
        --disable-fortress \
        --disable-md5 \
        --disable-sniffer \
        --disable-webserver \
        --enable-static \
        --enable-shared \
        --enable-aesccm \
        --enable-aesgcm \
        --enable-alpn \
        --enable-blake2 \
        --enable-camellia \
        --enable-certgen \
        --enable-certreq \
        --enable-chacha \
        --enable-crl \
        --enable-crl-monitor \
        --enable-curve25519 \
        --enable-dtls \
        --enable-dh \
        --enable-ecc \
        --enable-eccencrypt \
        --enable-ed25519 \
        --enable-filesystem \
        --enable-hc128 \
        --enable-hkdf \
        --enable-inline \
        --enable-ipv6 \
        --enable-jni \
        --enable-keygen \
        --enable-ocsp \
        --enable-opensslextra \
        --enable-poly1305 \
        --enable-psk \
        --enable-rabbit \
        --enable-ripemd \
        --enable-savesession \
        --enable-savecert \
        --enable-sessioncerts \
        --enable-sha512 \
        --enable-sni \
        --enable-supportedcurves \
        --enable-tls13 \
        --enable-sp \
        --enable-fastmath \
        --enable-fasthugemath
}
