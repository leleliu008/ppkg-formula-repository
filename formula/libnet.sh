package set summary "C library for creating IP packets"
package set src.git "https://github.com/libnet/libnet.git"
package set src.url "https://github.com/libnet/libnet/releases/download/v1.2/libnet-1.2.tar.gz"
package set src.sum "caa4868157d9e5f32e9c7eac9461efeff30cb28357f7f6bf07e73933fb4edaa7"
package set license "BSD-2-Clause"
package set bsystem "configure"

build() {
    configure --enable-samples
}
