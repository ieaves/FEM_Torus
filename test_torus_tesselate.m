%{
TITLE: Test_trefoilknot_tesselate

AUTHOR: Ian Eaves

DESCRIPTION: Overarching FEM code for toroidal systems. New potentials can
be added by calling the associated potential function for a 3x3 matrix and
then adding each term into the hamiltonian. This code can be extended to
alternative goemetries by defining a new Make<Shape> function equivalent to
MakeTorus2 and modifying the geometric potential for that shape as well.
%}
%%

num=10; %number of eigenvalues to solve for

nline=100; %number of nodes along the length of the torus
ntube=100; %number of nodes around the tube portion of the torus

%parameters for an elliptical torus
a=3; %varies the radius of the torus
b=1.5; %half the length of the elliptical major axis
c=1; %length of the ellipticla minor axis

[x,y,z,u,v,tri]=MakeTorus2(a,b,c,nline,ntube);

%%
%Pre-allocate the overlap matrix and the Hamiltonian
Nt=length(tri);

O=zeros(3,3);
Ho=zeros(3,3);

values_H=zeros(Nt,9);
values_O=zeros(Nt,9);

%determines which nodes are connected by periodic BC's, more extensible
%versions which walk the boundary exist
cnodes=ConnectedNodes(nline,ntube);

%calculate the geometric potential at each node
%V=GeoPotential2(v,a,b,c); %analytic solver
V=MakeGeoPotential(x,y,z,'lin fit',tri,cnodes); %numeric solver
%%

for i=1:Nt
    %returns the x, y, z coordinates for the 3 nodes of the ith triangle
    [xc,yc,zc]=GetTriXYZCoords(x,y,z,tri(i,:));
    
    %Determines the area of an individual triangle in the tesselation
    area=2*TriangleArea(xc,yc,zc);
    
    %Generates the 3x3 overlap matrix for the above x,y,z coordinates
    O=TriOverlap(area);
   
    %Generates the 3x3 Kinetic matrix for the above x,y,z coordinates
    Ho=MakeKinetic3D(xc,yc,zc,area);
    
    Ho=Ho+MakePotential(V,tri(i,:),area); 
    
    values_H(i,:)=Ho(:);
    values_O(i,:)=O(:);
end

%%

%create sparse matrices from calculated Hamiltonian and overlap matrix
[H,OV]=MakeMatrices(tri,values_H,values_O);

%apply Boundary Matching
OV=PeriodicBCs(OV,cnodes);
H=PeriodicBCs(H,cnodes);

%Calculate eigenvalues and vectors of geometry
[E_Val,psi,psi2]=EigenProcess(H,OV,num);
E_Val

[x,y,z,u,v,tri]=MakeTorus2(a,b,c,nline-1,ntube-1);
%psi2=PsiPsi([x,y,z],tri,psi(:,1));

PlotSurface(tri,x,y,z,psi(:,1),'interp','axis equal','colorbar');

