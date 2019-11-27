%% Test file
%% This section is for testing Question 4.3

% b - ideal lowpass
I = lpFilterTF4e('ideal', 512, 512, 96);
figure; subplot(1, 3, 1); imshow(I); title('Ideal lowpass');

% c - gaussian lowpass
I2 = lpFilterTF4e('gaussian', 512, 512, 96);
subplot(1, 3, 2); imshow(I2); title('Gaussian lowpass');

% d - butterworth lowpass
I3 = lpFilterTF4e('butterworth', 512, 512, [96, 2]);
subplot(1, 3, 3); imshow(I3); title('Butterworth lowpass');

%% This section is for testing Question 4.4

% b - ideal highpass
I = hpFilterTF4e('ideal', 512, 512, 96);
figure; subplot(1, 3, 1); imshow(I); title('Ideal highpass');

% c - gaussian lowpass
I2 = hpFilterTF4e('gaussian', 512, 512, 96);
subplot(1, 3, 2); imshow(I2); title('Gaussian highpass');

% d - butterworth lowpass
I3 = hpFilterTF4e('butterworth', 512, 512, [96, 2]);
subplot(1, 3, 3); imshow(I3); title('Butterworth highpass');

%% This section is for testing Question 4.5

% b - read testpattern512.tif, filter it with butterworth lowpass with
% cutoff frequency 32 and order 2.
I = intScaling4e(imread("imgs/testpattern512.tif"));
[m, n] = size(I);
flt = lpFilterTF4e('butterworth', 2 * m, 2 * n, [32, 2]);
G = dftFiltering4e(I, flt, 'replicate');
figure; imshow(I); title('Original Image');
figure; imshow(G); title('Butterworth transfer');

%% This section is for testing Question 4.6

% a - Filter image with lowpass gaussian for "a" to be barely readable
a = intScaling4e(imread("imgs/testpattern1024.tif"));
[m, n] = size(a);
flt = lpFilterTF4e('gaussian', 2 * m, 2 * n, 10);
g = dftFiltering4e(a, flt, 'replicate');
figure; imshow(g); title("Gaussian lowpass");

% b - Butterworth lowpass filtering to only top-right visible after
% thresholded.
flt = lpFilterTF4e('butterworth', 2 * m, 2 * n, [10, 5]);
g = dftFiltering4e(a, flt, 'replicate');
figure; subplot(1, 2, 1); imshow(g); title("Butterworth lowpass");
for i = 1:m
    for j = 1:n
        if g(i, j) > 0.34
            g(i, j) = 1;
        else
            g(i, j) = 0;
        end
    end
end
subplot(1, 2, 2); imshow(g); title("After threshodling");

% c - Reproduce result in Example 3.18
a = intScaling4e(imread("imgs/checkerboard1024-shaded.tif"));
[m, n] = size(a);
flt = lpFilterTF4e('gaussian', 2 * m, 2 * n, 6);
g = dftFiltering4e(a, flt, 'replicate');
figure; imshow(g); title("Reproduce example 3.18");

%% This section is for testing Question 4.7

% a - Sharpen a image.
a = intScaling4e(imread("imgs/blurry-moon.tif"));
[m, n] = size(a);
flt = lpFilterTF4e('gaussian', 2 * m, 2 * n, 32);
g = dftFiltering4e(a, flt, 'replicate');
o = a + a - g;
figure; subplot(1, 2, 1); imshow(a); title("Original image");
subplot(1, 2, 2); imshow(o); title("Sharpen the moon.");

% b - Improve the result by high-boost.
figure; subplot(1, 3, 1); imshow(a); title("Original image");
subplot(1, 3, 2); imshow(o); title("Sharpen the moon.");
o = a + 2 * (a - g);
subplot(1, 3, 3); imshow(o); title("High-boost");

%% This section is for testing Question 4.8

% a - Duplicate the results Example 4.20
a = intScaling4e(imread("imgs/thumbprint.tif"));
[m, n] = size(a);
flt = hpFilterTF4e('gaussian', 2 * m, 2 * n, 32);
g = dftFiltering4e(a, flt, 'replicate');
figure; subplot(1, 3, 1); imshow(a); title("Original image");
subplot(1, 3, 2); imshow(g); title("After highpass");
% Thresholding
for i = 1:m
    for j = 1:n
        if g(i, j) > 0
            g(i, j) = 1;
        else
            g(i, j) = 0;
        end
    end
end
subplot(1, 3, 3); imshow(g); title("After thresholding");

% c - Sharpen the image with laplacian transfer 
a = intScaling4e(imread("imgs/blurry-moon.tif"));
[m, n] = size(a);
flt = laplacianTF4e(2 * m, 2 * n);
g = dftFiltering4e(a, flt, 'replicate');
g = a - 20 * g;
figure; subplot(1, 2, 1); imshow(a); title("Original image");
subplot(1, 2, 2); imshow(g); title("Laplacian filtered");

% d - duplicate Example 4.22
a = intScaling4e(imread("imgs/chestXray.tif"));
[m, n] = size(a);
flt = laplacianTF4e(2 * m, 2 * n);
g = dftFiltering4e(a, flt, 'replicate');
g = a - 5 * g;
figure; subplot(1, 3, 1); imshow(a); title("Original image");
subplot(1, 3, 2); imshow(g); title("Laplacian filtered");
g = histeq(g);
subplot(1, 3, 3); imshow(g); title("After histogram equalization");


