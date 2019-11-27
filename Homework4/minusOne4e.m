% g is the output image
% f is the input image to be transformed
function g = minusOne4e(f)
% Check if the input is floating point
if isfloat(f) ~= 1
    error("The input image is not floating point.");
end
% Perform the operation
[m, n] = size(f);
g = zeros(m, n);
for i = 1:m
    for j = 1:n
        g(i, j) = f(i, j) * (-1) .^ (i + j);
    end
end
