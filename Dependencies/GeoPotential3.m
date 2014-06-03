function [V] = GeoPotential3(x,y,z)
%{
TITLE:GeoPotential3

AUTHOR: Ian Eaves

DESCRIPTION: Calculates the geometric potential at the point
[x(1),y(1),z(1)] from the eigenvalues of the covariance matrix dx'*dx
which define a plane whose normal is perpendicular to the surface at
that point. Projecting coordinate differences onto these unit vectors
allows for a direct computation of the curvature from Gauss' fundamental
forms and therefore the geometric potential.
%}

dx=[x(2:end)-x(1),y(2:end)-y(1),z(2:end)-z(1)];

[v,~]=eig(dx'*dx);

mm=dx*[v(:,3),v(:,2),v(:,1)];
ddz=mm(:,3);

mm(:,3)=mm(:,2).^2;
mm(:,2)=2*mm(:,1).*mm(:,2);
mm(:,1)=mm(:,1).^2;

f=(mm'*mm\mm')*ddz;
V=-.5*((f(1)-f(3))^2+4*f(2)^2);
end

