vcpkg_fail_port_install(ON_ARCH "arm" "arm64" ON_TARGET "UWP")

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO AviSynth/AviSynthPlus
    REF 761907b789932cc93d7ca831a07211c41c758a4d
    SHA512 c550692720638b0012f382334ee738ede9adc7156e6ee40133816c7f0f1e0cbf042411e3a00a7f2fd717b414211b858d4b637bcc7a8825a81834ebd9440f5614
    HEAD_REF master
    PATCHES
        0001-fix-syslibs.patch
        0002-fix-pc-include.patch
        0003-fix-tls-static.patch
)

vcpkg_download_distfile(GHC_ARCHIVE
    URLS "https://github.com/gulrak/filesystem/archive/3f1c185ab414e764c694b8171d1c4d8c5c437517.zip"
    FILENAME filesystem-3f1c185ab414e764c694b8171d1c4d8c5c437517.zip
    SHA512 e3fe1e41b31f840ebc219fcd795e7be2973b80bb3843d6bb080786ad9e3e7f846a118673cb9e17d76bae66954e64e024a82622fb8cea7818d5d9357de661d3d1
)

file(REMOVE_RECURSE ${SOURCE_PATH}/filesystem)
vcpkg_extract_source_archive(${GHC_ARCHIVE} ${SOURCE_PATH})
file(RENAME ${SOURCE_PATH}/filesystem-3f1c185ab414e764c694b8171d1c4d8c5c437517 ${SOURCE_PATH}/filesystem)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DENABLE_PLUGINS=OFF
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL ${SOURCE_PATH}/distrib/gpl.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
