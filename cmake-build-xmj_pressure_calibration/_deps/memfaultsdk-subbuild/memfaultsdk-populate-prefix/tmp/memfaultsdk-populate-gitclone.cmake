
if(NOT "/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-subbuild/memfaultsdk-populate-prefix/src/memfaultsdk-populate-stamp/memfaultsdk-populate-gitinfo.txt" IS_NEWER_THAN "/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-subbuild/memfaultsdk-populate-prefix/src/memfaultsdk-populate-stamp/memfaultsdk-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-subbuild/memfaultsdk-populate-prefix/src/memfaultsdk-populate-stamp/memfaultsdk-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/local/bin/git"  clone --no-checkout "https://github.com/memfault/memfault-firmware-sdk.git" "memfaultsdk-src"
    WORKING_DIRECTORY "/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/memfault/memfault-firmware-sdk.git'")
endif()

execute_process(
  COMMAND "/usr/local/bin/git"  checkout 0.16.1 --
  WORKING_DIRECTORY "/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: '0.16.1'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/local/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-subbuild/memfaultsdk-populate-prefix/src/memfaultsdk-populate-stamp/memfaultsdk-populate-gitinfo.txt"
    "/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-subbuild/memfaultsdk-populate-prefix/src/memfaultsdk-populate-stamp/memfaultsdk-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-subbuild/memfaultsdk-populate-prefix/src/memfaultsdk-populate-stamp/memfaultsdk-populate-gitclone-lastrun.txt'")
endif()

