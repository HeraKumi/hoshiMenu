rm -rf build

if [ !  -d "build"  ]; then
  mkdir build
  cd build
  cmake ..
  make
  echo "done"
fi
