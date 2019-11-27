% H - hit & miss transform output
% I - input image
% B - SE
function H = morphoHitmiss4e(I, B, padval, mode)
% set defaults if not given
if nargin == 2
    padval = 0;
    mode = 'same';
end
% Find matches
H = morphMatch4e(I, B, padval, mode);
% Fix all partial matches 0.5 to 0
H(H(:) == 0.5) = 0;
