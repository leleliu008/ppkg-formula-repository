package set summary "GNU awk utility"
package set webpage "https://www.gnu.org/software/gawk"
package set src.url "https://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz"
package set src.sum "cf5fea4ac5665fd5171af4716baab2effc76306a9572988d5ba1078f196382bd"
package set license "GPL-3.0"
package set bsystem "configure"
package set dep.pkg "readline mpfr"

build() {
    configure \
        --with-readline="$readline_INSTALL_DIR" \
        --with-mpfr="$mpfr_INSTALL_DIR" \
        --enable-extensions \
        --enable-lint \
        --enable-mpfr \
        --disable-builtin-intdiv0
}
