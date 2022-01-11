# Wrapping C/C++ for Python using SWIG

## Setup:

- Install SWIG
    > $ sudo apt-get install swig

## Steps:

1. Create C++ functions or class `functions`
2. Create SWIG interface `functions.i`
```py
/* File: example.i */
%module example

%{
    #define SWIG_FILE_WITH_INIT
    #include "Example.hpp"
%}

%include "Example.hpp"
```
3. Create `CMakeLists.txt` files
   1. On root folder to add C++ library
    ```cmake
    set(CMAKE_POSITION_INDEPENDENT_CODE ON) # same as -fPIC which tells GCC to generate position-independent code (PIC) suitable for use in a shared library.
    
    add_library(functions SHARED src/functions.cpp)
    target_link_libraries(${PROJECT_NAME} functions)
    ```
   2. On swig folder to setup swig
   ```cmake
   find_package( SWIG REQUIRED )
   include( ${SWIG_USE_FILE} )
   ```
   3. On python folder to setup python, crete the swig library and install them as python packages (checkout the entire `CMakeLists.txt` inside /swig/python)
4. Create `setup.py.in` inside /swig/python to install the python package

## Folder structure
```
├── CMakeLists.txt
├── include
│   └── functions.hpp -> functions lid
├── src
│   ├── functions.cpp -> functions lid
│   └── main.cpp -> use functions lib in C++
└── swig
    ├── CMakeLists.txt -> include swig dependencies
    ├── functions.i -> swig interface
    └── python -> include python dependencies and install new python package
        ├── CMakeLists.txt
        ├── setup.py.in -> setup file to install python package
        └── test.py -> use functions lib in Python
```

## Build:
``` bash
$ mkdir build && cd build
$ cmake ..
$ make
$ make install-python
```

## Run:
```bash
$ python3 swig/python/test.py
```