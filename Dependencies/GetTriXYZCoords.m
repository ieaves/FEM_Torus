function [x,y,z] = GetTriXYZCoords(xa,ya,za,tri)
%{
TITLE:GetTriXYZCoords

AUTHOR: Ian Eaves

DESCRIPTION: Returns the x,y,z coordinates from the list of all coordinates
in the tesselation xa, ya, za based on the triangular element being analyzed
tri.
%}

%Reorders input coordinates according to the node list tri.
x=xa(tri);
y=ya(tri);
z=za(tri);

end

