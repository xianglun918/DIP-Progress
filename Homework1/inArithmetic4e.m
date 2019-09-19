% g is output operated result
% f1, f2 are input matrices to be operated on 
% op is the specified operation 
function g = inArithmetic4e(f1, f2, op)
f1 = double(f1);
f2 = double(f2);
if size(f1) ~= size(f2)
    error('Not equal size matrices.');
end
if strcmp(op, 'add')
    g = f1 + f2;
elseif strcmp(op, 'substract')
    g = f1 - f2;
elseif strcmp(op, 'multiply')
    g = f1 .* f2;
elseif strcmp(op, 'divide')
    g = f1 ./ f2;
else
    error('Operation not exist.');
end
