pkg_set summary "C library for the arithmetic of high precision complex numbers"
pkg_set webpage "http://www.multiprecision.org/mpc"
pkg_set git.url "https://gitlab.inria.fr/mpc/mpc.git"
pkg_set src.url "https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz"
pkg_set src.sha "17503d2c395dfcf106b622dc142683c1199431d095367c6aacba6eec30340459"
pkg_set license "LGPL-3.0-or-later"
pkg_set depends "mpfr"
pkg_set bsystem "configure"

build() {
    configure \
        --with-gmp="$gmp_INSTALL_DIR" \
        --with-mpfr="$mpfr_INSTALL_DIR" \
        --disable-valgrind-tests \
        --disable-logging
}
