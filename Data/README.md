# Data

##### Sample graphs

Each file pertains to one graph, whose name is the root of the file. The contents are:

- **graphname.txt**: The edges in the graph, as ascii text, one per line.
- **graphname.v**: The eigenvectors $w_2$ (the Fiedler vector), $w_3$, and $w_4$.  Ascii text, one row per vertex and one column per vector.
- **graphname.xy**: Two-dimensional coordinates for the vertices, if the graph came from a mesh of some sort. Ascii text, one row per vertex.
- **graphname.jld2**: A Julia load file containing the graph Laplacian and information as Julia data structures in the variables $L$, $v$, and $xy$.
- **graphname.mat**: A Matlab load file containing the graph Laplacian and information as Matlab data structures in the variables $L$, $v$, and $xy$.

