%Trying functions on camera man image
img=imread("cameraman.tif");
figure,imshow(img)
title('original image')

%forward transform on img
transform=cdf_forward_L(double(img),3)
disp_dwt(transform,3) %display original vs contrasted transform
inverse=cdf_backward_L(transform,3)

%try inverse cdf 2d L function
figure,imshow(uint8(inverse))
title('after inverse of transform')

hold off

%The above proves images printed show that my cdf_forward /backward
%functions work.



