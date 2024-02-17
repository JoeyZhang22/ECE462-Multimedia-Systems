function pred_seq= IPPP(sequence, QP, Q_Intra, Q_Inter)
     %cast as double
     sequence=double(sequence);
     %initialize IPPPP as a matrix of size 288x352x30
     pred_seq=zeros(size(sequence));

     for frame_num=1:1:30
        %for first frame
        if frame_num==1
            pred_seq(:,:,1)=I_Picture_Encoder(sequence(:,:,1),QP,Q_Intra);

        %for ppp frames
        else
            pred_seq(:,:,frame_num)=P_Picture_Encoder(pred_seq(:,:,frame_num-1),sequence(:,:,frame_num),QP,Q_Intra,Q_Inter);
            
            %retrieving MV plot for IPPP
            if frame_num==30
                [Prediction,MotionVectors, Flag]=sequential_search(sequence(:,:,frame_num),pred_seq(:,:,frame_num-1));
                show_mv(MotionVectors)
                title('IPPP MV')
            end
        end

        %subplot(5,6,frame_num), imshow(uint8(pred_seq(:,:,frame_num)))
     end

     pred_seq=uint8(pred_seq);


end

