%COMMENT out other parts other than the part you want to Visualize, Joey!
%part 1
ten_by_ten = zeros(10,10,3);
ten_by_ten(:,:,:)=0;
imagesc(ten_by_ten);

%part2
%step through matrix
ten_by_ten((1:2:end),(1:2:end),:)=255;
ten_by_ten((2:2:end),(2:2:end),:)=255;
figure,imagesc(ten_by_ten);
%display using image and converting picture to uint8 format
figure,image(uint8(ten_by_ten));


%part3
ten_by_ten((5:2:7),(4:2:7),:)=0;
ten_by_ten((5:2:7),(4:2:7),1)=255;

ten_by_ten((4:2:7),(5:2:7),:)=0;
ten_by_ten((4:2:7),(5:2:7),1)=255;

image(uint8(ten_by_ten));

%part4
random_pixels = randi([1,255],255,255,3);
figure,image(uint8(random_pixels));
%find mean
mean_red = mean(random_pixels(:,:,1), 'all');
mean_green = mean(random_pixels(:,:,2),'all');
mean_blue = mean(random_pixels(:,:,3), 'all');
 
red_indices=find(random_pixels(:,:,1)>mean_red);
random_pixesl(:,:,1)=

[r_red,c_red]= ind2sub(size(random_pixels(:,:,1)),find(random_pixels(:,:,1)>mean_red))
for i=1:size(r_red)
    random_pixels(r_red(i),c_red(i),1)=mean_red;
end

[r_green,c_green]= ind2sub(size(random_pixels(:,:,2)),find(random_pixels(:,:,2)>mean_green))
for i=1:size(r_green)
    random_pixels(r_green(i),c_green(i),2)=mean_green;
end

[r_blue,c_blue]= ind2sub(size(random_pixels(:,:,3)),find(random_pixels(:,:,3)>mean_blue))
for i=1:size(r_blue)
    random_pixels(r_blue(i),c_blue(i),3)=mean_blue;
end

figure,imagesc(uint8(random_pixels))
% observation: Displays a colour that is more strongly characterized by the
% highest mean among the three channels. 