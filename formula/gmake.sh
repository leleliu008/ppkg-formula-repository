pkg_set summary "Utility for directing compilation"
pkg_set webpage "https://www.gnu.org/software/make"
pkg_set src.url "https://ftp.gnu.org/gnu/make/make-4.3.tar.gz"
pkg_set src.sha "e05fdde47c5f7ca45cb697e973894ff4f5d79e13b750ed57d7b66d8defc78e19"
pkg_set license "GPL-3.0"
pkg_set bsystem "configure"

build() {
    configure --without-guile --without-dmalloc
}
