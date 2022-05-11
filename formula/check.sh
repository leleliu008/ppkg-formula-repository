pkg_set summary "C unit testing framework"
pkg_set webpage "https://libcheck.github.io/check"
pkg_set src.url "https://github.com/libcheck/check/releases/download/0.15.1/check-0.15.1.tar.gz"
pkg_set src.sha "c1cc3d64975c0edd8042ab90d881662f1571278f8ea79d8e3c2cc877dac60001"
pkg_set license "LGPL-2.1"
pkg_set bsystem "cmake"

build() {
    cmakew \
    -DCHECK_ENABLE_GCOV=OFF \
    -DINSTALL_CHECKMK=ON
}
