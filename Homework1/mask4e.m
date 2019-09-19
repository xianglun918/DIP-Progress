% m is the output mask
% M, N is the size of the mask
% rUL, cUL are the coordinates of the Up-left cornor of 1s
% rLR, cLR are the coordinates of the Lower-right cornor of 1s
% Other pixels are all set to 0
function m = mask4e(M, N, rUL, cUL, rLR, cLR)
if rUL < 1 || rUL > rLR || rLR > M || cUL < 1 || cUL > cLR || cLR > N
    error('The input value(s) is(are) not appropriate.')
end
mask = zeros(M, N);
mask(rUL : rLR, cUL : cLR) = 1;
m = mask;
