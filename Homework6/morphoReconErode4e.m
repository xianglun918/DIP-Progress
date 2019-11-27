% Reconstruction by dilation
function [RE, k] = morphoReconErode4e(F, G, B)
n = 1;
EG1 = F;
while 1
    EG1 = morphoGeoErode4e(EG1, G, B, 1);
    EG2 = morphoGeoErode4e(EG2, G, B, 1);
    if isequal(EG1, EG2)
        RE = EG1;
        k = n;
        break
    end
    n = n + 1;
end
