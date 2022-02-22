add_library(CRT0 OBJECT crt0_vex.s)

target_link_libraries(CRT0 PRIVATE ISR)
