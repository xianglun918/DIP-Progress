% function [out1, out2, ] = function_name(in1, in2, )

function [max_val, max_loc] = matlab_tutorial_script(v)
n = length(v);
max_val = -inf;
for ii = 1:n
    if v(ii) > max_val
        max_val = v(ii);
        max_loc = ii;
    end
end