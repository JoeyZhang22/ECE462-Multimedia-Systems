function reconstructed_I_Picture = I_Picture_Encoder(current_frame, QP,Q_Intra)
    [rows,cols] =size(current_frame);
    reconstructed_I_Picture=zeros(size(current_frame));

    %calculate number of MacroBlocks
    MB_size= 16*16;
    K= (rows*cols)/(MB_size);%num of MB's

    %loop through K MBs in order
    for x=1:16:rows-15
        for y=1:16:cols-15
            %reserve spot for temp
            temp=zeros(8,8);
            %top left corner
            temp=forward_dct_quant(current_frame(x:x+7,y:y+7),QP,Q_Intra);
            reconstructed_I_Picture(x:x+7,y:y+7)=inverse_dct_quant(temp,QP,Q_Intra);
            %top right corner
            temp=forward_dct_quant(current_frame(x:x+7,y+8:y+15),QP,Q_Intra);
            reconstructed_I_Picture(x:x+7,y+8:y+15)=inverse_dct_quant(temp,QP,Q_Intra);
            %bottom left corner
            temp=forward_dct_quant(current_frame(x+8:x+15,y:y+7),QP,Q_Intra);
            reconstructed_I_Picture(x+8:x+15,y:y+7)=inverse_dct_quant(temp,QP,Q_Intra);
            %bottom right corner
            temp=forward_dct_quant(current_frame(x+8:x+15,y+8:y+15),QP,Q_Intra);
            reconstructed_I_Picture(x+8:x+15,y+8:y+15)=inverse_dct_quant(temp,QP,Q_Intra);
        end
    end

    %reconstructed_I_Picture =uint8(reconstructed_I_Picture);
end

