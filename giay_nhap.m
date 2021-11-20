
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

% imhist - get histogram of an image
% imhist(xray);   %display histogram

% imaadjust
I = imadjust(xray, [0.1 0.7] ,[]);

% Display figure
row = 2;
end_col = 2;
figure(1);
subplot(row, end_col, 1); imshow(xray); title('Before');
subplot(row, end_col, 2); imhist(xray); title('Histogram');
subplot(row, end_col, 3); imshow(I); title('After');
subplot(row, end_col, 4); imhist(I); title('Histogram');


%%
% 1024 - 30 cm
% 683 - 25 cm
path = 'C:\Users\banhb\OneDrive\Documents\thvlkt\thvlkt-BTL2\xray.png';
img = imread(path);
img = rgb2gray(img);
[end_col, row] = size(img);
figure, imshow(img);
h = imdistline(gca);
api = iptgetapi(h);
dist = api.getDistance();
fcn = makeConstrainToRectFcn('imline',...
                              get(gca,'XLim'),get(gca,'YLim'));
api.setDragConstraintFcn(fcn);
%% VI DU TU PIXEL SANG M
start_row = 1478;
end_row = 2246;
meters_per_pixel = 0.001;
rows = [start_row meters_per_pixel end_row];
start_col = 349;
end_col = 1117;
cols = [start_col meters_per_pixel end_col];
img  = imread('boston.tif','PixelRegion',{rows,cols});
figure; 
hImg = imshow(img);
title([num2str(meters_per_pixel), ' meters per pixel']);   
 
% Specify initial position of distance tool on Harvard Bridge.
hline = imdistline(gca,[271 471],[108 650]);
api = iptgetapi(hline);
api.setLabelTextFormatter('%02.0f meters');
 
% Repeat process but work with a 2 meter per pixel sampled image. Verify
% that the same distance is obtained.
meters_per_pixel = 3;
rows = [start_row meters_per_pixel end_row];
cols = [start_col meters_per_pixel end_col];
img  = imread('boston.tif','PixelRegion',{rows,cols});
figure;    
hImg = imshow(img);
title([num2str(meters_per_pixel), ' meters per pixel']);    
     
% Convert XData and YData to meters using conversion factor.
XDataInMeters = get(hImg,'XData')*meters_per_pixel; 
YDataInMeters = get(hImg,'YData')*meters_per_pixel;
     
% Set XData and YData of image to reflect desired units.    
set(hImg,'XData',XDataInMeters,'YData',YDataInMeters);    
set(gca,'XLim',XDataInMeters,'YLim',YDataInMeters);
     
% Specify initial position of distance tool on Harvard Bridge.
hline = imdistline(gca,[271 471],[108 650]);
api = iptgetapi(hline);
api.setLabelTextFormatter('%02.0f meters');  

%% TEST PIXEL SANG CM
real_length = 60;
real_width = 50;
end_row = 1024;
end_col = 686;
dien_tich_pixel = (real_length/end_row)*(real_width/end_col);
cm_per_pixel = 1;
rows = [1 cm_per_pixel end_row];
cols = [1 cm_per_pixel end_col];
path = 'C:\Users\banhb\OneDrive\Documents\thvlkt\thvlkt-BTL2\xray.png';
img = imread(path);
img = rgb2gray(img);
% img  = imread('boston.tif','PixelRegion',{rows,cols});
figure; 
hImg = imshow(img);
title([cm_per_pixel, ' meter per pixel']);
% Convert XData and YData to meters using conversion factor.
XDataInMeters = get(hImg,'XData')*cm_per_pixel; 
YDataInMeters = get(hImg,'YData')*cm_per_pixel;
     
% Set XData and YData of image to reflect desired units.    
set(hImg,'XData',XDataInMeters,'YData',YDataInMeters);    
set(gca,'XLim',XDataInMeters,'YLim',YDataInMeters);

% Specify initial position of distance tool on Harvard Bridge.
hline = imdistline(gca);
api = iptgetapi(hline);
api.setLabelTextFormatter('%02.5f cm');
%% Test error
try
    
% evalin - get variable's value from workspace
size_file = evalin('base', 'size_file');
path = evalin('base', 'path');
row = evalin('base', 'row');
col = evalin('base', 'col');
% sprintf - display a textbox
% Example: ('%3$s %2$s %1$s %2$s','A','B','C') prints input arguments 'A', 'B', 'C' as follows: C B A B.
s = sprintf('Image Infomation:\nSize: %1$s Bytes\nPath: %2$s\nRow: %3$i\nCol: %4$i', size_file, path, row, col);
questdlg(s,...
    'Image Infomation',...
    'OK','OK');
catch
    display('fail!');
end

    

