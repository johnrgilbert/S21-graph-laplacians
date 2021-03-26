function add_evecs(filename)
%  ADD_EVECS : write a file with some Laplacian eigenvectors of a graph
%
% add_evecs(filename)
%
% 'filename.txt' is a triples file for a graph.
% Compute the second through fourth eigenvectors of the graph's Laplacian,
% and write the ascii file 'filename.v'.
% 
% John R. Gilbert, 24 March 2021

IJA = load([filename '.txt']);
nz = size(IJA,1);
n = max(max(IJA(:,1:2)));

A = sparse(IJA(:,1), IJA(:,2), 1, n, n);
L = laplacian(A);
v = fiedler(L, 3);

fid = fopen([filename '.v'], 'w');
fprintf(fid, '%e,%e,%e\n', v');
fclose(fid);

end
