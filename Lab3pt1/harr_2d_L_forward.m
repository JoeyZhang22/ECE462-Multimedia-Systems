function harr_2d_for_L = harr_2d_L_forward(input_matrix,L)
    %initialization
    [r,c]=size(input_matrix);

    harr_2d_for_L=input_matrix;
    current_sample_size=c;
    %L levels each time lowering sample size
    for i=1:1:L
        harr_2d_for_L(1:current_sample_size,1:current_sample_size)=harr_2d_forward(harr_2d_for_L(1:current_sample_size,1:current_sample_size));
        current_sample_size=current_sample_size/2; %shrink size by two times each time 
    end

end

