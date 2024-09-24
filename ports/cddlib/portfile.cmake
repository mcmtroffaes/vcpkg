vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO cddlib/cddlib
    REF ${VERSION}
    SHA512 8591ebe9e2a09683bb01b478df6536d1291012927d343013f8593126d3570f7883e125c63c68cd21eeea142a450847dc609e373e39cffb308bed1b56d6342ac1
    HEAD_REF master
    PATCHES
        0001-disable-doc-target.patch  # disable building docs, as they require latex
        0002-disable-dd-log.patch  # https://github.com/cddlib/cddlib/issues/72
        0003-Fix-segfault-in-blockelimination.patch  # https://github.com/cddlib/cddlib/commit/95d43dcb08c14b834341459c132462847ed55441
        0004-thread-safe.patch  # https://github.com/cddlib/cddlib/commit/1210faf9ee9cf02e29fc67e11a8ea4e847c58ddd
        0005-fix-dd_sredundant.patch  # https://github.com/cddlib/cddlib/pull/73
        0006-fix-pkg-config.patch  # https://github.com/cddlib/cddlib/pull/75
        0007-fix-canonicalize-segfault.patch  # https://github.com/cddlib/cddlib/pull/77
        0008-autoconf-c11.patch  # https://github.com/cddlib/cddlib/pull/76
)
vcpkg_configure_make(
    SOURCE_PATH "${SOURCE_PATH}"
    AUTOCONFIG
    COPY_SOURCE  # ensure generated files are found
    ADDITIONAL_MSYS_PACKAGES autoconf-archive
)
vcpkg_install_make()
vcpkg_fixup_pkgconfig()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING" "${SOURCE_PATH}/COPYING")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
