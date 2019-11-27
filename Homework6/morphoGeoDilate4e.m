% This function performs geodesic dilation 
function DG = morphoGeoDilate4e(F, G, B, n)
% Get size
[F_m, F_n] = size(F);
[B_m, B_n] = size(B);
B_mh = (B_m - 1) / 2;
B_nh = (B_n - 1) / 2;
% n loops
for i = 1:n
    % Padding
    F = padarray(F, [B_m, B_n], 0, 'both');
    temp = zeros(F_m + 2*B_m, F_n + 2*B_n);
    for p = B_m+1:B_m+F_m
        for q = B_n+1:B_n+F_n
            % Dilation here
            if F(p, q) == 1
                temp(p-B_mh:p+B_mh, q-B_nh:q+B_nh) =  ...
                    temp(p-B_mh:p+B_mh, q-B_nh:q+B_nh) + B;
            end
        end
    end
    % Crop 
    temp = temp(B_m+1:B_m+F_m, B_n+1:B_n+F_n);
    % Finish dilation
    temp(temp(:) > 0) = 1;
    % Intersection with G
    for p = 1:F_m
        for q = 1:F_n
            if temp(p, q) == 1 && G(p, q) == 1
            else
                temp(p, q) = 0;
            end
        end
    end
    F = temp;
end
DG = F;
    