package set summary "Portable Foreign Function Interface library"
package set webpage "https://sourceware.org/libffi"
package set src.url "https://github.com/libffi/libffi/releases/download/v3.3/libffi-3.3.tar.gz"
package set src.sum "72fba7922703ddfa7a028d513ac15a85c8d54c8d67f55fa5a4802885dc652056"
package set bsystem "configure"

build() {
    configure --disable-symvers --enable-docs
}
