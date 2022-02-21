set(TESTCASE io_ports)

add_executable(${TESTCASE}
    main.c)

target_include_directories(${TESTCASE} PRIVATE
    ${CMAKE_SOURCE_DIR}/include)

add_custom_command(
    TARGET ${TESTCASE}
    POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O verilog $<TARGET_FILE:${TESTCASE}>
            ${CMAKE_CURRENT_BINARY_DIR}/$<TARGET_NAME:${TESTCASE}>.hex
)
