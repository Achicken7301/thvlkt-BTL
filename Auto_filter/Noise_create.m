function [K,filename]=Noise_create (path)
    %%Get name file
    [~, name, ext] = fileparts(path);
    %%Read Image
    I = imread(path);
    if size(I, 3) == 3
        I = rgb2gray(I);
    end
    %%
    %%Create noise image
    J = imnoise(I,'gaussian');
    imwrite(J,[path,'_gauss_noise.png']);
    J = imnoise(I,'salt & pepper',0.02);
    imwrite(J,[pathname,'_salt & pepper_noise.png']);
    J = imnoise(I,'poisson');
    imwrite(J,[pathname,'_poisson_noise.png'])
    H = fspecial('motion');
    J = imfilter(I,H,'replicate');
    imwrite(J,[pathname,'_motion.png'])
end