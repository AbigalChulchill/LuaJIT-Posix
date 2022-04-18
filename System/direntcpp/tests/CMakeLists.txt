file(GLOB DIRENTCPP_TEST_CASES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.cc )



include_directories(${CMAKE_SOURCE_DIR})


add_library(direntcpp ../direntcpp.cc)


foreach(t ${DIRENTCPP_TEST_CASES})
	add_executable(${t}_test ${t})
	target_link_libraries(${t}_test direntcpp)
	add_test(${t}-test ${t}_test)
endforeach(t)

