PROJECT( ply )
cmake_minimum_required(VERSION 2.8)  

#Match everything when analyzing dependencies
INCLUDE_REGULAR_EXPRESSION("^.*$")
OPTION (BUILD_SHARED_LIBS "Build shared libraries" OFF)

IF (WIN32 AND MSVC)
  ADD_DEFINITIONS(-D_SCL_SECURE_NO_WARNINGS)
  ADD_DEFINITIONS(-D_CRT_SECURE_NO_WARNINGS)
ENDIF (WIN32 AND MSVC)

INCLUDE_DIRECTORIES(${CMAKE_SOURCE_DIR})

SET (	ply_HDRS
			ply.h
)
SET( 	ply_SRCS
			plyfile.c
)
ADD_LIBRARY( ply	
						 ${ply_SRCS}
						 ${ply_HDRS}
							)

SET( plytest_SRCS
     plytest.c
)
SET ( plytest_HDRS
			ply.h
)
ADD_EXECUTABLE( plytest
                ${plytest_SRCS}
                ${plytest_HDRS}
				      )
TARGET_LINK_LIBRARIES( plytest ply ) 

INSTALL(TARGETS ply LIBRARY DESTINATION lib)
INSTALL(FILES ${ply_HDRS} DESTINATION include)
