%state randomization
randn('state',sum(100*clock));

%original image and ycc transform
og_img= imread("jbeans-1.ppm");
jbeans_ycc=rgb2ycc(og_img);

vars = [10^2,20^2,40^2,80^2,100^2];
sqrt_vars= sqrt(vars);

MSE_y=zeros(1,5);
MSE_Cb=zeros(1,5);
MSE_Cr=zeros(1,5);

PSNR_y=zeros(1,5);
PSNR_Cb=zeros(1,5);
PSNR_Cr=zeros(1,5);

SNR_y=zeros(1,5);
SNR_Cb=zeros(1,5);
SNR_Cr=zeros(1,5);


for i = 1:length(vars)
   noise_image = sqrt_vars(i)*randn(256,256);
   
   %initialize channel as original ycc
   ycc_corrupted_y = jbeans_ycc;
   ycc_corrupted_Cb = jbeans_ycc;
   ycc_corrupted_Cr =jbeans_ycc;
   
   %apply noise
   ycc_corrupted_y(:,:,1)=ycc_corrupted_y(:,:,1)+noise_image;
   ycc_corrupted_Cb(:,:,2)=ycc_corrupted_Cb(:,:,2)+noise_image;
   ycc_corrupted_Cr(:,:,3)=ycc_corrupted_Cr(:,:,3)+noise_image;
   
   %ycc to rgb
   rgb_corrupted_y = ycc2rgb(ycc_corrupted_y);
   rgb_corrupted_Cb = ycc2rgb(ycc_corrupted_Cb);
   rgb_corrupted_Cr = ycc2rgb(ycc_corrupted_Cr);
    
   %Creating values for plot
   MSE_y(i)=func_MSE(og_img,rgb_corrupted_y);
   MSE_Cb(i)=func_MSE(og_img,rgb_corrupted_Cb);
   MSE_Cr(i)=func_MSE(og_img,rgb_corrupted_Cr);

   SNR_y(i)=func_SNR(og_img,rgb_corrupted_y);
   SNR_Cb(i)=func_SNR(og_img,rgb_corrupted_Cb);
   SNR_Cr(i)=func_SNR(og_img,rgb_corrupted_Cr);

   PSNR_y(i)=func_PSNR(og_img,rgb_corrupted_y);
   PSNR_Cb(i)=func_PSNR(og_img,rgb_corrupted_Cb);
   PSNR_Cr(i)=func_PSNR(og_img,rgb_corrupted_Cr);

   if i==4
        figure,imagesc(rgb_corrupted_y)
        title('corrupted y')

        figure, imagesc(rgb_corrupted_Cb)
        title('corrupted Cb')

        figure, imagesc(rgb_corrupted_Cr)
        title('corrupted Cr')
   end
end

%plotting MSE 
figure; hold on;
plot(vars,MSE_y);
plot(vars,MSE_Cr,'r');
plot(vars,MSE_Cb,'g');
legend('MSE_y','MSE_Cr','MSE_Cb')
xlabel("Variance")
ylabel("Magnitude of MSE")
title("MSE plot of three corruptions")
hold off


%plotting PSNR
figure; hold on;
plot(vars,PSNR_y);
plot(vars,PSNR_Cr,'r');
plot(vars,PSNR_Cb,'g');
legend('PSNR_y','PSNR_Cr','PSNR_Cb')
xlabel("Variance")
ylabel("Magnitude of PSNR")
title("PSNR plot of three corruptions")
hold off

%Plotting SNR
figure; hold on;
plot(vars,SNR_y);
plot(vars,SNR_Cr,'r');
plot(vars,SNR_Cb,'g');
legend('SNR_y','SNR_Cr','SNR_Cb')
xlabel("Variance")
ylabel("Magnitude of SNR")
title("SNR plot of three corruptions")
hold off