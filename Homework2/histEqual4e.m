% g is the output image
% f is the input image
% The function performs histogram equalization on f.
function g = histEqual4e(f)
% We have the normalized (probablity) of the intensity distribution
img_hist = imageHist4e(f, 'n');
param_list = zeros(256);

% Calculate the map of equalized historgram
for i = 1:256
    param_list(i) = sum(img_hist(1:i));
end
g = inXform4e(f, 'external', param_list);

