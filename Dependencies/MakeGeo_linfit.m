function [V] = MakeGeo_linfit(x,y,z,node,t)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

V=GeoPotential3([x(node);x(t)],[y(node);y(t)],[z(node);z(t)]);

end

