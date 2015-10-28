#module PLY

function plyopen(fn)
	nelems = zeros(Int32,1)
	elem_names = [ ["        ",], ["      ",], ["     ",] ]
	file_type = zeros(Int32,1)
	version = [0.0f0]
	fh = ccall( (:ply_open_for_reading, :libply), 
	            Ptr{Void}, 
							(Ptr{Uint8}, Ptr{Int32}, Ptr{Ptr{Ptr{Uint8}}}, Ptr{Int32}, Ptr{Float32}),
							fn,nelems,elem_names,file_type,version)
	return fh,nelems,elem_names,file_type,version
end

#end # module PLY
