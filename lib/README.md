# libply

This is a simple c library downloaded from here:
http://paulbourke.net/dataformats/ply/

Which contain the following copyright statement (note the permission to use, copy, modify, and distribute).
I've also copied the copyright statement unchanged into LICENSE.txt
This code has only been slightly modified to compile on my system and then a CMakeLists.txt file added which organizes the code into a library called "libply.a" and a test executable called "plytest".
CMake allows you to build the library as either a static (default) or dynamic library, as needed.


Header from source files:

Header for PLY polygon files.

- Greg Turk, March 1994

A PLY file contains a single polygonal _object_.

An object is composed of lists of _elements_.  Typical elements are
vertices, faces, edges and materials.

Each type of element for a given object has one or more _properties_
associated with the element type.  For instance, a vertex element may
have as properties three floating-point values x,y,z and three unsigned
chars for red, green and blue.

---------------------------------------------------------------

Copyright (c) 1994 The Board of Trustees of The Leland Stanford
Junior University.  All rights reserved.   
  
Permission to use, copy, modify and distribute this software and its   
documentation for any purpose is hereby granted without fee, provided   
that the above copyright notice and this permission notice appear in   
all copies of this software and that you do not sell the software.   
  
THE SOFTWARE IS PROVIDED "AS IS" AND WITHOUT WARRANTY OF ANY KIND,   
EXPRESS, IMPLIED OR OTHERWISE, INCLUDING WITHOUT LIMITATION, ANY   
WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.   



