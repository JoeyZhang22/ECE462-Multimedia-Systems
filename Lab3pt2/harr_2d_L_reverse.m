function harr_2d_rev_L = harr_2d_L_reverse(input_matrix,L)
    %initialization
    [r,c]=size(input_matrix);
    harr_2d_rev_L=input_matrix;

    %find smallest sample from Levels
    current_sample=c/(2^(L-1));
    
    for i=1:1:L
        %iteration increases sample size by 2 times.
        harr_2d_rev_L(1:current_sample,1:current_sample)=harr_2d_reverse(harr_2d_rev_L(1:current_sample,1:current_sample));
        current_sample=current_sample*2;
    end
end