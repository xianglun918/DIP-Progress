% r, c are rows and colomns obtained
% v is the pixel value at (r, c)
% f is the input image
function [r, c, v] = cursorValue4e(f)
imshow(f);
[x, y] = ginput(1);
mat = floor([x, y]);
r = mat(2);
c = mat(1);
v = pixVal4e(f, r, c);
