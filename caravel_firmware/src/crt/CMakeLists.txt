add_library(CRT0 SHARED crt0_vex.s)

target_link_libraries(CRT0 PRIVATE ISR)
