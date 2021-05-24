package set summary "Cryptography and SSL/TLS Toolkit"
package set webpage "https://openssl.org"
package set src.url "https://dl.bintray.com/homebrew/mirror/openssl-1.1.1g.tar.gz"
package set src.sum "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
package set bsystem "make"
package set dep.cmd "perl"
package set binsrcd 'true'

#注意：1.0.2以上的openssl不支持openssl-fips，从openssl3.0开始支持新设计的openssl-fips
#https://github.com/openssl/openssl/issues/7582
build() {
    run ./config \
        shared \
        no-ssl2 \
        no-ssl3 \
        no-comp \
        no-hw \
        no-engine \
        no-asm \
        --prefix="$PACKAGE_INSTALL_DIR" &&
    makew clean &&
    makew &&
    makew install
}
