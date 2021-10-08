cmake_minimum_required(VERSION 3.17)
project(my_google_test)

set(CMAKE_CXX_STANDARD 11)

add_subdirectory(googletest)
enable_testing()


add_executable(
        hello_test
        hello_test.cpp
)

target_link_libraries(
        hello_test
        gtest_main
)

include(GoogleTest)
gtest_discover_tests(hello_test)
