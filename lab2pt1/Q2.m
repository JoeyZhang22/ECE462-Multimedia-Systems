Ga = zeros(8,8)
Gb = zeros(8,8)

%initialize Ga image
Ga(:,:)=3;

%initialize Gb image
Gb(:,:)=10;
Gb(:,1:2:end)=5

imagesc(Ga)

%testing for Ga
DCT_reversed=DCT_blocks_backward(DCT_blocks_forward(Ga,4),4)
imagesc(Ga)
figure,imagesc(DCT_reversed)

%testing for Gb
DCT_reversed2=DCT_blocks_backward(DCT_blocks_forward(Gb,4),4)
figure,imagesc(Gb)
figure,imagesc(DCT_reversed2)

%================================================================
%for H.264

%Q4 as well? 
%testing for Ga
H264_reversed=H264_blocks_backward(H264_blocks_forward(Ga,4),4)
figure,imagesc(Ga)
figure,imagesc(H264_reversed)

%testing for Gb
H264_reversed2=H264_blocks_backward(H264_blocks_forward(Gb,4),4)
figure,imagesc(Gb)
figure,imagesc(DCT_reversed2)
