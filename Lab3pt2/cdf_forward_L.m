function cdf_forward_L_out = cdf_forward_L(input_matrix,L)
    %initialization
    [r,c]=size(input_matrix);
    cdf_forward_L_out=input_matrix;
    current_sample_size=c;
    %L levels each time lowering sample size
    for i=1:1:L
        cdf_forward_L_out(1:current_sample_size,1:current_sample_size)=cdf_forward_2D(cdf_forward_L_out(1:current_sample_size,1:current_sample_size));
        current_sample_size=current_sample_size/2; %shrink size by two times each time 
    end

end
