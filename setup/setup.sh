# used on archlinux 
# may not work on all distros maybe!!


#   IMPORTANT PLEASE READ THIS BEFORE USING THIS SCRIPT
#   PLEASE MAKE SURE TO COMMENT OUT A SECTION IF YOU DONOT NEED IT

# make a temp folder to store downloads of all files needed
mkdir temp
cd temp

# env values change if needed
CXX_COMPILER=g++
C_COMPILER=gcc

# get curlpp used for http stuff
wget -O curlpp-0.8.1.tar.gz https://github.com/jpbarrette/curlpp/archive/v0.8.1.tar.gz
tar -xf curlpp-0.8.1.tar.gz
cd curlpp-0.8.1
mkdir cmake_build
cd cmake_build
cmake -D CMAKE_CXX_COMPILER=`which ${CXX_COMPILER}` -DCMAKE_CXX_FLAGS="$CMAKE_CXX_FLAGS" -DCMAKE_EXE_LINKER_FLAGS="$CMAKE_EXE_LINKER_FLAGS" ..
sudo make install
cd ..
cd ..

# download menu navs
wget -O ncurses-6.1.tar.gz https://invisible-mirror.net/archives/ncurses/ncurses-6.1.tar.gz
tar -xf ncurses-6.1.tar.gz
cd ncurses-6.1
./configure
make
sudo make install
cd ..

# download cmake
wget https://github.com/Kitware/CMake/archive/v3.11.4.tar.gz
tar -xf v3.11.4.tar.gz
cd CMake-3.11.4
./bootstrap && make && sudo make install