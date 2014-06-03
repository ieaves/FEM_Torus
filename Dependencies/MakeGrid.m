function [x,y] = MakeGrid(xo,yo)
%{
TITLE: MakeGrid

AUTHOR: Ian Eaves

DESCRIPTION: Generates a list of grid coordinates x, y from two arrays xo,
and yo defined as the 
%}

ty=max(size(yo));
tx=max(size(xo));

[x,y]=meshgrid(xo,yo);
x=reshape(x,ty*tx,1);
y=reshape(y,ty*tx,1);

end