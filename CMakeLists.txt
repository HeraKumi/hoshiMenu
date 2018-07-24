cmake_minimum_required(VERSION 3.10)
project(hoshiMenu)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "-lncurses")

add_executable(hoshiMenu main.cpp)
