function(ASSERT_EQ)
  if(NOT ARGC EQUAL 2)
    message(FATAL_ERROR "assertion failed: invalid argument count: ${ARGC}")
  endif()

  if(NOT "${ARGV0}" STREQUAL "${ARGV1}")
    message(FATAL_ERROR "assertion failed: expect '${ARGV0}' == '${ARGV1}'")
  else()
    message(STATUS "test passed: '${ARGV0}' == '${ARGV1}'")
  endif()
endfunction()

function(ASSERT_NE)
  if(NOT ARGC EQUAL 2)
    message(FATAL_ERROR "assertion failed: invalid argument count: ${ARGC}")
  endif()

  if("${ARGV0}" STREQUAL "${ARGV1}")
    message(FATAL_ERROR "assertion failed: expect '${ARGV0}' != '${ARGV1}'")
  else()
    message(STATUS "test passed: '${ARGV0}' != '${ARGV1}'")
  endif()
endfunction()

function(ASSERT_EMPTY)
  if(NOT ARGC EQUAL 0)
    message(FATAL_ERROR "assertion failed: expect input empty: ARGC='${ARGC}' ARGV='${ARGV}'")
  endif()
endfunction()

function(ASSERT_NOT_EMPTY)
  if(ARGC EQUAL 0)
    message(FATAL_ERROR "assertion failed: expect input none empty: ARGC='${ARGC}' ARGV='${ARGV}'")
  endif()
endfunction()

function(ASSERT_DEFINED value)
  if(DEFINED ${value})
    message(STATUS "test passed: '${value}' was defined")
  else()
    message(FATAL_ERROR "assertion failed: expect '${value}' be defined")
  endif()
endfunction()

function(ASSERT_NOT_DEFINED value)
  if(DEFINED ${value})
    message(FATAL_ERROR "assertion failed: expect '${value}' was not defiend, but got '${${value}}'")
  else()
    message(STATUS "test passed: '${value}' is not defined")
  endif()
endfunction()

function(ASSERT_TRUE value)
  if(${${value}})
    message(STATUS "test passed: '${value}' is true")
  else()
    message(FATAL_ERROR "assertion failed: expect '${value}' be true, but got '${${value}}'")
  endif()
endfunction()

function(ASSERT_FALSE value)
  if(${${value}})
    message(FATAL_ERROR "assertion failed: expect '${value}' be false, but got '${${value}}'")
  else()
    message(STATUS "test passed: '${value}' is false")
  endif()
endfunction()

function(ASSERT_FAILED)
  message(FATAL_ERROR "assertion failed: ${ARGN}")
endfunction()

function(ASSERT_EXISTS file)
  if(EXISTS ${file})
    message(STATUS "test passed: '${file}' exists")
  else()
    message(FATAL_ERROR "assertion failed: expect file ${file} exist")
  endif()
endfunction()

function(ASSERT_NOT_EXISTS file)
  if(NOT EXISTS ${file})
    message(STATUS "test passed: '${file}' does not exist")
  else()
    message(FATAL_ERROR "assertion failed: expect file ${file} does not exists")
  endif()
endfunction()
