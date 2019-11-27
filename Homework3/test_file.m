%% This is the test file for homework3

% Note that all sizes of kernels used in this test are assumed to be odd by
% odd.

%% This section is for testing Question 3.5

% b - Create a unit impulse at the center of a 512 * 512 image. And
% convolve it with a kernal.
kernel = ones(21, 21);
kernel(8:14, 8:14) = 0;
I = zeros(512, 512);
I(256, 256) = 1;
O = twodConv4e(I, kernel);
figure; subplot(1, 4, 1); imshow(kernel); title("Kernel");
subplot(1, 4, 2); imshow(I); title("Unit impulse image");
subplot(1, 4, 3); imshow(O); title("Convolution result");
O2 = conv2(I, kernel);
subplot(1, 4, 4); imshow(O2); title("conv2 function (zero padding)");

%% This section is for testing Question 3.6

% b - Filter the image in Project 3.5 with a Gaussian filter.
I = zeros(512, 512);
I(256, 256) = 1;
kernel = gaussKernel4e(31, 6);
O = twodConv4e(I, kernel);
O2 = intScaling4e(O, 'integer', 'full');
figure; imshow(O2); title("Gaussian Filtered");

%% This section is for testing question 3.7

% % a - Gaussian low-pass filters testpattern1024.tif
% I = imread("./imgs/testpattern1024.tif");
% kernel = gaussKernel4e(81, 100);
% O = twodConv4e(I, kernel);
% figure; imshow(O); title("Barely Readable 'a'");

% b - Adjust the a part to let only the part of the black square can be
% seen after threshold.
% kernel2 = gaussKernel4e(81, 100);
% O2 = twodConv4e(I, kernel2);
% [x, y] = size(O2);
% for i = 1:x
%     for j = 1:y
%         if O2(i, j) > 0.0878
%             O2(i, j) = 1;
%         else
%             O2(i, j) = 0;
%         end
%     end
% end
% figure; imshow(O2); title("Thresholded.");

% c - Reproduce the result in Example 3.18
I2 = imread("./imgs/checkerboard1024-shaded.tif");
kernel3 = gaussKernel4e(191, 64);
O3 = twodConv4e(I2, kernel3);
figure; imshow(O3); title("Reproduce Project 3.18");

%% This section is for testing question 3.8

% a - Sharp the image using unsharp mask
I = imread("./imgs/blurry-moon.tif");
I = intScaling4e(I, 'floating');
% Get the mask
kernel = gaussKernel4e(11, 10);
O1 = twodConv4e(I, kernel);
mask = I - O1;
% Do the sharping
O2 = I + mask;

figure; subplot(1, 4, 1); imshow(I); title("Original image");
subplot(1, 4, 2); imshow(O1); title("Blurred image");
subplot(1, 4, 3); imshow(mask); title("Mask");
subplot(1, 4, 4); imshow(O2); title("Sharpened image");

% b - Improve using highboost filtering.
O3 = I + 2 * mask;
figure; subplot(1, 2, 1); imshow(O2); title("Sharpened image in (a)");
subplot(1, 2, 2); imshow(O3); title("After highboost");

%% This section is for testing question 3.9

% a - Sharp the image with Laplacian kernel.
% kernel = [0 -1 0; -1 4 -1; 0 -1 0];
% I = imread("./imgs/blurry-moon.tif");
% O = intScaling4e(I, 'floating') + twodConv4e(I, kernel);
% figure; imshow(O); title("Laplacian");

% b - Filter the image with sobel kernel.
I2 = imread("./imgs/checkerboard1024-shaded.tif");
sob_ker = [-1 -2 -1; 0 0 0; 1 2 1];
sob_ker2 = [-1 0 1; -2 0 2; -1 0 1];
O2 = conv2(I2, sob_ker);
O3 = conv2(I2, sob_ker2);
figure; subplot(1, 2, 1); imshow(O2); title("Sobel 1");
subplot(1, 2, 2); imshow(O3); title("Sobel 2");

% c - Filter the image sequentially with two sobel kernel.
O4 = conv2(conv2(I2, sob_ker), sob_ker2);
figure; imshow(O4); title("Sobel twice");

% d - Obtain the magnitude of the gradient.
[m, n] = size(I2);
O5 = zeros(m, n);
for i = 1:m
    for j = 1:n
        O5(i, j) = sqrt(O2(i, j) .^ 2 + O3(i, j) .^ 2);
    end
end
figure; imshow(O5); title("Magnitude of gradient");

%% This section is for testing question 3.10

% % a - Read and plot lpkernelD.txt
kernel = load("./imgs/lpkernel1D.txt");
plot(kernel);

% b - generate a 2-D lowpass kernel from the data in (a)and filter
% testpattern1024.tif.
ker2 = zeros(129);
for i = 1:129
    for j = 1:129
        ker2(i, j) = sqrt(kernel(i) .^ 2 + kernel(j) .^ 2);
    end
end
I = imread("./imgs/testpattern1024.tif");
O = intScaling4e(conv2(I, ker2), 'floating');
figure; imshow(O); title("Result");

% c - highpass
ker3 = ones(129, 129);
ker3 = ker3 - ker2;
O2 = intScaling4e(twodConv4e(I, ker3), 'floating');
figure; imshow(O2); title("High Pass");

%% Section test
a = zeros(1, 256);
a(1) = 0.4;
a(127) = 0.2;
a(256) = 0.4;

bar(a);
b = zeros(1, 256);
b(127) = 1;
bar(b);
% plot([0, 1, 0]);
        