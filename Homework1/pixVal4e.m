% f is a grayscale image
% r and c are scalars corresponding to row and column
% v is the pixel value f(r, c)
function v = pixVal4e(f, r, c)
if ~ismatrix(f)
    error('Input is not a gray-scale image.');
end
v = f(r, c);
