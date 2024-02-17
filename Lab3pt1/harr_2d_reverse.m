function harr_2d_rev = harr_2d_reverse(input_matrix)
    %initialization
    [r,c]=size(input_matrix);
    harr_2d_rev=input_matrix;
    %reverse columns first
    for j=1:1:c
        harr_2d_rev(:,j)=harr_1d_reverse(transpose(harr_2d_rev(:,j)));
    end

    %reverse on rows second
    for i=1:1:r
        harr_2d_rev(i,:)=harr_1d_reverse(harr_2d_rev(i,:));
    end
end