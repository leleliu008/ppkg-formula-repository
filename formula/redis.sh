pkg_set summary "Persistent key-value database, with built-in net interface"
pkg_set webpage "https://redis.io"
pkg_set git.url "https://github.com/redis/redis.git"
pkg_set src.url "https://download.redis.io/releases/redis-6.2.1.tar.gz"
pkg_set src.sha "cd222505012cce20b25682fca931ec93bd21ae92cb4abfe742cf7b76aa907520"
pkg_set license "BSD-3-Clause"
pkg_set dep.pkg "openssl libbthread"
pkg_set bscript "src"
pkg_set bsystem "gmake"

build() {
    gmakew -C "$PACKAGE_INSTALLING_BST_DIR" clean &&
    gmakew -C "$PACKAGE_INSTALLING_BST_DIR" CC="$CC" CFLAGS="'$CFLAGS $CPPFLAGS'" LDFLAGS="'$LDFLAGS'" AR="$AR" RANLIB="$RANLIB" uname_M="$TARGET_OS_ARCH" BUILD_TLS=yes USE_JEMALLOC=no &&
    gmakew -C "$PACKAGE_INSTALLING_BST_DIR" install PREFIX="$PACKAGE_INSTALL_DIR"
}
