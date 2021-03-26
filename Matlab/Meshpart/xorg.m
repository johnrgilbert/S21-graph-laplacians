function C = xorg(A,B)
% XORG : exclusive or
%
% C = xorg(A,B) returns a matrix the same size as A and B,
%     with ones where exactly one of A and B is zero, 
%     and with zeros elsewhere.
%
% xorg(A,B) is the same as Matlab's xor(A,B), 
%           but it uses less memory if A and B are sparse.
%
% John Gilbert, 15 Mar 2002

C = (A|B) - (A&B);