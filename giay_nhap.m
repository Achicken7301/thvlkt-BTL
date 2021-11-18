% CHECK IF RGB
% https://www.mathworks.com/matlabcentral/answers/72412-how-can-i-check-that-my-image-is-rgb
% Color images have 3 channels (R, G, B), so:
% size(your_Image, 3) = 3
% For grayscale:
% size(your_Image, 3) = 1

% Get a picture
path = 'C:\Users\banhb\OneDrive\Documents\thvlkt\BTL\xray.png';
xray = imread(path);
xray = rgb2gray(xray);

% Rotate a picture
rotate = imrotate(xray, 45);

% Get histogram of a pic
% imhist(xray);   %display histogram

% imaadjust
I = imadjust(xray, [0.1 0.7] ,[]);

% Display figure
row = 2;
col = 2;
figure(1);
subplot(row, col, 1); imshow(xray); title('Before');
subplot(row, col, 2); imhist(xray); title('Histogram');
subplot(row, col, 3); imshow(I); title('After');
subplot(row, col, 4); imhist(I); title('Histogram');


%%
    