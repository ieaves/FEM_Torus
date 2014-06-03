function [t] = TesselationNeighbors(tri,cnodes)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
m=max(max(tri));
t=cell(m,1);

[stri,ind]=sort(tri(:));
g=ismembc(stri,sort(cnodes(:,2)));
a=stri(g);
for i=1:length(cnodes)
    a(a==cnodes(i,2))=cnodes(i,1);
end
stri(g)=a;
tri(ind)=stri;

[stri,ind]=sort(tri(:));
[r,~]=ind2sub(size(tri),ind);

a=stri(1);
co=1;
cp=co;
i=1;
while i<numel(stri)
    while stri(i)==a && i < numel(stri)
        i=i+1;
    end
    t{a}=vertcat(tri(r(co:i-1),:));
    t{a}=unique(t{a}(t{a}~=a));
    a=stri(i);
    cp=co;
    co=i;
end
t{a}=vertcat(tri(r(cp:end),:));
t{a}=unique(t{a}(t{a}~=a));

for i=1:length(cnodes)
    t{cnodes(i,2)}=t{cnodes(i,1)};
end

end

