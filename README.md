# Redistributable Windows googletest builds

## Build environment dependencies

Versions listed are those used for the latest build.

- Python 3.9.7
- CMake 3.21.4
- WinLibs MinGW toolchain, from https://winlibs.com/. UCRT runtime (64-bit). Version:

  > GCC 11.2.0 + LLVM/Clang/LLD/LLDB 13.0.0 + MinGW-w64 9.0.0 - UCRT - release 2

- mingw32-base, msys-base



```
export PATH="$PATH:/C/Program Files/CMake/bin"
```

-----


Install msys2

```
pacman -S make
```