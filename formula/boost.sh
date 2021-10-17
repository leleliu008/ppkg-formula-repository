package set summary "Collection of portable C++ source libraries"
package set webpage "https://www.boost.org"
package set version "1.73.0"
package set src.url "https://dl.bintray.com/boostorg/release/${PACKAGE_VERSION}/source/boost_$(echo ${PACKAGE_VERSION} | tr . _).tar.bz2"
package set src.sum "4eb3b8d442b426dc35346235c8733b5ae35ba431690e38c6a8263dce9fcbb402"
package set license "BSL-1.0"
package set dep.pkg "xz bzip2 zstd icu4c libiconv"
package set binsrcd 'YES'

# https://boostorg.github.io/build/manual/master/index.html
# https://sites.google.com/site/robdevelopertips/how-to-build-boost-1-64-0-for-android
# https://www.boost.org/doc/libs/1_73_0/libs/context/doc/html/context/architectures/crosscompiling.html
# https://www.boost.org/doc/libs/1_65_1/libs/context/doc/html/context/architectures.html
build() {
    sed_in_place '1a set -x' bootstrap.sh
    sed_in_place '1a set -x' tools/build/src/engine/build.sh

    run ./bootstrap.sh || return 1

    case $NATIVE_OS_ARCH in
        armv7a)
            address_model=32
            architecture=arm
            abi=aapcs
            ;;
        aarch64)
            address_model=64
            architecture=arm
            abi=aapcs
            ;;
        i686)
            address_model=32
            architecture=x86
            abi=sysv
            ;;
        x86_64)
            address_model=64
            architecture=x86
            abi=sysv
    esac
 
    gen_project_config &&
    run ./b2 install \
        -q \
        -d+2 \
        -j$(nproc) \
        --reconfigure \
        --without-python \
        --prefix="$PACKAGE_INSTALL_DIR" \
        -sICU_PATH="$icu4c_INSTALL_DIR" \
        -sICONV_PATH="$libiconv_INSTALL_DIR" \
        toolset=clang-$BUILD_ROUND_NUM \
        link=static,shared \
        variant=release \
        threading=multi \
        target-os=android \
        binary-format=elf \
        address-model="$address_model" \
        architecture="$architecture" \
        abi="$abi"
}

gen_project_config() {
    cat > project-config.jam <<EOF
using clang : $BUILD_ROUND_NUM : $CXX : <compileflags>"$CXXFLAGS $CPPFLAGS" <linkflags>"$LDFLAGS -shared" <archiver>$AR <ranlib>$RANLIB ;
EOF
}
