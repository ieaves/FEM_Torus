function [K] = MakeKinetic3D(x,y,z,area)
%{
TITLE: MakeKinetic

AUTHOR: Ian Eaves

DESCRIPTION: Returns the 3x3 kinetic matrix of an individual
triangle in the tesselation with triagular coordinates x,y,z, and the area
of the triangle.
%}
K=zeros(3,3);

xi=[x,y,z];

dx23=xi(2,:)-xi(3,:);
dx13=xi(1,:)-xi(3,:);
dx12=xi(1,:)-xi(2,:);

K(1,1)=dx23*dx23';
K(2,2)=dx13*dx13';
K(3,3)=dx12*dx12';

K(1,2)=-dx13*dx23';
K(1,3)=dx12*dx23';
K(2,1)=-dx13*dx23';
K(2,3)=-dx12*dx13';
K(3,1)=dx12*dx23';
K(3,2)=-dx12*dx13';
K=K/(4*area);

end

