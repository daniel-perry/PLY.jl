# PLY.jl

## Installation

Simple interface to PLY library.

Note that the PLY library that the julia code interfaces with is contained within this repository, it should be built and installed first before the julia package will work.


To install

* build and install libply.so , contained within the libplyfile subfolder.

> mkdir PLY.jl/libplyfile/build
> cd PLY.jl/libplyfile/build
> cmake -DBUILD_SHARED_LIBS=ON ../
> make
> sudo make install

* add the PLY.jl to the julia path (ie by installing via Pkg.clone(...)).


## License

Note that the libply folder contains it's own license, separate from the license presented here.
The code is included here so that the library is self-contained as there doesn't appear to be public ply library available for immediate installation (ie via brew/apt-get/yum/etc.)

Please see the below files for additional details:
License.txt
libply/License.txt
libply/README.md
