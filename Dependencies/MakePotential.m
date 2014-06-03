function [V] = MakePotential(Vi,nodes,area)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

Vo=Vi(nodes);

V=[[6,2,2]*Vo,[2,2,1]*Vo,[2,1,2]*Vo;
    [2,2,1]*Vo,[2,6,2]*Vo,[1,2,2]*Vo;
    [2,1,2]*Vo,[1,2,2]*Vo,[2,2,6]*Vo];
V=V*area/120;

end

