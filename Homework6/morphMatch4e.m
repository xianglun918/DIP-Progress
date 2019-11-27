% S - output: all matches
% I - input image
% Note B is an odd size SE (0 - bg, 1 - fg, other - don't care
% padval - 0 or 1
% mode - 'full' or 'same'
function S = morphMatch4e(I, B, padval, mode)
% If not given padval and mode
if nargin == 2
    padval = 0;
    mode = 'same';
end
% Size of I 
[M, N] = size(I);
% Size of B
[m, n] = size(B);
m_h = (m - 1) / 2;
n_h = (n - 1) / 2;
% Padding of I 
I = padarray(I, [m, n], padval, 'both');
% Empty S
S = zeros(M+2*m, N+2*n);
% Search for matches
for i = m+1:m+M
    for j = n+1:n+N
        partial = 0;
        all = 1;
        for p = -m_h:m_h
            for q = -n_h:n_h
                if I(i+p, j+q) == 1 && B(p+m_h+1, q+n_h+1) == 1   
                    partial = 1;
                elseif I(i+p, j+q) == 0 && B(p+m_h+1, q+n_h+1) == 0
                    partial = 1;
                else
                    all = 0;
                end
            end
        end
        if partial == 1 && all == 1
            S(i, j) = 1;
        elseif partial == 1 && all == 0
            S(i, j) = 0.5;
        else
            S(i, j) = 0;
        end
    end
end
% Crop or not
if strcmp(mode, 'full')
    % Do nothing
elseif strcmp(mode, 'same')
    S = S(m+1:m+M, n+1:n+N);
end
    
                
                