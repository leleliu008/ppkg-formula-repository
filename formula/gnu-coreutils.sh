package set summary "GNU File, Shell, and Text utilities"
package set webpage "https://www.gnu.org/software/coreutils"
package set src.url "https://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz"
package set src.sum "4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa"
package set license "GPL-3.0"
package set bsystem "configure"

build() {
    configure \
        --with-included-regex \
        --with-linux-crypto \
        --without-gmp \
        --without-openssl \
        --without-selinux \
        --disable-libcap \
        --disable-libsmack \
        --disable-assert \
        --disable-gcc-warnings \
        --disable-acl \
        --enable-xattr \
        --enable-threads=posix
}