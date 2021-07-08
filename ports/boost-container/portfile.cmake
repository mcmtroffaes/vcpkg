# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/container
    REF boost-1.76.0
    SHA512 5e73508ea1bb67ccbb83785c1f7db4a92d0cf9435a6383394dd1aecd83f88697a16b054c762bdd4d06c3ec92629d1f4b89cf32d2fafefa0a0702318bc01d5dd4
    HEAD_REF master
)

if(NOT DEFINED CURRENT_HOST_INSTALLED_DIR)
    message(FATAL_ERROR "boost-container requires a newer version of vcpkg in order to build.")
endif()
include(${CURRENT_HOST_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
