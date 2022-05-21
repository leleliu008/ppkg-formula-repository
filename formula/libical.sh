pkg_set summary "Implementation of iCalendar protocols and data formats"
pkg_set webpage "https://libical.github.io/libical"
pkg_set src.url "https://github.com/libical/libical/releases/download/v3.0.8/libical-3.0.8.tar.gz"
pkg_set src.sha "09fecacaf75ba5a242159e3a9758a5446b5ce4d0ab684f98a7040864e1d1286f"
pkg_set license "LGPL-2.1-or-later"
pkg_set depends "icu4c libxml2 glib"
pkg_set bsystem "cmake"

build() {
    cmakew \
        -DPACKAGE_DUMPER=OFF \
        -DADDRESS_SANITIZER=OFF \
        -DENABLE_GTK_DOC=OFF \
        -DGOBJECT_INTROSPECTION=OFF \
        -DICAL_ALLOW_EMPTY_PROPERTIES=OFF \
        -DICAL_BUILD_DOCS=OFF \
        -DICAL_ERRORS_ARE_FATAL=OFF \
        -DICAL_GLIB=ON \
        -DICAL_GLIB_VAPI=OFF \
        -DLIBICAL_BUILD_TESTING=OFF \
        -DSHARED_ONLY=OFF \
        -DSTATIC_ONLY=OFF \
        -DTHREAD_SANITIZER=OFF \
        -DUSE_BUILTIN_TZDATA=OFF \
        -DWITH_CXX_BINDINGS=ON \
        -DICU_INCLUDE_DIR="$icu4c_INCLUDE_DIR" \
        -DICU_LIBRARY="$icu4c_LIBRARY_DIR/libicuuc.a" \
        -DICU_I18N_LIBRARY="$icu4c_LIBRARY_DIR/libicui18n.a"
}
