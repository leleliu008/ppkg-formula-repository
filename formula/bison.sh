pkg_set summary "Yacc-compatible Parser generator"
pkg_set webpage "https://www.gnu.org/software/bison"
pkg_set src.url "https://ftp.gnu.org/gnu/bison/bison-3.7.2.tar.xz"
pkg_set src.sha "7948d193104d979c0fb0294a1854c73c89d72ae41acfc081826142578a78a91b"
pkg_set license "GPL-3.0-or-later"
pkg_set bsystem "configure"

build() {
    configure \
        --enable-yacc \
        --enable-relocatable \
        --enable-threads=posix \
        --disable-gcc-warnings \
        --disable-assert
}
