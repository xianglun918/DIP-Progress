% H is the output transfer function
% type -> filter type
% P, Q -> size of the transfer function
% param -> vary according to type
function H = hpFilterTF4e(type, P, Q, param)
% Set the empty matrix.
H = zeros(P, Q);
% Find the coordinate of the center.
if mod(P, 2) == 1
    p = (P + 1) / 2;
else
    p = P / 2;
end
if mod(Q, 2) == 1
    q = (Q + 1) / 2;
else
    q = Q / 2;
end
% Handle different types.
% Ideal highpass
if strcmp(type, 'ideal')
    for i = 1:P
        for j = 1:Q
            if sqrt((i - p) ^ 2 + (j - q) ^ 2) <= param
                H(i, j) = 0;
            else
                H(i, j) = 1;
            end
        end
    end
% Gaussian highpass
elseif strcmp(type, 'gaussian')
    for i = 1:P
        for j = 1:Q
            temp = ((i - p) ^ 2 + (j - q) ^ 2);
            H(i, j) = 1 - exp(-temp / (2 * param ^ 2));
        end
    end
% Butterworth highpass
elseif strcmp(type, 'butterworth')
    d = param(1);
    n = param(2);
    for i = 1:P
        for j = 1:Q
            temp = sqrt((i - p) ^ 2 + (j - q) ^ 2);
            H(i, j) = 1 / (1 + (d / temp) ^ (2 * n));
        end
    end
end
        