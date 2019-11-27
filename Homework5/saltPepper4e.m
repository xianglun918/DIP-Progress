% g is the output with salt & pepper noise
% f is the input image
% ps, pp - salt probability & pepper probability
function g = saltPepper4e(f, ps, pp)
g = intScaling4e(f);
[m, n] = size(f);
noise = rand(m, n);
for i = 1:m
    for j = 1:n
        if noise(i, j) < pp
            g(i, j) = 0;
        elseif noise(i, j) > 1 - ps
            g(i, j) = 1;
        end
    end
end

            