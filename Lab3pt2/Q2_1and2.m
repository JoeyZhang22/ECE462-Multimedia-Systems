%Trying functions on camera man image
t=tiledlayout(1,7)
img=imread("cameraman.tif");
nexttile
imshow(uint8(img));
title('original image')

%1 bit plane
L=5;
forward1=cdf_forward_L(double(img),L);
bp1=bitcoding(forward1,1);
reverse1=cdf_backward_L(bp1,L);
nexttile
imshow(uint8(reverse1));
title('1-bit plane')
PSNR1= psnr(uint8(reverse1),img)

%2 bit plane
forward2=cdf_forward_L(double(img),L);
bp2=bitcoding(forward2,2);
reverse2=cdf_backward_L(bp2,L);
nexttile
imshow(uint8(reverse2));
title('2-bit plane')
PSNR2= psnr(uint8(reverse2),img)

%3 bit plane
forward3=cdf_forward_L(double(img),L);
bp3=bitcoding(forward3,3);
reverse3=cdf_backward_L(bp3,L);
nexttile
imshow(uint8(reverse3));
title('3-bit plane')
PSNR3= psnr(uint8(reverse3),img)

%4 bit plane
forward4=cdf_forward_L(double(img),L);
bp4=bitcoding(forward4,4);
reverse4=cdf_backward_L(bp4,L);
nexttile
imshow(uint8(reverse4));
title('4-bit plane')
PSNR4= psnr(uint8(reverse4),img)

%5 bit plane
forward5=cdf_forward_L(double(img),L);
bp5=bitcoding(forward5,5);
reverse5=cdf_backward_L(bp5,L);
nexttile
imshow(uint8(reverse5));
title('5-bit plane')
PSNR5= psnr(uint8(reverse5),img)

%6 bit plane
forward6=cdf_forward_L(double(img),L);
bp6=bitcoding(forward6,6);
reverse6=cdf_backward_L(bp6,L);
nexttile
imshow(uint8(reverse6));
title('6-bit plane')
PSNR6= psnr(uint8(reverse6),img)

title(t,'Cdf bit plane coding')

% figure()
% forward9=cdf_forward_L(double(img),L);
% bp9=bitcoding(forward9,12);
% reverse9=cdf_backward_L(bp9,L);
% figure()
% imshow(uint8(reverse9))

