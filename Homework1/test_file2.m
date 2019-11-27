%% This is for testing the project 02-04

% Display the original image
I = imread('rose1024.tif');
I = imresize(I, [400, 400]);
figure;
imshow(I);

% Display the output image
O = bilinearInterpolation(I, 0.5);
O = imresize(O, [400, 400]);
figure;
imshow(O)