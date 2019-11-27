%% Homework5

%% This section is for testing Project 5.1

% Estimate the additive gaussian noise's parameters
I = imread("book-cover-gaussian.tif");
figure; subplot(1, 3, 1); imshow(I); title("Original image");
% I select a whole black area for estimation
I = I(510:590, 430:480); 
subplot(1, 3, 2); imshow(I); title("Selected area");
% Normalize the histogram
H = imageHist4e(I, 'n'); subplot(1, 3, 3); bar(H); title("Normalized hist");
temp = 1:256;
% Estimates for mean and standard deviation
mean = dot(temp, H) / 255;
temp2 = (temp - mean) .^ 2;
dev = sqrt(dot(temp2, H) / 255);
disp(["The mean is: ", mean]);
disp(["The deviation is: ", dev]);

%% This section is for testing Project 5.2

% a - apply different levels of gaussian noises to the image with mean 0.25
I = intScaling4e(imread("testpattern512.tif"), 'floating', 'full');
% I = intScaling4e(imread("book-cover-gaussian.tif"), 'floating', 'full');
figure; imshow(I);
[m, n] = size(I);
% mild noise
sigma = 25;
noise_m = (randn(m, n) + 0.25) * (sigma / 255);
O = intScaling4e(I + noise_m, 'floating', 'full');
figure; subplot(2, 2, 1); imshow(O); title("Mild noise");
% intermediate noise
sigma = 50;
noise_i = (randn(m, n) + 0.25) * (sigma / 255);
O = intScaling4e(I + noise_i, 'floating', 'full');
subplot(2, 2, 2); imshow(O); title("Intermediate noise");
% heavy noise
sigma = 100;
noise_h = (randn(m, n) + 0.25) * (sigma / 255);
O = intScaling4e(I + noise_h, 'floating', 'full');
subplot(2, 2, 3); imshow(O); title("Heavy noise");
% extra heavy noise
sigma = 200;
noise_e = (randn(m, n) + 0.25) * (sigma / 255);
O = intScaling4e(I + noise_e, 'floating', 'full');
subplot(2, 2, 4); imshow(O); title("Extra heavy noise");

%%
% b - apply different levels of uniform noises to the image
I = intScaling4e(imread("testpattern512.tif"), 'floating', 'full');
figure; imshow(I);
[m, n] = size(I);
% mild noise
a = 0;
b = 0.02;
noise_m = rand(m, n);
noise_m(noise_m < a | noise_m > b) = 0;
O = intScaling4e(I + noise_m, 'floating', 'full');
figure; subplot(2, 2, 1); imshow(O); title("Mild noise");
% intermediate noise
a = 0;
b = 0.2;
noise_i = rand(m, n);
noise_i(noise_i < a | noise_i > b) = 0;
O = intScaling4e(I + noise_i, 'floating', 'full');
subplot(2, 2, 2); imshow(O); title("Intermediate noise");
% heavy noise
a = 0;
b = 0.5;
noise_h = rand(m, n);
noise_h(noise_h < a | noise_h > b) = 0;
O = intScaling4e(I + noise_h, 'floating', 'full');
subplot(2, 2, 3); imshow(O); title("Heavy noise");
% extra heavy noise
a = 0;
b = 1;
noise_e = rand(m, n);
noise_e(noise_e < a | noise_e > b) = 0;
O = intScaling4e(I + noise_e, 'floating', 'full');
subplot(2, 2, 4); imshow(O); title("Extra heavy noise");

%% This sextion is for testing Project 5.3

% c - repeat Project 5.2 with salt & pepper noise
I = imread("testpattern512.tif");
% mild noise
O = saltPepper4e(I, 0.02, 0.02);
figure; subplot(2, 2, 1); imshow(O); title("Mild noise");
% intermediate noise
O = saltPepper4e(I, 0.05, 0.05);
subplot(2, 2, 2); imshow(O); title("Intermediate noise");
% heavy noise
O = saltPepper4e(I, 0.1, 0.1);
subplot(2, 2, 3); imshow(O); title("Heavy noise");
% extra heavy noise
O = saltPepper4e(I, 0.3, 0.3);
subplot(2, 2, 4); imshow(O); title("Extra heavy noise");

% d - only pepper noise 
% mild noise
O = saltPepper4e(I, 0, 0.02);
figure; subplot(2, 2, 1); imshow(O); title("Mild noise");
% intermediate noise
O = saltPepper4e(I, 0, 0.05);
subplot(2, 2, 2); imshow(O); title("Intermediate noise");
% heavy noise
O = saltPepper4e(I, 0, 0.1);
subplot(2, 2, 3); imshow(O); title("Heavy noise");
% extra heavy noise
O = saltPepper4e(I, 0, 0.3);
subplot(2, 2, 4); imshow(O); title("Extra heavy noise");

