% g is the output image which is scaled
% f is the original input image
% mode defines the scaling method
% type defines the scaling range
function g = intScaling4e(f, type, mode)
% Check if RGB
if ~ismatrix(f)
    error("This function cannot handle RGB image")
end
% Check # of inputs
if nargin == 1
    mode = 'default';
    type = 'floating';
elseif nargin == 2
    error("To use 'type', must include 'mode'")
end
% If any negative element, mode forced to 'full'
if ~isempty(find(f < 0, 1))
    mode = 'full';
end
% Default - [0, n] map into [0, 1]
if strcmp(mode, 'default')
    f = double(f);
    if max(f(:)) <= 1
        g = f;
    elseif isempty(find(f > 255, 1))
        g = f / 255;
    else 
        g = f / max(f(:));
    end 
% Full - [-n, n] map to [0, 1] or [0 255]
elseif strcmp(mode, 'full')
    f_m = f - min(f(:));
    f_m = double(f_m);
    g = f_m / max(f_m(:));
end
% If type is 'integer', scale the result 
if strcmp(type, 'integer')
    g = uint8(floor((255 * (f_m / max(f_m(:))))));
end

        

