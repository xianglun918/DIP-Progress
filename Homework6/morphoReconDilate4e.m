% Reconstruction by dilation
function [BD, k] = morphoReconDilate4e(F, G, B)
n = 1;
DG1 = F;
while 1
    DG1 = morphoGeoDilate4e(DG1, G, B, 1);
    DG2 = morphoGeoDilate4e(DG1, G, B, 1);
    if isequal(DG1, DG2)
        BD = DG1;
        k = n;
        break
    end
    n = n + 1;
end



