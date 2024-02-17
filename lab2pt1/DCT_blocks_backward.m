function DCT_reversed = DCT_blocks_backward(T,blocksize)
    %blocksize 
    [n,m] = size(T)
%     F= f_matrix_calc(blocksize);
%     Ft= transpose(F);

    DCT_reversed=zeros(n,n)
    
    for i=1:blocksize:n
        for j=1:blocksize:n
            DCT_reversed(i:i+blocksize-1,j:j+blocksize-1) =  DCT_backward_nbyn(T(i:i+blocksize-1,j:j+blocksize-1));
        end
    end
end

