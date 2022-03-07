add_library(CRT0 STATIC crt0_vex.s)

target_link_libraries(CRT0 PRIVATE ISR)
