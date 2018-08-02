cmake_minimum_required(VERSION 3.9)
project(hoshiMenu)
include(FindPkgConfig)
pkg_check_modules(CURLPP REQUIRED curlpp)


set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(hoshiMenu main.cpp)
target_link_libraries(hoshiMenu ${CURLPP_LDFLAGS})
target_link_libraries(hoshiMenu ncurses)
