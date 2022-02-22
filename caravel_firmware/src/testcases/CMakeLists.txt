add_subdirectory(io_ports)
add_subdirectory(la_test1)
add_subdirectory(la_test2)
add_subdirectory(wb_port)

# foreach(TESTCASE )
#     add_custom_command(
#         TARGET ${TESTCASE}
#         POST_BUILD
#         COMMAND ${CMAKE_OBJCOPY} -O verilog $<TARGET_FILE:${TESTCASE}>
#                 ${CMAKE_CURRENT_BINARY_DIR}/$<TARGET_NAME:${TESTCASE}>.hex
#     )
