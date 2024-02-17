img_OG= imread("jbeans-1.ppm");
img_cor= imread("jbeans_corrupted_sample.ppm");

mse=func_MSE(img_OG,img_cor)
PSNR=func_PSNR(img_OG, img_cor)
peaksnr = psnr(img_cor,img_OG)
SNR=func_SNR(img_cor,img_OG)
