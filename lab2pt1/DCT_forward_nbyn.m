function forward = H264_forward_nbyn(image)
    [n ,m]=size(image);
    F= f_matrix_calc(n);
    Ft= transpose(F);
    forward = F*image*Ft;
end

