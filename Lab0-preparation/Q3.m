A=ones(200,200,1);
n=mean(A, 'all')
% A(:,:,3)=A(:,:,3)-mean(A(:,:,3))
% mean(A(:,:,3))
imagesc(A)