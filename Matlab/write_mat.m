function write_mat(graphname, quiet)
%  WRITE_MAT : save a Laplacian and some info as a .mat file
%
% Read a graph from 'graphname.txt',
% vertex coordinates from 'graphname.xy' (if present),
% and eigenvectors from 'graphname.v' (if present),
% and create 'graphname.mat' containing it all.
% If the optional second argument 'quiet' is true, don't print anything.
% 
% John R. Gilbert, 25 March 2021

if nargin < 2, quiet = false; end

% For safety, do nothing if the output file exists
if exist(['./' graphname '.mat']) == 2
    fprintf([graphname '.mat already exists, will not change it.\n'])
    return
end
if ~quiet, fprintf([graphname ': ']); end

% Read the graph and get its Laplacian
IJA = load([graphname '.txt']);
nvtxs = max(max(IJA(:,1:2)));

A = sparse(IJA(:,1), IJA(:,2), 1, nvtxs, nvtxs);
L = laplacian(A);
if ~quiet, fprintf('%d vertices; ', nvtxs); end

% Read the vertex coordinates if present
if exist(['./' graphname '.xy']) == 2
    xy = load([graphname '.xy']);
    if size(xy,1) == nvtxs
        if ~quiet, fprintf('%d-D coordinates; ', size(xy,2)); end
    else
        fprintf(['\n' graphname '.xy has the wrong number of rows.\n'])
    end
end

% Read the eigenvectors if present
if exist(['./' graphname '.v']) == 2
    v = load([graphname '.v']);
    if size(v,1) == nvtxs
        if ~quiet, fprintf('%d eigenvectors; ', size(v,2)); end
    else
        fprintf(['\n' graphname '.v has the wrong number of rows.\n'])
    end
end

% Write the .mat file
clear nvtxs
clear IJA
clear A
if quiet
    clear quiet
    save(graphname)
else
    clear quiet
    save(graphname)
    fprintf([graphname '.mat written.\n'])
end

return 
end
