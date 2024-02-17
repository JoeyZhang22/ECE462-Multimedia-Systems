function DCT_transformed = DCT_blocks_forward(image,blocksize)
    %blocksize 
    [n,m] = size(image);
%     F= f_matrix_calc(blocksize);
%     Ft= transpose(F);

    DCT_transformed=zeros(n,n);
    
    for i=1:blocksize:n
        for j=1:blocksize:n
            DCT_transformed(i:i+blocksize -1,j:j+blocksize-1) =  DCT_forward_nbyn(image(i:i+blocksize-1,j:j+blocksize-1));
        end
    end
end
