cmake_minimum_required(VERSION 3.9)
project(hoshiMenu)
include(FindPkgConfig)
pkg_check_modules(CURLPP REQUIRED curlpp)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_CXX_FLAGS "-lncurses")

add_executable(hoshiMenu main.cpp)
target_link_libraries(hoshiMenu ${CURLPP_LDFLAGS})
target_link_libraries(hoshiMenu ${NCURSES_CXXFLAGS})

