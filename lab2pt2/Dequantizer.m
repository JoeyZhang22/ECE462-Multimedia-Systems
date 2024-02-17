function dequantized_channel = dequantizer(channels,quantization_type, R_y, R_C)
    %change R here:
%     R_y=1;
%     R_C=63;
    %reserve quantized_channel
    [n,m,k] = size(channels);
    blocksize=8
    dequantized_channel = zeros(size(channels));
    if quantization_type==3
        %Q-eqn with parameter R
        Q_y=zeros(8,8);
        Q_Chrome=zeros(8,8);
        for i=1:8
            for j=1:8
                Q_y(i,j)= 1+((i-1)^2 +(j-1)^2)*R_y;
                Q_Chrome(i,j)= 1+((i-1)^2 +(j-1)^2)*R_C;
            end
        end

        %perform quantization

        for i=1:blocksize:n
            for j=1:blocksize:m
                dequantized_channel(i:i+blocksize-1, j:j+blocksize-1,1)= channels(i:i+blocksize-1, j:j+blocksize-1,1).*Q_y;
                dequantized_channel(i:i+blocksize-1, j:j+blocksize-1,2)= channels(i:i+blocksize-1, j:j+blocksize-1,2).*Q_Chrome;
                dequantized_channel(i:i+blocksize-1, j:j+blocksize-1,3)= channels(i:i+blocksize-1, j:j+blocksize-1,3).*Q_Chrome;
            end
        end
%         %y-chan
%         dequantized_channel(:,:,1) = channels(:,:,1).*Q_y;
%         %Cb-chan
%         dequantized_channel(:,:,2) = channels(:,:,2).*Q_Chrome;
%         %Cr-chan
%         dequantized_channel(:,:,3) = channels(:,:,3).*Q_Chrome;
        
    elseif quantization_type ==2
        %alpha value
        alpha=5;
        %Quantization using table with Alpha
        Q_y = [16 11 10 16 24 40 51 61; 
               12 12 14 19 26 58 60 55;
               14 13 16 24 40 57 69 56;
               14 17 22 29 51 87 80 62;
               18 22 37 56 68 109 103 77;
               24 36 55 64 81 104 113 92;
               49 64 78 87 103 121 120 101;
               72 92 95 98 112 100 103 107];
        Q_Chrome = [17 18 24 47 99 99 99 99;
                    18 21 26 66 99 99 99 99;
                    24 26 56 99 99 99 99 99;
                    47 66 99 99 99 99 99 99;
                    99 99 99 99 99 99 99 99;
                    99 99 99 99 99 99 99 99;
                    99 99 99 99 99 99 99 99;
                    99 99 99 99 99 99 99 100];

        Q_y= alpha*Q_y;
        Q_Chrome=alpha*Q_Chrome;
        test_in_2=Q_y

        %perform quantization
        %y-chan
        for i=1:blocksize:n
            for j=1:blocksize:m
                dequantized_channel(i:i+blocksize-1, j:j+blocksize-1,1)= channels(i:i+blocksize-1, j:j+blocksize-1,1).*Q_y;
                dequantized_channel(i:i+blocksize-1, j:j+blocksize-1,2)= channels(i:i+blocksize-1, j:j+blocksize-1,2).*Q_Chrome;
                dequantized_channel(i:i+blocksize-1, j:j+blocksize-1,3)= channels(i:i+blocksize-1, j:j+blocksize-1,3).*Q_Chrome;
            end
        end
    else 
        %Quantization using jsut table
        Q_y = [16 11 10 16 24 40 51 61; 
               12 12 14 19 26 58 60 55;
               14 13 16 24 40 57 69 56;
               14 17 22 29 51 87 80 62;
               18 22 37 56 68 109 103 77;
               24 36 55 64 81 104 113 92;
               49 64 78 87 103 121 120 101;
               72 92 95 98 112 100 103 107];
        Q_Chrome = [17 18 24 47 99 99 99 99;
                    18 21 26 66 99 99 99 99;
                    24 26 56 99 99 99 99 99;
                    47 66 99 99 99 99 99 99;
                    99 99 99 99 99 99 99 99;
                    99 99 99 99 99 99 99 99;
                    99 99 99 99 99 99 99 99;
                    99 99 99 99 99 99 99 100];

        %perform quantization
        %y-chan
        n
        m
        for i=1:blocksize:n
            for j=1:blocksize:m
                dequantized_channel(i:i+blocksize-1, j:j+blocksize-1,1)= channels(i:i+blocksize-1, j:j+blocksize-1,1).*Q_y;
                dequantized_channel(i:i+blocksize-1, j:j+blocksize-1,2)= channels(i:i+blocksize-1, j:j+blocksize-1,2).*Q_Chrome;
                dequantized_channel(i:i+blocksize-1, j:j+blocksize-1,3)= channels(i:i+blocksize-1, j:j+blocksize-1,3).*Q_Chrome;
            end
        end

    end


end

