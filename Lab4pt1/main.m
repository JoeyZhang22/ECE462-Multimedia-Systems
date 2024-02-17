target= double(imread("lab4_wk1_p0101_tgt.pgm"));
reference=double(imread("lab4_wk1_p0101_ref.pgm"));
[rows,cols] =size(target);

%sequential function

[Seq_Predictions,Seq_MotionVectors, Seq_Flag]=sequential_search(target, reference);
figure,imshow(uint8(Seq_Predictions));
title("Sequential Prediction picture");

Residual_seq= double(target)-double(Seq_Predictions);
Residual_seq_gray= mat2gray(Residual_seq);
figure, imagesc(uint8(Residual_seq));
title("Sequential Residual");

show_mv(Seq_MotionVectors)
title("Sequential MotionVectors")

%logarithmic functions
search_coordinates_log(17, 17,rows,cols,1)
[Log_Predictions, Log_MotionVectors, Log_Flag]=logarithmic_search(target,reference);
figure,imshow(uint8(Log_Predictions))
title({'Logarithmic Prediction', 'picture'});
% 
Residual_log= double(target)-double(Log_Predictions);
Residual_log_gray= mat2gray(Residual_log);
figure,imagesc(uint8(Residual_log));
title("Logarithmic Residual");
% 
show_mv(Log_MotionVectors)
title("Logarithmic MotionVectors")


%calculate MSE of Logarithmic and Sequential
MSE_log= immse(target,Log_Predictions)
MSE_seq=immse(target, Seq_Predictions)

% search_coordinates_log(1,1,rows,cols, 4)