cmake_minimum_required(VERSION 3.0.0)
project(swig_example VERSION 0.1.0)

# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -Wall -Wextra -Wno-unused-parameter")
add_compile_options(-std=c++14 -Wall -Werror=return-type -Werror=reorder -O3)
set(CMAKE_POSITION_INDEPENDENT_CODE ON) # -fpic

include_directories(include)
# set_target_properties(functions PROPERTIES PUBLIC_HEADER "functions.h")

add_library(functions SHARED src/functions.cpp)

add_executable(${PROJECT_NAME}  
    src/main.cpp
    # src/functions.cpp
    # src/functions_wrap.c
)

target_link_libraries(${PROJECT_NAME} functions)

# install(TARGETS ${PROJECT_NAME} functions
#         RUNTIME DESTINATION bin
#         LIBRARY DESTINATION lib
#         ARCHIVE DESTINATION lib/static
#         PUBLIC_HEADER DESTINATION include)

# Add swig subdirectory
add_subdirectory(swig)