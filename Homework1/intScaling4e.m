% g is the output image which is scaled
% f is the original input image
% mode defines the scaling method
% type defines the scaling range
function g = intScaling4e(f, type, mode)
dimension = ndims(f);
if nargin < 3 || dimension == 3 
    mode = 'default';
elseif ~isempty(find(f < 0, 1))
    mode = 'full';
end
if strcmp(mode, 'default')
    f = double(f);
    if max(f(:)) <= 1
        g = f;
    elseif isempty(find(f > 255, 1))
        g = f / 255;
    else 
        if dimension == 2
            g = f / max(f(:));
        else
            c1 = f(:, :, 1);
            c2 = f(:, :, 2);
            c3 = f(:, :, 3);
            f1 = c1 / max(c1(:));
            f2 = c2 / max(c2(:));
            f3 = c3 / max(c3(:));
            g = cat(3, f1, f2, f3);
        end
    end
elseif strcmp(mode, 'full')
    f_m = f - min(f(:));
    f_m = double(f_m);
    if strcmp(type, 'integer')
        g = uint8(floor((255 * (f_m / max(f_m(:))))));
    elseif strcmp(type, 'floating')
        g = f_m / max(f_m(:));
    end
end

        

