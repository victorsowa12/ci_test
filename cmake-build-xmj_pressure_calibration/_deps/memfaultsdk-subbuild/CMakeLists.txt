# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.18.3)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(memfaultsdk-populate NONE)

include(ExternalProject)
ExternalProject_Add(memfaultsdk-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://github.com/memfault/memfault-firmware-sdk.git" "GIT_TAG" "0.16.1"
                    SOURCE_DIR          "/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-src"
                    BINARY_DIR          "/Users/victorsowa/xMoonJelly_fw/cmake-build-xmj_pressure_calibration/_deps/memfaultsdk-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)


