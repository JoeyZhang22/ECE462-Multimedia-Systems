rgb_image = imread("jbeans.ppm")

%TESTING RGB2YCC
%original rgb_image
%imagesc(rgb_image)

%convert to YCC image
yccimage=rgb2ycc(rgb_image)
YCBCR = rgb2ycbcr(rgb_image)

%y_channel
imagesc(yccimage(:,:,1))

%Cb_channel
figure, imagesc(yccimage(:,:,2))

%Cr_channel
figure, imagesc(yccimage(:,:,3))

%Whole YCC image
figure,imshow( uint8(yccimage))


%TESTING YCC2RGB
rgb_recovered = ycc2rgb(yccimage)
figure, imagesc(uint8(rgb_recovered))
