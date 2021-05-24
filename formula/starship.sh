package set summary "Cross-shell prompt for astronauts"
package set webpage "https://starship.rs"
package set src.git "https://github.com/starship/starship.git"
package set src.url "https://github.com/starship/starship/archive/v0.50.0.tar.gz"
package set src.sum "d8f4dc9bd266f2a5c34926d361c62fdddb61cd7da4acadba5f9c175eb07602e5"
package set license "ISC"
package set bsystem "cargo"

build() {
    run cargo clean &&
    run cargo install -vv -j 1 --path "$SOURCE_DIR" --root="$PACKAGE_INSTALL_DIR" 
}
