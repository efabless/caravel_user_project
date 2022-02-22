add_library(ISR SHARED isr.c)

target_include_directories(ISR PRIVATE
    ${CMAKE_SOURCE_DIR}/include)
