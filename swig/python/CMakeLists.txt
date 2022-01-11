# Setup Python
find_package (Python3 COMPONENTS Interpreter Development)
include_directories(${Python3_INCLUDE_DIRS})
link_libraries(${Python3_LIBRARIES})

set(CMAKE_SWIG_FLAGS "")

# Add a swig library
set_property(SOURCE ../functions.i PROPERTY CPLUSPLUS ON)
swig_add_library(functions LANGUAGE python SOURCES ../functions.i ../../src/functions.cpp)
swig_link_libraries(functions ${PYTHON3_LIBRARIES})

# Files to install with Python
set(PYTHON_INSTALL_FILES
        ${CMAKE_CURRENT_BINARY_DIR}/functions.py
        ${CMAKE_CURRENT_BINARY_DIR}/_functions.so)

# Configure setup.py and copy to output directory
set(SETUP_PY_IN ${CMAKE_CURRENT_SOURCE_DIR}/setup.py.in)
set(SETUP_PY_OUT ${CMAKE_CURRENT_BINARY_DIR}/setup.py)
configure_file(${SETUP_PY_IN} ${SETUP_PY_OUT})

# Use generated setup.py to install target
add_custom_target(install-python DEPENDS _functions COMMAND python3 ${SETUP_PY_OUT} install)
