% (m, m) is the size of the desired kernel
% sig, K are two parameters used to calculate
function w = gaussKernel4e(m, sig, K)

% If K is not given
if nargin < 3
    K = 1;
end

pad_m = floor(m / 2);

% Define the kernel
w = zeros(m, m);

% Create the template 
for i = 1:m
    for j = 1:m
        dis_m = abs(pad_m + 1 - i);
        dis_n = abs(pad_m + 1 - j);
        w(i, j) = K * exp(-(dis_m .^ 2 + dis_n .^ 2) / (2 * sig .^2));
    end
end

% Normalization Process
sum_w = sum(w(:));
w = w / sum_w;
% w = w / sqrt(2 * pi * (sig .^ 2));

