# Redistributable Windows googletest builds

## Build environment dependencies

Versions listed are those used for the latest build.

- Python 3.9.7
- CMake 3.21.4
- WinLibs MinGW toolchain, from https://winlibs.com/. UCRT runtime (64-bit). Version:

  > GCC 11.2.0 + LLVM/Clang/LLD/LLDB 13.0.0 + MinGW-w64 9.0.0 - UCRT - release 2

## Building Googletest

Find the path at which your MinGW toolchain was extracted.

Open a PowerShell window in this repo and run:

```
.\build.ps1 path\to\winlibs\mingw64\bin\
```

For example, if you extracted it in your Downloads folder:

```
.\build.ps1 C:\Users\User\Downloads\winlibs-x86_64-posix-seh-gcc-11.2.0-llvm-13.0.0-mingw-w64ucrt-9.0.0-r2\mingw64\bin\
```
