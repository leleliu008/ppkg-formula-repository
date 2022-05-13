pkg_set summary "Collection of Linux utilities"
pkg_set git.url "https://github.com/karelzak/util-linux.git"
pkg_set src.url "https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.tar.xz"
pkg_set src.sha "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"
pkg_set license "GPL-2.0-or-later"
pkg_set depends "readline"
pkg_set bsystem "configure"

build() {
    configure \
        --without-python \
        --without-systemd \
        --without-ncursesw \
        --enable-widechar \
        --enable-libuuid
}
