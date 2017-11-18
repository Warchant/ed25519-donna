# Creates test "test_name", with "SOURCES" (use string as second argument)
function(addtest test_name SOURCES)
  add_executable(${test_name} ${SOURCES})
  target_link_libraries(${test_name} gtest gmock)
  add_test(
      NAME ${test_name}
      COMMAND $<TARGET_FILE:${test_name}>
  )
endfunction()

# Creates benchmark "bench_name", with "SOURCES" (use string as second argument)
function(addbenchmark bench_name SOURCES)
  add_executable(${bench_name} ${SOURCES})
  target_link_libraries(${bench_name} PRIVATE benchmark)
endfunction()
