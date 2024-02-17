% question 1
image = zeros(4,4)
image(1:2:end,:)=1
image(2:2:end,:)=1
image(:,1:2:end)=0

imagex=[1 0 1 0; 1 1 1 0; 1 1 1 0; 1 1 1 0]

imagesc(uint8(imagex))

F=f_matrix_calc(4)

DCT_transform= DCT_forward_nbyn(imagex)
image_after = DCT_backward_nbyn(DCT_transform)

figure, imagesc(image_after)

image_after2= H264_backward_4by4(H264_forward_4by4(imagex))
figure,imagesc(image_after2)