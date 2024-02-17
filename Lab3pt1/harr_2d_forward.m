function harr_2d_for = harr_2d_forward(input_matrix)
    %initialization
    [r,c]=size(input_matrix);
    harr_2d_for=zeros(r,c);

    %do DWT on rows
    for i=1:1:r
        harr_2d_for(i,:)=harr_1d_forward(input_matrix(i,:));
    end

    %do DWT on cols
    for j=1:1:c
        harr_2d_for(:,j)=harr_1d_forward(transpose(harr_2d_for(:,j)));
    end

end