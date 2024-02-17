function H264_reversed = H264_blocks_backward(T,blocksize)
    %blocksize 
    [n,m] = size(T)

    H264_reversed=zeros(n,n)
    
    for i=1:blocksize:n
        for j=1:blocksize:n
            H264_reversed(i:i+blocksize-1,j:j+blocksize-1) =  H264_backward_4by4(T(i:i+blocksize-1,j:j+blocksize-1));
        end
    end
end

