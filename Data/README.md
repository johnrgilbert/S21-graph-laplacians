# Data

##### Sample graphs

Each file pertains to one graph, whose name is the root of the file. The contents are:

- **name.txt**: The edges in the graph, as ascii text, one per line.
- **name.v**: The eigenvectors $\lambda_2$, $\lambda_3$, and $\lambda_4$, as ascii text.
- **name.xy**: Two-dimensional coordinates for the vertices, if the graph came from a mesh of some sort.
- **name.jld2**: A Julia load file containing the graph as Julia data structures in the variables L, v, and xy.
- **name.mat**: A Matlab load file containing the graph as Matlab data structures in the variables L, v, and xy.

