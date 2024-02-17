function harr_1d_rev = harr_1d_reverse(input_array)
    [d,N]=size(input_array);
    proto_LP= [1/sqrt(2),1/sqrt(2)];
    proto_HP= [1/sqrt(2),-1/sqrt(2)];
    harr_1d_rev=input_array;

    %isolate array into 2 halves
    first_half=input_array(1:N/2);
    second_half=input_array(N/2+1:N);
    
    %upsample first half
    first_half=upsample(first_half,2);
    second_half=upsample(second_half,2);

    %convolve and delete last 
    conv_first_half=conv(first_half,proto_LP);
    conv_first_half(end)=[];%shorten first half array by the last zero padding
    conv_second_half=conv(second_half,proto_HP);
    conv_second_half(end)=[];

    %sum
    sum=conv_first_half+conv_second_half;
    harr_1d_rev=sum;
    
end

