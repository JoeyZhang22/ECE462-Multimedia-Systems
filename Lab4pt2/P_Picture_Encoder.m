function reconstructed_P_picture = P_Picture_Encoder(reference_frame, current_frame,QP, Q_Intra,Q_Inter )
    %perform sequential search
    [Prediction,MotionVectors, Flag]=sequential_search(current_frame,reference_frame);
    
    %perform reconstruction
    current_K=1;
    reconstructed_P_picture=zeros(size(current_frame));
    [rows, cols]=size(current_frame);
    %reserve spot for temp
    temp=zeros(8,8);
    error=zeros(8,8);
    for x=1:16:rows-15
        for y=1:16:cols-15
            if Flag(current_K)==1 %match is found
                prediction_error=current_frame(x:x+15,y:y+15)-Prediction(x:x+15,y:y+15);

                %perform quantization on prediction_error
                error=forward_dct_quant(prediction_error(1:8,1:8),QP,Q_Inter);
                error=inverse_dct_quant(error,QP,Q_Inter);
                error=double(error);
                %reconstructed_P_picture(x:x+7,y:y+7)=error;
                reconstructed_P_picture(x:x+7,y:y+7)=error+Prediction(x:x+7,y:y+7);
                %top right corner
                error=forward_dct_quant(prediction_error(1:8,9:16),QP,Q_Inter);
                error=inverse_dct_quant(error,QP,Q_Inter);
                error=double(error);
                %reconstructed_P_picture(x:x+7,y+8:y+15)=error;
                reconstructed_P_picture(x:x+7,y+8:y+15)=error+Prediction(x:x+7,y+8:y+15);
                %bottom left corner
                error=forward_dct_quant(prediction_error(9:16,1:8),QP,Q_Inter);
                error=inverse_dct_quant(error,QP,Q_Inter);
                error=double(error);
                %reconstructed_P_picture(x+8:x+15,y:y+7)=error;
                reconstructed_P_picture(x+8:x+15,y:y+7)=error+Prediction(x+8:x+15,y:y+7);
                %bottom right corner
                error=forward_dct_quant(prediction_error(9:16,9:16),QP,Q_Inter);
                error=inverse_dct_quant(error,QP,Q_Inter);
                error=double(error);
                %reconstructed_P_picture(x+8:x+15,y+8:y+15)=error;
                reconstructed_P_picture(x+8:x+15,y+8:y+15)=error+Prediction(x+8:x+15,y+8:y+15);

                %populate reconstructed_P_picture
            else %no match is found -> use current MB and Q_Intra
                %top left corner
                temp=forward_dct_quant(current_frame(x:x+7,y:y+7),QP,Q_Intra);
                reconstructed_P_picture(x:x+7,y:y+7)=inverse_dct_quant(temp,QP,Q_Intra);
                %top right corner
                temp=forward_dct_quant(current_frame(x:x+7,y+8:y+15),QP,Q_Intra);
                reconstructed_P_picture(x:x+7,y+8:y+15)=inverse_dct_quant(temp,QP,Q_Intra);
                %bottom left corner
                temp=forward_dct_quant(current_frame(x+8:x+15,y:y+7),QP,Q_Intra);
                reconstructed_P_picture(x+8:x+15,y:y+7)=inverse_dct_quant(temp,QP,Q_Intra);
                %bottom right corner
                temp=forward_dct_quant(current_frame(x+8:x+15,y+8:y+15),QP,Q_Intra);
                reconstructed_P_picture(x+8:x+15,y+8:y+15)=inverse_dct_quant(temp,QP,Q_Intra);
            end
            %iterate current_K
            current_K=current_K+1;
        end
    end
%      reconstructed_P_picture=uint8(reconstructed_P_picture);
end

