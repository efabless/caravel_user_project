add_library(UartControls STATIC uart_controls.c)

target_include_directories(UartControls PRIVATE
    ${CMAKE_SOURCE_DIR}/include)
