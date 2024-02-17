function bitcode = bitcoding(input_matrix,bits_to_code)
    %store sign matrix
    sign1=sign(input_matrix);
    input_matrix=abs(input_matrix);

    %reserve spot for bitcode
    bitcode=zeros(size(input_matrix));

    %determine b_0
    b_0=floor(log2(max(input_matrix,[],"all")));
    end_point=b_0-bits_to_code;

    %MSB matrix that stores the most significant bit at every location of
    %input_matrix
    MSBs= floor(log2(input_matrix));

    %for loop should loop bits_to_code times. Each time b will be updated:
    %b=b-1
    for b=b_0:-1:end_point+1
        %extract bit plane
        extract_pt1=floor(input_matrix./2^b);
        test_b=b;
        test_end_point=end_point;
        bitplane=mod(extract_pt1,2);

        %three steps of approximation=======================================
        %1. bmsb<b (coefficient not significant)
        bitcode(MSBs<b)=0;
        check_bitcode=bitcode;

        %2. bmsb=b (coefficient found significant at current bit-plane)
        bitcode(MSBs==b)=1.5*2^b;
        check_bitcode=bitcode;

        %3. If bMSB > b (coefficient found significant at a previous bit-plane), then
        x=MSBs>b;
        %if current bit is 1 ->add from previous approximation
        x_1=logical(bitplane & x);
        bitcode(x_1)=bitcode(x_1)+0.5*2^b;
        %if current bit is 0 -> subtract from previous approximation
        x_0=logical(x & bitplane==0);
        bitcode(x_0)=bitcode(x_0)-0.5*2^b;
        %===================================================================

    end

    %multiply final bitcode by sign for complete reconstruction
    bitcode=bitcode.*sign1;
end

