add_library(stub STATIC stub.c)

target_include_directories(stub PRIVATE
    ${CMAKE_SOURCE_DIR}/include)
