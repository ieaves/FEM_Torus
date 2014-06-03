function [noindex] = ConnectedNodes(Nline,Ntube)
%{
TITLE: ConnectedNodes

AUTHOR: Ian Eaves

DESCRIPTION: Generates a list of periodically connected nodes for a torus
    with Nline and Ntube nodes in the u,v plane.

Arguments: 
noindex:    [N,2] matrix of matching node indices (N is the number of
            duplicate nodes) where N(1,:)=[1,10] means node 1 and 10 are 
            the same (periodically connected).
%}


noindex=zeros(Nline+Ntube-1,2);
x=Nline-1;

noindex(1:(Ntube-1),:)=[(1:Ntube-1)',(Ntube*x+1:Ntube*Nline-1)'];
noindex(Ntube:length(noindex)-1,:)=[(1:Ntube:Ntube*x-1)',(Ntube:Ntube:Ntube*Nline-2)'];

noindex(end,:)=[1,Nline*Ntube];

noindex=sortrows(noindex);
end
