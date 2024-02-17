A=zeros(57,5)
A(:,:) = 0.1

for i = 1:6
    for j= 1:6
        temp=zeros(6,6);
        temp(i,j)=255;
        trans_temp= DCT_backward_nbyn(temp);
        A(9*i-5:9*i,9*j-5:9*j)=trans_temp;
    end
end
% 
normA = A - min(A(:))
normA = normA ./ max(normA(:))

imshow(normA)