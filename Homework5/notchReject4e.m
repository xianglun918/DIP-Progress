% This function implements an M * N notch reject filter transfer function
% of specified type
function H = notchReject4e(type, M, N, param, C)
% Set the empty matrix.
H = zeros(M, N);
% Find the coordinate of the center.
m = C(1);
n = C(2);
% Handle different types.
% Ideal 
if strcmp(type, 'ideal')
    for i = 1:M
        for j = 1:N
            dis = sqrt((i - m) ^ 2 + (j - n) ^ 2);
            if dis <= param
                H(i, j) = 0;
            else
                H(i, j) = 1;
            end
        end
    end
% Gaussian 
elseif strcmp(type, 'gaussian')
    W = param;
    for i = 1:M
        for j = 1:N         
            dis = sqrt((i - m) ^ 2 + (j - n) ^ 2);
            H(i, j) = 1 - exp(-dis / (2 * W ^ 2));
        end
    end
% Butterworth 
elseif strcmp(type, 'butterworth')
    W = param(1);
    n0 = param(2);
    for i = 1:M
        for j = 1:N
            dis = sqrt((i - m) ^ 2 + (j - n) ^ 2);
            H(i, j) = 1 / (1 + (W / dis) ^ (2 * n0));
        end
    end
% Rectangular
elseif strcmp(type, 'rectangular')
    height = param(1);
    width = param(2);
    half_h = floor(height / 2);
    half_w = floor(width / 2);
    H = ones(M, N);
    H((m - half_h):(m + half_h), (n - half_w):(n + half_w)) = 0;
end