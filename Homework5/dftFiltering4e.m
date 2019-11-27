% g is the output of f filtered by H
% f -> input image; H -> transfer function
% padmode -> 'replicate' or 'zeros' or 'none'
% scaling -> 'yes' or 'no'
function g = dftFiltering4e(f, H, padmode, scaling)
% Handling inadequate params
if nargin == 2
    padmode = 'none';
    scaling = 'no';
elseif nargin == 3
    scaling = 'no';
end
% Examine size - 1
[m, n] = size(f);
% Padding - 2
if strcmp(padmode, 'replicate')
    f = padarray(f, [m, n], 'replicate', 'post');
elseif strcmp(padmode, 'zeros')
    f = padarray(f, [m, n], 0, 'post');
end
% Check the size of f and H
if size(f) ~= size(H)
    error("Size unmatched. Check padding type.")
end
% Centralization - 3
f = minusOne4e(f);
% Compute DFT - 4
f = fft2(f);
% Transfer - 5
g = f .* H;
% IDFT and Re-centralization - 6
g = minusOne4e(real(ifft2(g)));
% Crop back to m * n
g = g(1:m, 1:n);
if strcmp(scaling, 'yes')
    g = intScaling4e(g);
end

