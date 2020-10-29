_find_package(${ARGS})

# workaround for https://gitlab.kitware.com/cmake/cmake/-/issues/19263
if(WIN32 AND NOT CYGWIN)
  list(APPEND OPENSSL_LIBRARIES Crypt32 ws2_32)
endif()
