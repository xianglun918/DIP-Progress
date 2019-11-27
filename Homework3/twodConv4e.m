% f is the input image
% w is the convolution kernel
% g is the convolution result
function g = twodConv4e(f, w)

% Get the individual sizes
[f_m, f_n] = size(f);
[w_m, w_n] = size(w);

% Rotate the kernel for later use
for i = 1:w_m
    for j = 1:w_n
        w(i, j) = w(w_m + 1 - i, w_n + 1 - j);
    end
end

% Scaling the image
f = intScaling4e(f, 'floating');

% Padding size
pad_m = floor(w_m / 2);
pad_n = floor(w_n / 2);

% Pad the image & Prepare the output
f = padarray(f, [pad_m, pad_n], 'replicate');
g = zeros(f_m + 2 * pad_m, f_n + 2 * pad_n);

% Convolving the image with the kernel
for i = (pad_m + 1):(pad_m + f_m) 
    for j = (pad_n + 1):(pad_n + f_n)
        f_temp = f((i - pad_m):(i + pad_m), (j - pad_n):(j + pad_n));
        conv_out = f_temp .* w;
        g(i, j) = sum(conv_out(:));
    end
end

% Crop out the output
g = g((pad_m + 1):(pad_m + f_m), (pad_n + 1):(pad_n + f_n));

