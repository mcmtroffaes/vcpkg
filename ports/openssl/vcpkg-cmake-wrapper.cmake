_find_package(${ARGS})

if(WIN32 AND NOT CYGWIN)
  list(APPEND OPENSSL_LIBRARIES Crypt32)
endif()
