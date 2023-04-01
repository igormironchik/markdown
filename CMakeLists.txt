cmake_minimum_required( VERSION 3.19 )

project( markdown )

set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib )
set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib )
set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )

set( BUILD_MDPDF_TESTS OFF CACHE INTERNAL "" FORCE )

add_subdirectory( md-editor )
add_subdirectory( md-pdf )
