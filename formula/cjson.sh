pkg_set summary "Ultralightweight JSON parser in ANSI C"
pkg_set git.url "https://github.com/DaveGamble/cJSON.git"
pkg_set src.url "https://github.com/DaveGamble/cJSON/archive/v1.7.14.tar.gz"
pkg_set src.sha "fb50a663eefdc76bafa80c82bc045af13b1363e8f45cec8b442007aef6a41343"
pkg_set license "MIT"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DENABLE_CJSON_UTILS=ON \
        -DENABLE_CJSON_TEST=OFF \
        -DBUILD_SHARED_AND_STATIC_LIBS=ON
}
