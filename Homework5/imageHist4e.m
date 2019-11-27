% f is the original image
% 'mode' is used to define normalizing or not
function h = imageHist4e(f, mode)
[m, n] = size(f);
% Non-normalized
if mode == 'u'
    h = imhist(f);
    h = h.';
% Normalized
elseif mode == 'n'
    h = imhist(f) / (m * n);
    h = h.';
end

