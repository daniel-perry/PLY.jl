#module PLY

function plyopen(fn::ASCIIString)
	nelems = zeros(Int32,1)
	elem_names = Array{ASCIIString,1}[]
	push!(elem_names, ASCIIString[])
	push!(elem_names, ASCIIString[])
	push!(elem_names[1], "testtesttest")
	push!(elem_names[2], "testtesttest")

	println(typeof(elem_names))
	file_type = zeros(Int32,1)
	version = [0.0f0]
	fh = ccall( (:ply_open_for_reading, "libplyfile"), 
	            Ptr{Void}, 
							(Ptr{Uint8}, Ptr{Int32}, Ptr{Ptr{Ptr{Uint8}}}, Ptr{Int32}, Ptr{Float32}),
							fn,nelems,elem_names[1],file_type,version)
	return fh,nelems,elem_names,file_type,version
end

function plyclose(handle::Ptr{Void})
	ccall( (:ply_close, "libplyfile"), 
	        Void,
					(Ptr{Void},),
					handle)
end

#end # module PLY
