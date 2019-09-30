% g is the output image
% f is the input image
% m, n is the size of the mask for performing histogram equalization
function g = localHistEqual4e(f, m, n)
% Size of original f
[f_m, f_n] = size(f);
% Padding according to m, n
pad_m = floor(m / 2);
pad_n = floor(n / 2);
f =  padarray(f, [pad_m, pad_n], 'replicate', 'both');

% Padded size and empty g for later filling
g = zeros(f_m + 2 * pad_m, f_n + 2* pad_n);

% Sliding the mask and do histogram equalization
for i = (pad_m + 1) : (pad_m + f_m)
    for j = (pad_n + 1) : (pad_n + f_n)
        f_temp = f((i - pad_m):(i + pad_m), (j - pad_n):(j + pad_n));
        temp_hist = imageHist4e(f_temp, 'n');
        temp_param = zeros(256);
        for z = 1:256
            temp_param(z) = sum(temp_hist(1:z));
        end
        g((i - pad_m):(i + pad_m), (j - pad_n):(j + pad_n)) = ...
            inXform4e(f_temp, 'external', temp_param);
    end
end
g = g((pad_m + 1):(pad_m + f_m), (pad_n + 1):(pad_n + f_n));

%             
% % Calculate the map of equalized historgram
% for i = 1:256
%     param_list(i) = sum(img_hist(1:i));
% end
% g = inXform4e(f, 'external', param_list);
        

