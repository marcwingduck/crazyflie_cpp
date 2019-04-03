cmake_minimum_required(VERSION 3.8.2)
project(crazyflie_cpp)

#find_library(libusb usb-1.0)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}")
find_package(libusb-1.0 REQUIRED)

# Enable C++11 and warnings
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_compile_options(-Wall -Wextra -Werror)

include_directories(
        include/crazyflie_cpp
        ${LIBUSB_1_INCLUDE_DIR}
)

add_library(crazyflie_cpp
  src/Crazyflie.cpp
  src/CrazyflieUSB.cpp
  src/Crazyradio.cpp
  src/crtp.cpp
  src/USBDevice.cpp
  src/ITransport.cpp
)

target_link_libraries(crazyflie_cpp
        ${LIBUSB_1_LIBRARY}
        )
