add_library(ISR OBJECT isr.c)

target_include_directories(ISR PRIVATE
    ${CMAKE_SOURCE_DIR}/include)
