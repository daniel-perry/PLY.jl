using PLY

fn = "facemodel.ply"

ply,nelems,elem_names,file_type,version = plyopen(fn)

nelems,nprops,datatype = plygetvertexproperties(ply)

println("nelems: ", nelems, ", nprops: ", nprops, ", datatype: ", datatype)

vertices = zeros(Float32, 3, nelems)
plygetvertices(ply, nelems, datatype, vertices)
println("first 10: \n", vertices[:, 1:10])

vertexnormals = zeros(Float32, 3, nelems)
plygetvertexnormals(ply, nelems, datatype, vertexnormals)
println("first 10: \n", vertexnormals[:, 1:10])

plyclose(ply)
