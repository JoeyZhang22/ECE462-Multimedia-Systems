function backward = DCT_backward_nbyn(T)
    [n ,m]=size(T)
    F= f_matrix_calc(n)
    B= transpose(F)
    Bt=transpose(B)

    backward = B*T*Bt
end

