function [p,q,r,s] = dmpermg(A);
% DMPERMG : Dulmage-Mendelsohn permutation with nonzero diagonal.
%
% [p,q,r,s] = dmpermg(A)
% returns row and colum permutations and block boundaries as dmperm,
% permuting the non-square blocks so that A(p,q) has nonzeros in 
% every position on the longest possible superdiagonal.
% Both p and q are returned; there is no counterpart to p=dmperm(A).
%
% Input:  matrix A
% Output: permutations p and q such that A(p,q) is in block upper
% triangular form; optionally, integer vectors r and s that describe
% the boundaries of the blocks.  The kth block of A(p,q) has indices 
% (r(k):r(k+1)-1,s(k):s(k+1)-1).  When A is square, r==s.
%
% In graph theoretic terms, the diagonal blocks correspond to strong
% Hall components of the adjacency graph of A.
%
% See also DMPERM, DMSPY, COMPONENTS, SPRANK.
%
% John Gilbert, 20 Feb 2002.

if nargout < 2
    error('returns both row and col permutations; see DMPERM for row perm only');
end;

[nr,nc] = size(A);
[p,q,r,s] = dmperm(A);
nb = length(r)-1;

% Vertical block
if nr-r(nb) > nc-s(nb)
    rows = p(r(nb):nr);
    cols = q(s(nb):nc);
    B = A(rows,cols);
    [nrb,ncb] = size(B);
    pb = dmperm(B);
    map = ones(1,nrb);
    map(pb) = zeros(1,ncb);
    notpb = find(map);
    p(r(nb):r(nb)+ncb-1) = rows(pb);
    p(r(nb)+ncb:nr) = rows(notpb);
end;

% Horizontal block
if r(2) < s(2)
    rows = p(1:r(2)-1);
    cols = q(1:s(2)-1);
    B = A(rows,cols);
    [nrb,ncb] = size(B);
    pb = dmperm(B');
    map = ones(1,ncb);
    map(pb) = zeros(1,nrb);
    notpb = find(map);
    q(1:ncb-nrb) = cols(notpb);
    q(ncb-nrb+1:ncb) = cols(pb);
end;