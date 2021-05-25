package set summary "Pager program similar to more"
package set webpage "http://www.greenwoodsoftware.com/less/index.html"
package set src.url "http://www.greenwoodsoftware.com/less/less-551.tar.gz"
package set src.sum "ff165275859381a63f19135a8f1f6c5a194d53ec3187f94121ecd8ef0795fe3d"
package set license "GPL-3.0-or-later"
package set dep.pkg "ncurses pcre2"
package set bsystem "configure"

build() {
    configure --with-regex=pcre2 --with-secure
}
