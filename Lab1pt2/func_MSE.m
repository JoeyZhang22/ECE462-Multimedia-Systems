function MSE = func_MSE(OG_img,noisy_img)
    [row col]=size(OG_img);
    OG_img=double(OG_img);
    noisy_img=double(noisy_img);
    X = sum(sum(((OG_img-noisy_img).^2)));
    Y=X/(row*col);
    MSE=sum(Y);
end

