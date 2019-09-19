%% This is for testing the project 02-04
I = imread('Fig2.20.tif');
figure;
imshow(I);

% b - 
figure;
imshow(bilinearInterpolation(I, 12.5));