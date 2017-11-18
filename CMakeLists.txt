cmake_minimum_required(VERSION 3.6)
project(ed25519 C CXX)

SET(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/modules)
SET(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
SET(CMAKE_C_FLAGS_RELEASE "-O3 -m64 -c")
SET(CMAKE_C_FLAGS_DEBUG "-O0 -Wextra -Werror -g")


# dependencies
find_package(PackageHandleStandardArgs)
include(ExternalProject)
set_directory_properties(PROPERTIES
    EP_PREFIX ${PROJECT_SOURCE_DIR}/external
    )
#find_package(keccak)
find_package(benchmark)
find_package(gtest)


include_directories(${CMAKE_CURRENT_SOURCE_DIR})

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

include(modules/functions.cmake)
add_subdirectory(test)
add_subdirectory(benchmark)
