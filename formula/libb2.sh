package set summary "Secure hashing function"
package set webpage "https://blake2.net"
package set src.git "https://github.com/BLAKE2/libb2.git"
package set src.url "https://github.com/BLAKE2/libb2/releases/download/v0.98.1/libb2-0.98.1.tar.gz"
package set src.sum "53626fddce753c454a3fea581cbbc7fe9bbcf0bc70416d48fdbbf5d87ef6c72e"
package set license "CC0-1.0"
package set bsystem "configure"
package set dep.cmd "autoconf automake>=1.16.0"

#https://github.com/quiet/quiet/issues/23
#https://github.com/jgaeddert/liquid-dsp/pull/62/files#diff-4bb328fbe3180ab54cff2f63f71c3a77
prepare() {
    sed_in_place '/AX_GCC_X86_CPUID(0x00000001)/a ecx=0\nedx=0\nif test "$ax_cv_gcc_x86_cpuid_0x00000001" != "unknown"; then' m4/ax_ext.m4 &&
    sed_in_place '/AC_CACHE_CHECK(\[whether mmx is supported\]/i fi' m4/ax_ext.m4
}

build() {
    configure \
        --disable-openmp \
        --disable-fat \
        --enable-native
}
