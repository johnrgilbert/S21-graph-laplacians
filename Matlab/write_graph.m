function write_graph(filename, A, xy)
% WRITE_GRAPH : write ascii triples file for a graph and optionally its coordinates
%
% write_graph(filename, A, xy)
%
% A is the adjacency matrix of a graph. 
% Values of nonzeros are ignored. The matrix is symmetrized.
% If present, xy has 2-D vertex coordinates as rows.
% This writes the ascii files 'filename.txt' and, optionally, 'filename.xy'.
% 
% John R. Gilbert, 22 March 2021

A = A - diag(diag(A));
A = triu(double(A|A'));
[I, J] = find(A);
nz = length(I);
n = length(A);

fid = fopen([filename '.txt'], 'w');
for i = 1:nz
    fprintf(fid, '%d,%d,1.0\n', I(i), J(i));
end;
fclose(fid);

if nargin < 3
    return;
end;

if size(xy,1) ~= n || size(xy,2) ~= 2
    error('xy is the wrong size');
end;

fid = fopen([filename '.xy'], 'w');
fprintf(fid, '%e,%e\n', xy');
fclose(fid);
