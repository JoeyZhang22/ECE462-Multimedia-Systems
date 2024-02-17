function forward = DCT_forward_4by4(image)
    %only four by four
    F = [1 1 1 1; 2 1 -1 -2; 1 -1 -1 1; 1 -2 2 -1]
    Ft=transpose(F)

    forward = F*image*Ft
end

