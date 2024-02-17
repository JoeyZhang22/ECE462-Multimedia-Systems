function cdf_backward_2D_out = cdf_backward_2D(input_matrix)
    %initialization
    [r,c]=size(input_matrix);
    cdf_backward_2D_out=input_matrix;
    %reverse columns first
    for j=1:1:c
        cdf_backward_2D_out(:,j)=rev_cdf(transpose(cdf_backward_2D_out(:,j)));
    end

    %reverse on rows second
    for i=1:1:r
        cdf_backward_2D_out(i,:)=rev_cdf(cdf_backward_2D_out(i,:));
    end
end