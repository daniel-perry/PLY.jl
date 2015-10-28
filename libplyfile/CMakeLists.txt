PROJECT( plyfile )
cmake_minimum_required(VERSION 2.8)  

#Match everything when analyzing dependencies
INCLUDE_REGULAR_EXPRESSION("^.*$")
OPTION (BUILD_SHARED_LIBS "Build shared libraries" OFF)

IF (WIN32 AND MSVC)
  ADD_DEFINITIONS(-D_SCL_SECURE_NO_WARNINGS)
  ADD_DEFINITIONS(-D_CRT_SECURE_NO_WARNINGS)
ENDIF (WIN32 AND MSVC)

INCLUDE_DIRECTORIES(${CMAKE_SOURCE_DIR})

SET (	plyfile_HDRS
			plyfile.h
)
SET( 	plyfile_SRCS
			plyfile.c
)
ADD_LIBRARY( plyfile	
						 ${plyfile_SRCS}
						 ${plyfile_HDRS}
							)

SET( plyfiletest_SRCS
     plyfiletest.c
)
SET ( plyfiletest_HDRS
			plyfile.h
)
ADD_EXECUTABLE( plyfiletest
                ${plyfiletest_SRCS}
                ${plyfiletest_HDRS}
				      )
TARGET_LINK_LIBRARIES( plyfiletest plyfile ) 

INSTALL(TARGETS plyfile LIBRARY DESTINATION lib)
INSTALL(FILES ${plyfile_HDRS} DESTINATION include)
