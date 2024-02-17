Ga = zeros(8,8)
Gb = zeros(8,8)

%initialize Ga image
Ga(:,:)=3;

%initialize Gb image
Gb(:,:)=10;
Gb(:,1:2:end)=5


input_energy_Ga= norm(Ga)
DCT_forward=DCT_blocks_forward(Ga,4)
DCT_output_energy_Ga = norm(DCT_forward)
imshow(DCT_forward)


input_energy_Gb= norm(Gb)
DCT_output_energy_Gb = norm(DCT_blocks_forward(Gb,4))