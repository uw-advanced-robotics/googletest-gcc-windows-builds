param([string]$MingwBin)

$GOOGLETEST_VERSION_REF = "release-1.10.0"
$env:Path = $MingwBin + ";" + $env:Path
$make = $(Join-Path "$MingwBin" "mingw32-make.exe")
$dist_dir = $(Join-Path $(Resolve-Path "./") dist)

$ErrorActionPreference = "stop"

Remove-Item -Recurse -Force -ErrorAction Ignore googletest
Remove-Item -Recurse -Force -ErrorAction Ignore $dist_dir

mkdir $dist_dir

git clone --branch $GOOGLETEST_VERSION_REF https://github.com/google/googletest.git
cd googletest

mkdir build
cd build

# TODO: capture cmake output to include specific versions in dist
cmake ../ -G "MinGW Makefiles" -DCMAKE_MAKE_PROGRAM="$make" | Tee-Object -FilePath $dist_dir/manifest.txt

if ($LastExitCode -ne 0)
{
    Exit 1
}

& $make -j 2>&1

if ($LastExitCode -ne 0)
{
    Exit 1
}

mkdir $dist_dir/include

cp -r ./lib "$dist_dir/lib"
cp -r ../googletest/include/gtest $dist_dir/include/
cp -r ../googlemock/include/gmock $dist_dir/include/
# Set-Content -Path $dist_dir/manifest.txt -Value $CmakeOutput 

cd ../../
