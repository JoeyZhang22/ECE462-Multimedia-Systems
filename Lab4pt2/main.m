%load Quantization matrix
load('Q_matrices.mat', 'Q_intra')
load('Q_matrices.mat', 'Q_inter')
load('sequence.mat')

%NOTE************************** Please comment out one of the play_frames
%each time when trying to display a specific playback
%try IPPP encoding playback
IPPP_sequences=IPPP(double(sequence),2,Q_intra,Q_inter);
PSNR_IPPP=psnr(IPPP_sequences(:,:,30),sequence(:,:,30))
% 
% 
% %try IPIP encoding playback
IPIP_sequences=IPIP(double(sequence),2,Q_intra,Q_inter);
PSNR_IPIP=psnr(IPIP_sequences(:,:,30),sequence(:,:,30))

%play frames
play_frames(IPIP_sequences,5)
title('IPIP play frames')
play_frames(IPPP_sequences,5)
title('IPPP play frames')