function [K]=image_filter (path,selection)    
    K=[];
    %%Get name file
    [~, name, ext] = fileparts(path);
    %%Read Image and convert to gray image
    I = imread(path);
    if size(I, 3) == 3
        I = rgb2gray(I);
    end   
    %% Get filter from user selection 
    switch selection
        case 'Median'
            K = medfilt2(I);
        case 'Adaptive'
            K = wiener2(I);
        case 'Averange'
            %h is filter matrix
            %one[2,2] when I gray_image
            h=one(2,2)/4
            K=imfilter(I,h);
    end
    %% Show image
    figure(1)
    subplot(2,1,1)
    imshow(I);
    title('Noise Image')
    subplot(2,1,2)
    imshow(K)
    title('Filtered Image')
    %%Save image with name+ '_Filtred'
    imwrite(K,[name,'_Filtered',ext]);
end