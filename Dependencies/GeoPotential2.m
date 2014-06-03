function [V] = GeoPotential2(v,a,b,c)
%{
TITLE:GeoPotential2v

AUTHOR: Ian Eaves

DESCRIPTION: Generates the geometric potential at a nodal coordinate (u,v)
for a torus with radii a,b, and c through the analytic expression for the
potential.
%}
sinv=sin(v);
cosv=cos(v);

%V=(-1/8)*c^2*(c^2*cosv^2+b^2*sinv^2)^(-3)*(a+b*cosv)^(-2)*(cosv^3*(b^2-c^2)+a*b)^2;


V=(-c^2/8)*(c^2*cosv.^2+b^2*sinv.^2).^(-3).*(a+b*cosv).^(-2).*(cosv.^3.*(b^2-c^2)+a*b).^2;
end

