pkg_set summary "Next generation open source RPC library and framework"
pkg_set webpage "https://grpc.io"
pkg_set git.url "https://github.com/grpc/grpc.git"
pkg_set src.url "https://github.com/grpc/grpc/archive/refs/tags/v1.46.0.tar.gz"
pkg_set src.sha "67423a4cd706ce16a88d1549297023f0f9f0d695a96dd684adc21e67b021f9bc"
pkg_set license "Apache-2.0"
pkg_set dep.pkg "abseil c-ares openssl protobuf re2"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DCMAKE_CXX_STANDARD=17 \
        -DCMAKE_CXX_STANDARD_REQUIRED=TRUE \
        -DBUILD_SHARED_LIBS=ON \
        -DgRPC_BUILD_TESTS=OFF \
        -DgRPC_INSTALL=ON \
        -DgRPC_ABSL_PROVIDER=package \
        -DgRPC_CARES_PROVIDER=package \
        -DgRPC_PROTOBUF_PROVIDER=package \
        -DgRPC_SSL_PROVIDER=package \
        -DgRPC_ZLIB_PROVIDER=package \
        -DgRPC_RE2_PROVIDER=package
}
