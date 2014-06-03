function [psipsi] = PsiPsi(OV,psi,varargin)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%calculates the probability of the wavefunction being within a certain
%element of the tesselation and equally distributes that probability over
%the three nodes of that element.

s=size(psi);
psipsi=zeros(s(1),s(2));
for i=1:s(2)
    psipsi(:,i)=conj(psi(:,i)).*(OV*psi(:,i));
end

%add in the future a varargin which allows you to generate the
%probabilities along some defined region rather than the whole.


