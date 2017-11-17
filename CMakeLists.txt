cmake_minimum_required(VERSION 3.6)
project(ed25519 C)

set(CMAKE_BUILD_TYPE "Release")

add_definitions("-m64")
add_definitions("-O3")
add_definitions("-c")


add_library(ed25519 SHARED
    ed25519.c
    )

if(ED25519_REFHASH)
  add_definitions("-DED25519_REFHASH")
elseif(ED25519_CUSTOMHASH)
  add_definitions("-DED25519_CUSTOMHASH")
else()
  find_package(OpenSSL)

  target_include_directories(ed25519 PUBLIC
      ${OPENSSL_INCLUDE_DIR}
      )

  message("openssl is used for hash/random: ${OPENSSL_LIBRARIES}")
  target_link_libraries(ed25519
      ${OPENSSL_LIBRARIES}
      )
endif()

add_executable(ed25519-test
    test.c
    )
target_link_libraries(ed25519-test
    ed25519
    )
