function SNR = func_SNR(img_ORG,img_cor)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    img_ORG=double(img_ORG);
    img_cor=double(img_cor);

    [row col]=size(img_cor);

    MSE=func_MSE(img_ORG,img_cor);
    X= sum(sum(sum(img_ORG.^2)));
    Y=X/(row*col);

    SNR=10*log10(Y/MSE);
end

