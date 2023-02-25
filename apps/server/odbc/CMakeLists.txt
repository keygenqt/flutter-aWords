CMAKE_MINIMUM_REQUIRED (VERSION 3.22.1)
project(dart_odbc VERSION 0.0.1)

## Libs
add_library(dart_odbc SHARED hello.c)
target_link_libraries(dart_odbc -lodbc)
target_link_libraries(dart_odbc -lltdl)

set_target_properties(dart_odbc PROPERTIES
    PUBLIC_HEADER hello.h
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "dart_odbc"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
)

## App
add_executable(main "main.c")
target_link_libraries(main -l:libodbc.a)
target_link_libraries(main -l:libltdl.a)