% This function performs geodesic erosion 
function EG = morphoGeoErode4e(F, G, B, n)
% n loops
for i = 1:n
    % Erosion
    F = morphoHitmiss4e(F, B);
    % Union
    F = G + F;
    % Fix large values
    F(F(:) <= 1) = 0;
    F(F(:) > 1) = 1;
end
EG = F;