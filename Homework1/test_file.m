%% This section is for testing question 2.2* (a)

% Load test image
I = imread('girl.tif');

% Pixel value at the origin and at the middle of the image
[m, n] = size(I);
origin_pix_val = pixVal4e(I, 1, 1);
mid_pix_val = pixVal4e(I, round(m / 2), round(n / 2));

% Display the values on the screen
disp(strcat('The pixel value at the origin is:', num2str(origin_pix_val)));
disp(strcat('The pixel value at the middle is:', num2str(mid_pix_val)));

%% This section is for testing question 2.2* (c)

% Load the image and apply the function
I  = imread('girl.tif');
[r, c, v] = cursorValue4e(I);

% Display the value
disp(strcat('The selected pixel''s value is:', num2str(v)));

%% This section is for testing question 2.3 (b)

% Load the image and read the middle line
I = imread('rose1024.tif');
[m, n] = size(I);
scanned_line = scanLin4e(I, round(n / 2), 'row');

% % Display the obtained row and plot the intensity line
disp('The scanned line is:');
disp(scanned_line);
plot((1: m), scanned_line);

%% This section is for testing question 2.4*

% b - Read and Display the image spillway-dark.tif
I = imread('spillway-dark.tif');
figure;
imshow(I);

% c - Scale the image to the floating point range, using full option.
G1 = intScaling4e(I, 'floating', 'full');
figure;
imshow(G1);

% d - Scale the image to the full and integer range.
G2 = intScaling4e(I, 'integer', 'full');
figure;
imshow(G2);

%% This section is for testing question 2.5

% b - Read the image rose1024.tif and generate a square mask
% whose sides are one-half t he size of the image in both directions.
I = imread('rose1024.tif');
[x, y] = size(I);
center = floor([x, y] / 2);
left_c = floor(center / 2);
right_c = center + left_c;
my_mask = mask4e(x, y, left_c(1), left_c(2), right_c(1), right_c(2));

figure;
imshow(my_mask);

% c - Confirm the number of 1 is correct.
num_supposed = (right_c(1) - left_c(1) + 1) * (right_c(2) - left_c(2) + 1);
num_actual = length(find(my_mask == 1));
if num_supposed == num_actual
    fprintf('Confirmed equal.\n')
else
    fprintf('Not equal.\n')
end

% d - Apply the mask to the image and display the result.
output_img = (I) .* uint8(my_mask);
figure;
imshow(output_img);

%% THis section is for testing question 2.6

% b - Read the image girl.tif and use function mask and the 'multply' 
% option to hightlight the girl's facegrom the top of the forehead to the 
% bottom of the chin, and from the left to the right ear.

% Read image and choose interested points
I = imread('girl.tif');
[M, N] = size(I);
[rUL, cUL, ~] = cursorValue4e(I);
[rLR, cLR, ~] = cursorValue4e(I);

% Generate the mask and apply the mask
my_mask = mask4e(M, N, rUL, cUL, rLR, cLR);
out_img = uint8(inArithmetic4e(my_mask, I, 'multiply'));
imshow(out_img);

%% This section is for testing question 2.7

% a - Do substraction bewtween angiography-live-image.tif and 
% angiography-mask-image.tif
I1 = imread('angiography-live-image.tif');
I2 = imread('angiography-mask-image.tif');
out_img1 = intScaling4e(inArithmetic4e(I1, I2, 'substract'), 'floating', ... 
'default');
figure;
imshow(out_img1);

% b - Reverse the order of the substraction in a
out_img2 = intScaling4e(inArithmetic4e(I2, I1, 'substract'), 'floating', ... 
'default');
figure;
imshow(out_img2);














