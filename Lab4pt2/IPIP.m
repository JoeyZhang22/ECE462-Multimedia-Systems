function pred_seq=IPIP(sequence, QP, Q_Intra, Q_Inter)
    %cast as double
    sequence=double(sequence);
    %reserve space for predicted sequence
    pred_seq=zeros(size(sequence));

    for frame_num=1:1:30
        %for odd numbers encode I frames
        if  mod(frame_num,2)==1
            pred_seq(:,:,frame_num)=I_Picture_Encoder(sequence(:,:,frame_num),QP,Q_Intra);
            
        %for even numbers encode P frames
        else
            pred_seq(:,:,frame_num)=P_Picture_Encoder(pred_seq(:,:,frame_num-1),sequence(:,:,frame_num),QP, Q_Intra, Q_Inter);

            %retrieving MV plot for IPIP
            if frame_num==30
                [Prediction,MotionVectors, Flag]=sequential_search(sequence(:,:,frame_num),pred_seq(:,:,frame_num-1));
                show_mv(MotionVectors)
                title('IPIP MV')
            end
        end
    end
    pred_seq=uint8(pred_seq);
end