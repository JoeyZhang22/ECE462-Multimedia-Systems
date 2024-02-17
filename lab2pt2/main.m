lena_image= imread('lena512color.tiff');
figure, imagesc(lena_image)
title("Original Image")

%perform YCrCb transform on rgb
YCrCb_image= rgb2ycc(lena_image);

%Transform three channels to DCT
Y_DCT = DCT_blocks_forward(YCrCb_image(:,:,1),8);
Cb_DCT= DCT_blocks_forward(YCrCb_image(:,:,2),8);
Cr_DCT = DCT_blocks_forward(YCrCb_image(:,:,3),8);

YCrCb_image_DCT(:,:,1) =Y_DCT;
YCrCb_image_DCT(:,:,2) = Cb_DCT;
YCrCb_image_DCT(:,:,3) = Cr_DCT;

%quantize channels

%table quantization
DCT_table_q1 = Quantizer(YCrCb_image_DCT,0,0,0);
DCT_table_dq1 = Dequantizer(DCT_table_q1,0,0,0);

y_iDCT1= DCT_blocks_backward(DCT_table_dq1(:,:,1),8);
Cb_iDCT1= DCT_blocks_backward(DCT_table_dq1(:,:,2),8);
Cr_iDCT1= DCT_blocks_backward(DCT_table_dq1(:,:,3),8);
% recon_ycc1(:,:,1)=y_iDCT1;
% recon_ycc1(:,:,2)=Cb_iDCT1;
% recon_ycc1(:,:,3)=Cr_iDCT1;
% %back to rgb
% recon_rgb1=ycc2rgb(recon_ycc1);
% recon_rgb1=uint8(recon_rgb1)
% figure, imagesc(recon_rgb1)
% title("using default table")
% 
% %table + alpha quantization
% DCT_table_q2 = Quantizer(YCrCb_image_DCT,2,0,0);
% DCT_table_dq2 = Dequantizer(DCT_table_q2,2,0,0);
% y_iDCT2= DCT_blocks_backward(DCT_table_dq2(:,:,1),8);
% Cb_iDCT2= DCT_blocks_backward(DCT_table_dq2(:,:,2),8);
% Cr_iDCT2= DCT_blocks_backward(DCT_table_dq2(:,:,3),8);
% recon_ycc2(:,:,1)=y_iDCT2;
% recon_ycc2(:,:,2)=Cb_iDCT2;
% recon_ycc2(:,:,3)=Cr_iDCT2;
% %back to rgb
% recon_rgb2=ycc2rgb(recon_ycc2);
% recon_rgb2=uint8(recon_rgb2)
% figure, imagesc(recon_rgb2)
% title("using alpha=5 and default table")
% 
% %equation with R={1,63} pair
% DCT_table_q3 = Quantizer(YCrCb_image_DCT,3,1,63);
% DCT_table_dq3 = Dequantizer(DCT_table_q3,3,1,63);
% y_iDCT3= DCT_blocks_backward(DCT_table_dq3(:,:,1),8);
% Cb_iDCT3= DCT_blocks_backward(DCT_table_dq3(:,:,2),8);
% Cr_iDCT3= DCT_blocks_backward(DCT_table_dq3(:,:,3),8);
% recon_ycc3(:,:,1)=y_iDCT3;
% recon_ycc3(:,:,2)=Cb_iDCT3;
% recon_ycc3(:,:,3)=Cr_iDCT3;
% %back to rgb
% recon_rgb3=ycc2rgb(recon_ycc3);
% recon_rgb3=uint8(recon_rgb3)
% figure, imagesc(recon_rgb3)
% title("R={1,63}")
% 
% %equation with R={1,5} pair
% DCT_table_q4 = Quantizer(YCrCb_image_DCT,3,1,5);
% DCT_table_dq4 = Dequantizer(DCT_table_q4,3,1,5);
% y_iDCT4= DCT_blocks_backward(DCT_table_dq4(:,:,1),8);
% Cb_iDCT4= DCT_blocks_backward(DCT_table_dq4(:,:,2),8);
% Cr_iDCT4= DCT_blocks_backward(DCT_table_dq4(:,:,3),8);
% recon_ycc4(:,:,1)=y_iDCT4;
% recon_ycc4(:,:,2)=Cb_iDCT4;
% recon_ycc4(:,:,3)=Cr_iDCT4;
% %back to rgb
% recon_rgb4=ycc2rgb(recon_ycc4);
% recon_rgb4=uint8(recon_rgb4)
% figure, imagesc(recon_rgb4)
% title("R={1,5}")