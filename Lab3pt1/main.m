%Trying functions on camera man image
img=imread("cameraman.tif");
figure,imshow(img)
title('original image')

%forward transform on img
transform=harr_2d_L_forward(double(img),3)
disp_dwt(transform,3) %display original vs contrasted transform
inverse=harr_2d_L_reverse(transform,3)

%try inverse harr 2d L function
figure,imshow(uint8(inverse))
title('after inverse of transform')

%pre testing codes
% x=[1 0 0 0 ;
%     1 0 0 0;
%     1 0 0 0;
%     1 1 1 1]
% 
% y=[10 9 8 7];
% try_harr=harr_1d_forward(y)
% try_harr_rev_1d=harr_1d_reverse(try_harr)
% try_harr2=harr_2d_forward(x)
% try_L1=harr_2d_L_forward(x,2)
% 
% % y2= [1 0 0 0;
% %     0 0 0 0;
% %     3/2 0 1 0;
% %     0 0 0 0]
% % 
% % y2(:,1)=harr_1d_reverse(transpose(y2(:,1)))
% % y2(:,2)=harr_1d_reverse(transpose(y2(:,2)))
% % y2(:,3)=harr_1d_reverse(transpose(y2(:,3)))
% % y2(:,4)=harr_1d_reverse(transpose(y2(:,4)))
% % 
% % y2(1,:)=harr_1d_reverse(y2(1,:))
% % y2(2,:)=harr_1d_reverse(y2(2,:))
% % y2(3,:)=harr_1d_reverse(y2(3,:))
% % y2(4,:)=harr_1d_reverse(y2(4,:))
% x=double(x)
% try_harr3=harr_2d_forward(x)
% try_harr3_rev=harr_2d_reverse(try_harr3)
% 
% try_harr4=harr_2d_L_forward(x,2)
% og=harr_2d_L_reverse(try_harr4,2)
