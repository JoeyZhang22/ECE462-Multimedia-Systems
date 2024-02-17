function forward_dct_quant_matrix = forward_dct_quant(Input,QP, Q_matrix)
    Input=double(Input);
    %reserve size
    forward_dct_quant_matrix=zeros(size(Input));
    %perform DCT forward transform
    forward_dct_quant_matrix= DCT_forward_nbyn(Input);
    %quantize
    forward_dct_quant_matrix= round((forward_dct_quant_matrix)./(QP*Q_matrix));
end

