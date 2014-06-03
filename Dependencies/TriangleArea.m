function [area] = TriangleArea(x,y,z)
%TriangleArea
%   Calculates the area of a triangle defined by the list of x, y, and z
%   coordinates using Heron's formula.

xi=[x,y,z];

a=((xi(1,:)-xi(2,:))*(xi(1,:)-xi(2,:))')^(.5);
b=((xi(1,:)-xi(3,:))*(xi(1,:)-xi(3,:))')^(.5);
c=((xi(2,:)-xi(3,:))*(xi(2,:)-xi(3,:))')^(.5);

s=.5*(a+b+c);

area=(s*(s-a)*(s-b)*(s-c))^.5;

end
