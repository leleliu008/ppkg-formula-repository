package set summary "Graph visualization software from AT&T and Bell Labs"
package set webpage "https://www.graphviz.org"
package set src.url "https://www2.graphviz.org/Packages/stable/portable_source/graphviz-2.44.1.tar.gz"
package set src.sum "8e1b34763254935243ccdb83c6ce108f531876d7a5dfd443f255e6418b8ea313"
package set license "EPL-1.0"
package set dep.cmd "pkg-config libtoolize libtool groff ps2pdf"
package set dep.pkg "fontconfig libpng expat"
package set ldflags "-lexpat -lz -lm"
package set bsystem "autotools"

build() {
    configure --enable-swig=no
}
