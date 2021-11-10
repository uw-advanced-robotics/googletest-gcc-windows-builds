# Redistributable Windows googletest builds

This repo provides pre-built googletest and googlemock libraries for Windows, compiled using g++
under MinGW.

See the "Releases" section of this repo for the latest builds.

Builds are done solely via GitHub Actions on shared runners and thus are auditable if you so desire.
You can also follow the instructions below to manually build Googletest on your own machine.

## Build environment dependencies

Versions listed are those used by the CI to build new releases. They should be kept in sync with the
CI Workflow.

- Python 3.9.7
- CMake 3.21.2
- WinLibs MinGW toolchain, from https://winlibs.com/. UCRT runtime (64-bit). Version:

  > GCC 11.2.0 + LLVM/Clang/LLD/LLDB 13.0.0 + MinGW-w64 9.0.0 - UCRT - release 2

## Publishing a release on GitHub

Repository maintainers can publish a new release by running the "Build Googletest Release" workflow
against the "master" branch. Do so via the "Actions" tab.

## Building Googletest manually

Find the path at which your MinGW toolchain was extracted.

Open a PowerShell window in this repo and run:

```
.\build.ps1 path\to\winlibs\mingw64\bin\
```

For example, if you extracted it in your Downloads folder:

```
.\build.ps1 C:\Users\User\Downloads\winlibs-x86_64-posix-seh-gcc-11.2.0-llvm-13.0.0-mingw-w64ucrt-9.0.0-r2\mingw64\bin\
```

## Licensing

The code in this repo is licensed under the MIT license.

Googletest is copyrighted and licensed by Google under the BSD 3-Clause license. You can find their
repository [here](https://github.com/google/googletest).
