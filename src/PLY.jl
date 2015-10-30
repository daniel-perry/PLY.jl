module PLY

export plyopen, plyclose, plygetvertexproperties, plygetvertices, plygetvertexnormals, PLY_CHAR, PLY_SHORT, PLY_INT, PLY_UCHAR, PLY_USHORT, PLY_UINT, PLY_FLOAT, PLY_DOUBLE

const PLY_CHAR = 1
const PLY_SHORT = 2
const PLY_INT = 3
const PLY_UCHAR = 4
const PLY_USHORT = 5
const PLY_UINT = 6
const PLY_FLOAT = 7
const PLY_DOUBLE = 8

function plyopen(fn::ASCIIString)
	nelems = zeros(Int32,1)
	elem_names = Array{ASCIIString,1}[]
	push!(elem_names, ASCIIString[])
	push!(elem_names, ASCIIString[])
	push!(elem_names[1], "testtesttest")
	push!(elem_names[2], "testtesttest")

	file_type = zeros(Int32,1)
	version = [0.0f0]
	ply = ccall( (:ply_open_for_reading, "libplyfile"), 
	            Ptr{Void}, 
							(Ptr{Uint8}, Ptr{Int32}, Ptr{Ptr{Ptr{Uint8}}}, Ptr{Int32}, Ptr{Float32}),
							fn,nelems,elem_names,file_type,version)
	return ply,nelems,elem_names,file_type,version
end

function plygetvertexproperties(ply::Ptr{Void})
	nelems = zeros(Int32,1)
	nprops = zeros(Int32,1)
	datatype = zeros(Int32,1)

	props = ccall( (:ply_get_vertex_properties, "libplyfile"),
	               Ptr{Void},
								 (Ptr{Void}, Ptr{Int32}, Ptr{Int32}, Ptr{Int32}),
								 ply, nelems, nprops, datatype )
	
	return nelems[1],nprops[1],datatype[1]
end

function plygetvertices(ply::Ptr{Void}, nelems, datatype, data::Array{Float32,2})
	nelems = convert(Int32, nelems)
	datatype = convert(Int32, datatype)

	ccall( (:ply_get_vertices, "libplyfile"),
	       Void,
				 (Ptr{Void}, Int32, Int32, Ptr{Float32}),
				 ply, nelems, datatype, pointer(data) )
end

function plygetvertexnormals(ply::Ptr{Void}, nelems, datatype, data::Array{Float32,2})
	nelems = convert(Int32, nelems)
	datatype = convert(Int32, datatype)

	ccall( (:ply_get_vertex_normals, "libplyfile"),
	       Void,
				 (Ptr{Void}, Int32, Int32, Ptr{Float32}),
				 ply, nelems, datatype, pointer(data) )
end


function plyclose(handle::Ptr{Void})
	ccall( (:ply_close, "libplyfile"), 
	        Void,
					(Ptr{Void},),
					handle)
end

end # module PLY
