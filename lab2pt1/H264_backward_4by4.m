function backward = DCT_backward_4by4(T)
    B= [1 1 1 1/2; 1 1/2 -1 -1; 1 -1/2 -1 1; 1 -1 1 -1/2]
    Bt=transpose(B)
    backward = B*T*Bt
end

