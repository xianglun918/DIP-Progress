% foreground boundary detection
function BD = morphoBoundary4e(I, B)
% If B not give, set default
if nargin == 1
    B = ones(3, 3);
end
% Hit and miss (erosion)
E = morphoHitmiss4e(I, B);
% Get the boundary
BD = I - E;
           
