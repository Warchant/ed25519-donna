SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/test_bin)

addtest(rfc8032 rfc8032.cpp)
target_link_libraries(rfc8032 ed25519)
