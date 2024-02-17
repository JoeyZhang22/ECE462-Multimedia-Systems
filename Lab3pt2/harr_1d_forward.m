function harr_1d_for = harr_1d_forward(input_array)
    [d,N]=size(input_array);
    temp1=zeros(1,N/2);
    temp2=zeros(1,N/2);
    harr_1d_for=zeros(size(input_array)); %reserve space for harr_1d_for output array
    proto_LP= [1/sqrt(2),1/sqrt(2)];
    proto_HP= [1/sqrt(2),-1/sqrt(2)];
    
    %for low pass
    for i = 1:2:N-1
        temp1(0.5*i+0.5)=dot(proto_LP,input_array(i:i+1));
        temp2(0.5*i+0.5)=dot(proto_HP,input_array(i:i+1));
    end
    harr_1d_for(1:N/2)=temp1;
    harr_1d_for(N/2+1:N)=temp2;
end

