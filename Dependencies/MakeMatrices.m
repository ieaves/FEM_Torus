function [H,OV] = MakeMatrices(tri,values_H,values_O)
%UNTITLED4 Summary of this function goes here
%   Generates the sparse matrix Hamiltonian and Overlap matrix from
%   component values and their respective row and column in the matrix.
[rows,columns]=Assemble3(tri);

values_H=reshape(values_H',length(rows),1); 
values_O=reshape(values_O',length(rows),1);

Nv=max(max(tri));
H=sparse(rows,columns,values_H,Nv,Nv);
OV=sparse(rows,columns,values_O,Nv,Nv);

end

