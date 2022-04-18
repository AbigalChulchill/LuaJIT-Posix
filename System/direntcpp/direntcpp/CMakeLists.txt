cmake_minimum_required (VERSION 2.6)

project (direntcpp)


option(DIRENTCPP_WITH_TESTS "Build tests" OFF)



#special options for MSVC
if(MSVC)
    add_definitions("/W4 /Wall")
elseif(CMAKE_COMPILER_IS_GNUCXX)
	add_definitions("-Wall -std=c++0x -Weffc++ -pedantic -Wextra")
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
	add_definitions("-Wall -std=c++0x -Weffc++ -pedantic -Wextra")
endif(MSVC)


if(DIRENTCPP_WITH_TESTS)
        ENABLE_TESTING()
        include(CTest)
        add_subdirectory(tests)
endif(DIRENTCPP_WITH_TESTS)

