function inverse_dct_quant_matrix = inverse_dct_quant(Input,QP, Q_matrix)
    %perform inverse quantization
    inverse_dct_quant_matrix=Input*QP.*Q_matrix;
    %perform inverse DCT 
    inverse_dct_quant_matrix=DCT_backward_nbyn(inverse_dct_quant_matrix);

%     inverse_dct_quant_matrix=uint8(inverse_dct_quant_matrix);
end
