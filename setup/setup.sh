#!/bin/bash

#   Purpose :   To help users automate the build process of 'hoshiMenu'
#   Author  :   Hoshiko

# copy -> echo -e "\e[0m"
echo -e "\e[31m####################\e[0m\e[5m\e[1m\e[4mIMPORTANT\e[0m\e[31m####################\e[0m"
echo -e "\e[93mBefore we begin please make sure you do not run this script unless you have read the script.\e[0m"
echo -e "\e[31m#################################################\e[0m\n"


__setupHoshiAutomated(){
    # make a temp folder to store downloads of all files needed
    echo -e "\e[33mChecking for 'temp' folder\e[0m"
    
    if [ -d "temp" ]; then
        echo -e "\e[32mFound 'temp' folder. Cd-ing into 'temp' folder\e[0m"
        cd temp
    else
        if [ ! -d "temp" ]; then
            echo -e "\e[31mFolder 'temp' not found. Creating 'temp' folder\e[0m"
            mkdir temp
            echo "Cd-ing into 'temp' folder"
            cd temp
        fi
    fi
    
    # env values change if needed
    echo "Setting env varibles"
    
    echo "Setting 'CXX_COMPILER' to 'g++'"
    CXX_COMPILER=g++
    echo "Set 'CXX_COMPILER' env to 'g++'"
    
    echo "Setting 'C_COMPILER' to 'gcc'"
    C_COMPILER=gcc
    echo "Setting 'C_COMPILER' to 'gcc'"
    
    
    # Check for start deps
    echo -e "\e[33mChecking for packages needed for this application\e[0m"
    
    echo -e "\e[33mChecking for 'wget'\e[0m"
    which wget > /dev/null 2>&1
    if [ $? == 0 ]; then
        echo -e "\e[32m'wget' found, looking for 'cmake'\e[0m"
    else
        read -p "'wget' is not installed. Would you like to have 'wget' installed?[y/n]: " request
        if [$request == 'y']; then
            sudo pacman -S wget
            echo "'wget installed, looking for 'cmake"
        fi
    fi
    
    which cmake > /dev/null 2>&1
    if [ $? == 0 ]; then
        echo -e "\e[32m'make' found, looking for 'cmake'\e[0m"
    else
        read -p "'cmake' is not installed. Would you like to have 'cmake' installed?[y/n]: " request
        if [ $request == 'y']; then
            wget https://github.com/Kitware/CMake/archive/v3.11.4.tar.gz
            tar -xf v3.11.4.tar.gz
            cd CMake-3.11.4
            ./bootstrap && make && sudo make install
            cd ..
        fi
    fi
    
    if [ -d "curlpp-0.8.1" ]; then
        echo "moving"
    else
        if [ ! -d "curlpp-0.8.1" ]; then
            wget -O curlpp-0.8.1.tar.gz https://github.com/jpbarrette/curlpp/archive/v0.8.1.tar.gz
            tar -xf curlpp-0.8.1.tar.gz
            cd curlpp-0.8.1
            mkdir cmake_build
            cd cmake_build
            cmake -D CMAKE_CXX_COMPILER=`which ${CXX_COMPILER}` -DCMAKE_CXX_FLAGS="$CMAKE_CXX_FLAGS" -DCMAKE_EXE_LINKER_FLAGS="$CMAKE_EXE_LINKER_FLAGS" ..
            sudo make install
            cd ..
            cd ..
        fi
    fi
    
    if [ -d "ncurses-6.1" ]; then
        echo "moving"
    else
        if [ ! -d "ncurses-6.1" ]; then
            wget -O ncurses-6.1.tar.gz https://invisible-mirror.net/archives/ncurses/ncurses-6.1.tar.gz
            tar -xf ncurses-6.1.tar.gz
            cd ncurses-6.1
            ./configure
            make
            sudo make install
            cd ..
        fi
    fi
    __buildHoshi
}

__buildHoshi(){
    cd ..
    cd ..
    
    if [ -d "build" ]; then
        cd build
        cmake ..
        make
    else
        if [ ! -d "build" ]; then
            mkdir build
            cd build
            cmake ..
            make
        fi
    fi
}

__setupHoshiManual(){
    echo "not done"
}

read -p "Would you like to use automated process to build this application? [y/n]: " auto
case "$auto" in
    'y')
        clear
        echo -e "Starting automated process"
        __setupHoshiAutomated
    ;;
    'n')
        clear
        echo -e "Starting manual build process"
        __setupHoshiManual
    ;;
esac