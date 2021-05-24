package set summary "Library making programming with POSIX capabilities easier than traditional libcap"
package set webpage "https://people.redhat.com/sgrubb/libcap-ng"
package set src.git "https://github.com/stevegrubb/libcap-ng.git"
package set src.url "https://github.com/stevegrubb/libcap-ng/archive/v0.8.2.tar.gz"
package set src.sum "65b86885b8d873e55c05bd49427fd370d559b26f0c2089ac9194828e6a2fe233"
package set license "LGPL-2.1"
package set bsystem "autogen"

build() {
    configure \
        --with-warn \
        --without-debug \
        --without-python \
        --without-python3
}
