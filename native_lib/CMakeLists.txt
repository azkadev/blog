cmake_minimum_required(VERSION 3.16)

project(blog_library VERSION 0.0.1 LANGUAGES C CXX)
set(CMAKE_CXX_STANDARD 20)
 
message(STATUS "START COMPILE PACKAGE_TEMPLATE")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")

set(blog_shared_dir "lib")
set(blog_exe_dir "bin")
set(prefix_shared_library "lib")
 

if (ANDROID)
 set(package_shared_extension "_${ANDROID_ARCH_NAME}.so")
 set(package_exe_extension "")
 set(package_name "blog_${ANDROID_ARCH_NAME}")
elseif (WIN32)
 set(package_shared_extension ".dll")
 set(package_exe_extension ".exe") 
 set(package_name "blog")
elseif (APPLE)
 set(package_shared_extension ".dylib")
 set(package_exe_extension "") 
 set(package_name "blog")
else()
 set(package_shared_extension ".so")
 set(package_exe_extension "") 
 set(package_name "blog")
endif()


add_library(blog_shared SHARED blog.cpp)
add_executable(blog_exe blog.cpp)

set_target_properties(blog_shared PROPERTIES 
  LIBRARY_OUTPUT_DIRECTORY "${blog_shared_dir}"
  PREFIX "${prefix_shared_library}"
  OUTPUT_NAME "${package_name}"
)

set_target_properties(blog_exe PROPERTIES 
  RUNTIME_OUTPUT_DIRECTORY "${blog_exe_dir}"
  OUTPUT_NAME "${package_name}"
)

if (WIN32)
 set_target_properties(blog_shared PROPERTIES
  WINDOWS_EXPORT_ALL_SYMBOLS ON
)
endif (WIN32)
 
add_custom_command(
  TARGET blog_shared POST_BUILD 
  COMMAND ${CMAKE_STRIP} --strip-debug --strip-unneeded "${blog_shared_dir}/${prefix_shared_library}blog${package_shared_extension}"
)

add_custom_command(
  TARGET blog_exe POST_BUILD 
  COMMAND ${CMAKE_STRIP} --strip-debug --strip-unneeded "${blog_exe_dir}/blog${package_exe_extension}" 
)

 