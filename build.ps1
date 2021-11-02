param([string]$MingwBin)

$env:Path = $MingwBin + ";" + $env:Path

#git clone --branch release-1.10.0 https://github.com/google/googletest.git
cd googletest

rm -r build
mkdir build
cd build

cmake ../ -G "MinGW Makefiles" -DCMAKE_MAKE_PROGRAM="$(Join-Path "$MingwBin" "mingw32-make.exe")"
# & make -j
& $(Join-Path "$MingwBin" "mingw32-make.exe") -j
