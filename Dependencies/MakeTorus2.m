function [x,y,z,u,v,tri] = MakeTorus2(a,b,c,Ntht,Nphi)
%{
TITLE: MakeTorus2

AUTHOR: Ian Eaves

DESCRIPTION: Generates a grid of uniformly distributed nodes with angular
coordinates (u,v) with Ntht and Nphi intervals between 0 and 2pi. After
generating the grid coordinates u and v, these coordinates are transformed
into x,y,z rectangular coordinates as placed on the surface of a torus with
parameterization radii a,b, and c. Finally a delaunay triangulation is
performed and the triangulation data is returned as well.
%}

[u,v]=MakeGrid(linspace(0,2*pi,Ntht),linspace(0,2*pi,Nphi));

f=cos(v);
x=(a+b*f).*cos(u);
y=(a+b*f).*sin(u);
z=c*sin(v);
[x,y,z]=FixEndpoints(x,y,z);

tri=delaunay(u,v);

end

