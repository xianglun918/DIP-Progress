% This function implements the Wiener filter
function W = pWienerTF4e(H, K)
[m, n] = size(H);
W = zeros(m, n);
for i = 1:m
    for j = 1:n
        W(i, j) = (1 / H(i, j)) * (H(i, j)^2 / (H(i, j)^2 + K));
    end
end
