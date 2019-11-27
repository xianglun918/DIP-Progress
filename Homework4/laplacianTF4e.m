% H -> output transfer function
% P, Q are positive integers.
function H = laplacianTF4e(P, Q)
% Template
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
% Ideal highpass
for i = 1:P
    for j = 1:Q
        temp = ((i - p) ^ 2 + (j - q) ^ 2);
        H(i, j) = -4 * pi^2 * temp;
    end
end
H = H / max(abs(H(:)));