% e - only salt noise
% mild noise
O = saltPepper4e(I, 0.02, 0);
figure; subplot(2, 2, 1); imshow(O); title("Mild noise");
% intermediate noise
O = saltPepper4e(I, 0.05, 0);
subplot(2, 2, 2); imshow(O); title("Intermediate noise");
% heavy noise
O = saltPepper4e(I, 0.1, 0);
subplot(2, 2, 3); imshow(O); title("Heavy noise");
% extra heavy noise
O = saltPepper4e(I, 0.3, 0);
subplot(2, 2, 4); imshow(O); title("Extra heavy noise");

%% This section is for testing Project 5.6

% b - read image and remove sinusoidal noise by gaussian notch filter
I = intScaling4e(imread("astronaut-interference.tif"), 'floating', 'full');
[m, n] = size(I);
figure; subplot(2, 2, 1); imshow(I); title("Original image");
% get image's spectrum
spectrum = intScaling4e(log(1 + abs(fft2(minusOne4e(I)))), 'floating', 'full');
subplot(2, 2, 2); imshow(spectrum); title("Spectrum");
% get the spikes locations and  gaussian notch filter
x = 438;
y = 526;
x_2 = 388;
y_2 = 476;
width = 2;
H = notchReject4e('gaussian', m, n, width, [x, y]);
H2 = notchReject4e('gaussian', m, n, width, [x_2, y_2]);
H = H .* H2;
subplot(2, 2, 3); imshow(H); title("The filter");
% filter the image
G = dftFiltering4e(I, H);
subplot(2, 2, 4); imshow(G); title("Filtered");

%% c - repeat b using zero-padding
I = intScaling4e(imread("astronaut-interference.tif"), 'floating', 'full');
[m, n] = size(I);
figure; subplot(2, 2, 1); imshow(I); title("Original image");
% get image's spectrum
spectrum = intScaling4e(log(1 + abs(fft2(minusOne4e(I)))), 'floating', 'full');
subplot(2, 2, 2); imshow(spectrum); title("Spectrum");
% get the spikes locations and  gaussian notch filter
x = 438;
y = 526;
x_2 = 388;
y_2 = 476;
width = 2;
H = notchReject4e('gaussian', 2*m, 2*n, width, [x, y]);
H2 = notchReject4e('gaussian', 2*m, 2*n, width, [x_2, y_2]);
H = H .* H2;
subplot(2, 2, 3); imshow(H); title("The filter");
% filter the image
G = dftFiltering4e(I, H, 'zeros');
subplot(2, 2, 4); imshow(G); title("Filtered");

%% d - generate similar results to 4.65, 4.66
% b - read image and remove sinusoidal noise by gaussian notch filter
I = intScaling4e(imread("cassini-interference.tif"), 'floating', 'full');
[m, n] = size(I);
figure; subplot(2, 2, 1); imshow(I); title("Original image");
% get image's spectrum
spectrum = intScaling4e(log(1 + abs(fft2(minusOne4e(I)))), 'floating', 'full');
subplot(2, 2, 2); imshow(spectrum); title("Spectrum");
% get the spikes locations and  gaussian notch filter
x = 168;
y = 338;
x_2 = 505;
y_2 = 338;
width = 2;
H = notchReject4e('rectangular', m, n, [320, 10], [x, y]);
H2 = notchReject4e('rectangular', m, n, [320, 10], [x_2, y_2]);
H = H .* H2;
subplot(2, 2, 3); imshow(H); title("The filter");
% filter the image
G = dftFiltering4e(I, H);
subplot(2, 2, 4); imshow(G); title("Filtered");

%% This section is for testing Project 5.7
I = intScaling4e(imread("boy.tif"), 'floating', 'full');
figure; subplot(1, 3, 1); imshow(I); title("Original image");
[m, n] = size(I);

% b - Show the spectrum of H
H = intScaling4e(motionBlurTF4e(m, n, 0.1, 0.1, 1));
spectrum = intScaling4e(log(1 + abs(fft2(minusOne4e(H)))), 'floating', 'full');
figure; imshow(spectrum);
% c - Blur boy.tif
figure;
G = dftFiltering4e(I, H);
subplot(1, 3, 2); imshow(H); title("Filter");
subplot(1, 3, 3); imshow(G); title("Blurred image");


