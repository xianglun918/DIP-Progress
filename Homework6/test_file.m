%% test_file.m

% by xianglun, xu
% uin: 830000068

%% This section is for testing Project 9.4

% b - perform hit & miss according to Figure 9.13
I = zeros(500, 500);
I(100:250, 50:150) = 1;
I(250:350, 250:350) = 1;
I(100:150, 400:450) = 1;
B = zeros(103, 103);
B(2:102, 2:102) = 1;
figure; imshow(I); title("Original image"); imshow(B); title("SE");
H = morphoHitmiss4e(I, B, 0, 'same');
figure; imshow(H); title("Match result");

%% This section is for testing Project 9.5

% b - Reverse the image and find the boundary
I = imread("imgs/testpattern512-binary.tif");
N = ones(size(I)) - I;
figure; subplot(2, 2, 1); imshow(N); title("Complement");
BD1 = morphoBoundary4e(N);
subplot(2, 2, 2); imshow(BD1); title("Boundary1");
BD2 = morphoBoundary4e(I);
subplot(2, 2, 3); imshow(I); title("Original image");
subplot(2, 2, 4); imshow(BD2); title("Boundary2");

%% This section is for testing Project 9.7

% c - use result from Project 9.4 to delete the right upper arrow in this
% image
I = imread("imgs/calculator-binary.tif");
figure; subplot(2, 2, 1); imshow(I); title("Original image")
I2 = imread("imgs/calculator-binary-upper-arrow.tif");
% I2 = padarray(I2, [2, 2], 0, 'post');
subplot(2, 2, 2); imshow(I2); title("SE");
F = morphoHitmiss4e(I, I2);
DG = morphoGeoDilate4e(F, I, I2, 1);
subplot(2, 2, 3); imshow(DG); title("Geodesic Dilation");
G = I - DG; 
subplot(2, 2, 4); imshow(G); title("Final Result");

%%
% d - remove all except top-left small square from the image
I = imread("imgs/testpattern512-binary.tif");
% Do negative
I = ones(size(I)) - I;
figure; subplot(2, 2, 1); imshow(I); title("Negative of image");
% Construct the match template
B = zeros(13, 13);
B(2:11, 2:11) = 1;
subplot(2, 2, 2); imshow(B); title("SE");
% Get the hit & miss result
F = morphoHitmiss4e(I, B);
% Dilation and Reverse
EG = morphoGeoDilate4e(F, I, B, 1);
subplot(2, 2, 3); imshow(EG); title("Locate");
EG = ones(size(EG)) - EG;
subplot(2, 2, 4); imshow(EG); title("Final Result");


%% This section is for testing Project 9.8 a & b
%% This section is for testing Project 9.9
%% This section is for testing Project 9.10