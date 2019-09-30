%% This section is for testing question 2.9 

% b - generate and plot the histogram for 'rose1024.tif', mode = 'n'
I = imread('./img/rose1024.tif');
H = imageHist4e(I, 'n');
figure; bar(H);


% c - explanation.
% Conclusion is: The image is relatively polarized with most pixels at
% low intensity levels and high intensity levels. Only few pixels are 
% in the middle.

%% This section is for testing question 3.2

% b - read and display the 'spillway-dark.tif'. Apply a log transform.
I = imread('./img/spillway-dark.tif');
figure; subplot(2, 2, 1); imshow(I); 
title('Original image');

O = inXform4e(I, 'log');
subplot(2, 2, 2); imshow(O); title('log');

% c - improve the result using gamma transformation
% try gamma = 0.1
O2 = inXform4e(I, 'gamma', 0.2);
subplot(2, 2, 3); imshow(O2); title('gamma transform (gamma = 0.2)');

% try gamma = 0.5
O3 = inXform4e(I, 'gamma', 0.5); 
subplot(2, 2, 4); imshow(O3); title('gamma transform (gamma = 0.5)');

% d - explanation
% As the result shown above, the smaller gamma is, the brighter the dark
% part will be. Because when gamma < 1, the gamma transformation
% emphasizes the dark part and contracts the brighter part. On the other
% hand, log transformation will not influence much since the log(1 + r) are
% not changing the image as rapid as exponential equation. In the previous
% test when gamma is 0.5, we obtained a better result.

%% This section is for testing question 3.3

% b - Histogram equalize the image spillway-dark.tif. Compare the result
% withthe result in question 3.2(c)
I = imread('./img/spillway-dark.tif');
O = histEqual4e(I);
figure; subplot(2, 1, 1); imshow(O); title('Histogram Equalization');

O3 = inXform4e(I, 'gamma', 0.5); 
subplot(2, 1, 2); imshow(O3); title('gamma transform (gamma = 0.5)');

% c - Histogram equalize the image hidden-horse.tif. Compare with Fig
% 3.25(c)
I2 = imread('./img/hidden-horse.tif');
O2 = histEqual4e(I2);
figure; imshow(O2); title('Histogram Equlization');

%% This section is for testing question 3.4

% b - apply the function to hidden-symbols.tif using 3 * 3 neighborhood and
% compare the result with Fig. 3.32(c)
I = imread('./img/hidden-symbols.tif');
O = localHistEqual4e(I, 3, 3);
figure; imshow(I); title('Original Image');
figure; imshow(O); title('Local Histogram Equalization with 3 * 3');

% c - using 7 * 7 neighborhood in the previous steps
O2 = localHistEqual4e(I, 7, 7);
figure; imshow(O2); title('Local Histogram Equalization with 7 * 7');
