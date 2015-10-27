# PLY.jl

Simple interface to PLY library.

Note that the PLY library that the julia code interfaces with is contained within this repository, it should be built and installed first before the julia package will work.


To install

* build and install libply.so , contained within the libply subfolder.

> mkdir PLY.jl/libply/build
> cd PLY.jl/libply/build
> cmake -DBUILD_SHARED_LIBS=ON ../
> make
> sudo make install

* add the PLY.jl to the julia path (ie by installing via Pkg.clone(...)).



Note that the libply folder contains it's own license, separate from the license presented here.
The code is included here so that the library is self-contained as there doesn't appear to be public ply library available for immediate installation (ie via brew/apt-get/yum/etc.)


