function cdf_backward_L_out  = cdf_backward_L(input_matrix,L)
    %initialization
    [r,c]=size(input_matrix);
    cdf_backward_L_out=input_matrix;

    %find smallest sample from Levels
    current_sample=c/(2^(L-1));
    
    for i=1:1:L
        %iteration increases sample size by 2 times.
        cdf_backward_L_out(1:current_sample,1:current_sample)=cdf_backward_2D(cdf_backward_L_out(1:current_sample,1:current_sample));
        current_sample=current_sample*2;
    end
end