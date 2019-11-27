% This function create a motion blur transfer function
function H = motionBlurTF4e(P, Q, a, b, T)
H = zeros(P, Q);
p = floor(P / 2);
q = floor(Q / 2);
for m = 1:P
    for n = 1:Q
        m_ = m - p;
        n_ = n - q;
        H(m, n) = (T / (pi * (m_ * a + n_ * b))) * ...
            sin(pi * (m_ * a + n_ * b)) * ...
            exp(-1j * pi * (m_ * a + n_ * b));
    end
end

