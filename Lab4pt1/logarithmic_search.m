function [Prediction, MotionVectors, Flag]= logarithmic_search(Target, Reference)
    %extract image
    target= double(Target);
    reference= double(Reference);
    [rows,cols] =size(target);

    %Initialize vectors
    MB_size= 16*16;
    K= (rows*cols)/(MB_size);%num of MB's
    Flag= zeros(K,1);
    MotionVectors = zeros(K,2); %MotionVectors(1,1)= x vector of MB1,

    %loop through K MBs in order
    current_K=1;
    for x=1:16:rows-15
        for y=1:16:cols-15
            i=0;
            j=0;

            min_SAD= realmax;

            %current target MB
            cur_target= target(x:x+15,y:y+15);
            
            % assume current p begins with p=8/2
            p=4;
            reference_x=x;
            reference_y=y;
            while(p>=1)
                p
                %generate log search_list
                search_list=search_coordinates_log(reference_x,reference_y,rows,cols,p);
                [search_r,search_c]=size(search_list);

                for l=1:1:search_r
                    cur_SAD= SAD(cur_target,reference(search_list(l,1):search_list(l,1)+15,search_list(l,2):search_list(l,2)+15));
    
                    if cur_SAD < min_SAD 
                        min_SAD=cur_SAD;
                        i= search_list(l,1)-x;
                        j= search_list(l,2)-y;

                        reference_x=search_list(l,1);
                        reference_y=search_list(l,2);
                    end
                end
                %iterate p
                p=p/2;
            end

            %Check Threshold and success
            if min_SAD >= 2048
                %failed 
                
                Flag(current_K)=0;
                MotionVectors(current_K,:)=[0,0];
            else 
                %success
                Flag(current_K)=1;
                MotionVectors(current_K,:)=[i,j];
            end

            %iterate K
            current_K=current_K+1;
        end
    end
    
    %Prediction
    current_K=1;
    Prediction=zeros(rows,cols);
    for x=1:16:rows-15
        for y=1:16:cols-15
            if Flag(current_K)==1
                % there is valid motion vector
                Prediction(x:x+15,y:y+15)=reference(x+MotionVectors(current_K,1):x+MotionVectors(current_K,1)+15,y+MotionVectors(current_K,2):y+MotionVectors(current_K,2)+15 );
            end
            %iterate current_K
            current_K=current_K+1;
        end
    end
end
