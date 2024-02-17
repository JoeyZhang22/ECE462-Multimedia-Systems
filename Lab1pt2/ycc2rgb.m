function rgb_image = ycc2rgb(ycc_image)
    ycc_image = double(ycc_image);
    Y =  ycc_image(:,:,1);
    Cb =  ycc_image(:,:,2)-128;
    Cr =  ycc_image(:,:,3)-128;

    R = 1.0133*Y -0.0025*Cb + 1.3838*Cr;
    G = 1.0051*Y -0.3336 *Cb -0.6928*Cr; 
    B = 1.0079*Y +1.7318 *Cb+0.0047*Cr;

    rgb_image(:,:,1) = R;
    rgb_image(:,:,2) = G;
    rgb_image(:,:,3) = B;

    rgb_image=uint8(rgb_image);
end
