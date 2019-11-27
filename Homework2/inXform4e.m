% f is the input image
% mode is the processing mode
% param is needed when mode is 'gamma' or 'external'
% g is the output image
% map is the transformation function computed by inXform4e
function [g, map] = inXform4e(f, mode, param)
% In case param is not needed
if nargin < 3
    param = 0;
end

% Convert image's intensities to range [0, 1] & Pre-processes
f = intScaling4e(f, 'floating');
[m, n] = size(f);
in_map = (0:255) / 255;

% Handling cases
switch mode
    case 'negative'
        g = ones(m, n) - f;
        map = ones(1, 256) - in_map;
        
    case 'log'
        g = 1 * log(f + 1);
        map = 1 * log(in_map + 1);
    
    case 'gamma'
        g = 1 * f .^ param;
        map = 1 * in_map .^ param;
        
    case 'external'
        g = zeros(m, n);
        for i = 1:m
            for j = 1:n
                g(i, j) = param(floor(f(i, j) * 255 + 1));
            end
        end
end
        
        

