function cdf_for_2D = cdf_forward_2D(input_matrix)
    %initialization
    [r,c]=size(input_matrix);
    cdf_for_2D=zeros(r,c);
    
    %do DWT on rows
    for i=1:1:r
        cdf_for_2D(i,:)=fwd_cdf(input_matrix(i,:));
    end

    %do DWT on cols
    for j=1:1:c
        cdf_for_2D(:,j)=fwd_cdf(transpose(cdf_for_2D(:,j)));
    end

end

