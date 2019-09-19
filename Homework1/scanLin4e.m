% f is the input gray-scale image
% l is col/row number 
% loc indicates col or row
% s is the output col or row
function s = scanLin4e(f, l, loc)
if strcmp(loc, 'row') == 1
    s = f(l, :);
elseif strcmp(loc, 'col') == 1
    s = f(:, l);
end