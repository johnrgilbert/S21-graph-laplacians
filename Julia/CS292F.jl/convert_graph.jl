using DelimitedFiles
using FileIO
using JLD2
using Laplacians
using Printf

"""
    write_jld2(graphname::String, quiet=false)
Read a graph from 'graphname.txt',
vertex coordinates from 'graphname.xy' (if present),
and eigenvectors from 'graphname.v' (if present),
and create 'graphname.jld2' containing it all.
"""
function write_jld2(graphname::String, quiet::Bool=false)

    # For safety, do nothing if the output file exists
    if isfile(graphname*".jld2")
        println(graphname*".jld2 already exists, will not change it.")
        return
    end
    if !quiet print(graphname*": "); end
    D = Dict{String, Any}()
    D["graphname"] = graphname

    # Read the graph and get its Laplacian
    L = lap(read_graph(graphname * ".txt"))
    nvtxs = size(L,1)
    if !quiet @printf "%d vertices; " nvtxs; end
    D["L"] = L

    # Read the vertex coordinates if present
    if isfile(graphname*".xy")
        xy = readdlm(graphname*".xy", ',', Float64)
        if size(xy,1) == nvtxs
            D["xy"] = xy
            if !quiet @printf "%d-D coordinates; " size(xy,2); end
        else
            println("\n"*graphname*".xy has the wrong number of rows.")
        end
    end

    # Read the eigenvectors if present
    if isfile(graphname * ".v")
        v = readdlm(graphname * ".v", ',', Float64)
        if size(v,1) == nvtxs
            D["v"] = v
            if !quiet @printf "%d eigenvectors; " size(v,2); end
        else
            println("\n"*graphname*".v has the wrong number of rows.")
        end
    end

    # Write the .jld2 file
    save(graphname * ".jld2", D)
    if !quiet println(graphname*".jld2 written."); end

    return 
end
