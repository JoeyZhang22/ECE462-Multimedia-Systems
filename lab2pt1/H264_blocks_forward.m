function H264_forward = H264_blocks_forward(image,blocksize)
    %blocksize 
    [n,m] = size(image)

    H264_forward=zeros(n,n)
    
    for i=1:blocksize:n
        for j=1:blocksize:n
            H264_forward(i:i+blocksize -1,j:j+blocksize-1) =  H264_forward_4by4(image(i:i+blocksize-1,j:j+blocksize-1));
        end
    end 
end

