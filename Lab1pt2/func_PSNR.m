function PSNR = func_PSNR(img_ORG,img_cor)
%FUNC_PSNR Summary of this function goes here
%   Detailed explanation goes here
img_ORG=double(img_ORG);
img_cor=double(img_cor);

MSE=func_MSE(img_ORG,img_cor);
PSNR= 10*log10((255^2) / MSE);
end

