set(TESTCASE la_test1)

add_executable(${TESTCASE}
    main.c)

target_include_directories(${TESTCASE} PRIVATE
    ${CMAKE_SOURCE_DIR}/include)

target_link_libraries(${TESTCASE} PRIVATE CRT0 stub)

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ${CMAKE_SOURCE_DIR}/linker_scripts/sections.lds")

add_custom_command(
    TARGET ${TESTCASE}
    POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O verilog $<TARGET_FILE:${TESTCASE}>
            ${CMAKE_CURRENT_BINARY_DIR}/$<TARGET_NAME:${TESTCASE}>.hex
)
