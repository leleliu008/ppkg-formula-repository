pkg_set summary "Packet(TCP/IP) Capture libray"
pkg_set webpage "https://www.tcpdump.org"
pkg_set src.url "https://www.tcpdump.org/release/libpcap-1.9.1.tar.gz"
pkg_set src.sha "635237637c5b619bcceba91900666b64d56ecb7be63f298f601ec786ce087094"
pkg_set depends "flex bison"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DINET6=ON \
        -DENABLE_REMOTE=ON \
        -DBDEBUG=OFF \
        -DDISABLE_USB=OFF \
        -DDISABLE_SEPTEL=OFF \
        -DDISABLE_NETMAP=OFF \
        -DDISABLE_DBUS=OFF \
        -DDISABLE_BLUETOOTH=OFF \
        -DDISABLE_DAG=ON \
        -DDISABLE_TC=ON \
        -DDISABLE_SNF=ON
}
