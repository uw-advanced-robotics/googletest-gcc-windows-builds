param([string]$MingwBin)

$ErrorActionPreference = "stop"

$GOOGLETEST_VERSION_NUMBER = "1.10.0"
$GOOGLETEST_VERSION_REF = "release-" + $GOOGLETEST_VERSION_NUMBER

$env:Path = $MingwBin + ";" + $env:Path

$make = $(Join-Path "$MingwBin" "mingw32-make.exe")
$dist_parent_dir = $(Join-Path $(Resolve-Path "./") dist)
# the directory which will appear in the unzipped contents (i.e., the singular directory within the zip)
$dist_dir = $(Join-Path $dist_parent_dir ("googletest-g++-win-" + $GOOGLETEST_VERSION_NUMBER))
$packaging_dir = $(Join-Path $(Resolve-Path "./") packaging)

Remove-Item -Recurse -Force -ErrorAction Ignore googletest
Remove-Item -Recurse -Force -ErrorAction Ignore $dist_parent_dir

mkdir $dist_parent_dir
mkdir $dist_dir

git clone --branch $GOOGLETEST_VERSION_REF https://github.com/google/googletest.git
Set-Location googletest

mkdir build
Set-Location build

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

Copy-Item -r ./lib "$dist_dir/lib"
Copy-Item -r ../googletest/include/gtest $dist_dir/include/
Copy-Item -r ../googlemock/include/gmock $dist_dir/include/
Copy-Item $packaging_dir/install.bat $dist_dir/

Set-Location ../../
