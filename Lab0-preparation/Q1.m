X=zeros(300,300,3)
X(:,:,3)=1 %creating pure blue image
X(150:151,:,:)=1
X(:,150:151,:)=1
imagesc(X)

