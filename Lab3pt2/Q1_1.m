%//////////////////////////////////////////////////////////////////////////
%below functions demonstrate the basis images of cdf transform.
proto_matrix= zeros(64,64)

%LL3 
t = tiledlayout(8,8,'TileSpacing','Compact');
nexttile
LL3=proto_matrix;
LL3(4,4)=1;
LL3_rev=cdf_backward_L(LL3,3);
LL3_rev_norm = LL3_rev - min(LL3_rev(:));
LL3_rev_norm = LL3_rev_norm./ max(LL3_rev_norm(:));

imshow(LL3_rev_norm)
title('LL3')

%HL3
nexttile
HL3=proto_matrix;
HL3(4,12)=1;
HL3_rev=cdf_backward_L(HL3,3);
HL3_rev_norm = HL3_rev - min(HL3_rev(:));
HL3_rev_norm = HL3_rev_norm ./ max(HL3_rev_norm(:));
imshow(HL3_rev_norm);
title('HL3')


%HL2
nexttile([2,2])
HL2=proto_matrix;
HL2(8,24)=1;
HL2_rev=cdf_backward_L(HL2,3);
HL2_rev_norm = HL2_rev - min(HL2_rev(:));
HL2_rev_norm = HL2_rev_norm ./ max(HL2_rev_norm(:));
imshow(HL2_rev_norm);
title('HL2')

%HL1
nexttile([4,4])
HL1=proto_matrix;
HL1(16,48)=1;
HL1_rev=cdf_backward_L(HL1,3);
HL1_rev_norm = HL1_rev - min(HL1_rev(:));
HL1_rev_norm = HL1_rev_norm ./ max(HL1_rev_norm(:));
imshow(HL1_rev_norm);
title('HL1')

% %LH3
nexttile
LH3=proto_matrix;
LH3(12,4)=1;
LH3_rev=cdf_backward_L(LH3,3);
LH3_rev_norm = LH3_rev - min(LH3_rev(:));
LH3_rev_norm = LH3_rev_norm ./ max(LH3_rev_norm(:));
imshow(LH3_rev_norm);
title('LH3')

%HH3
nexttile
HH3=proto_matrix;
HH3(12,12)=1;
HH3_rev=cdf_backward_L(HH3,3);
HH3_rev_norm = HH3_rev - min(HH3_rev(:));
HH3_rev_norm = HH3_rev_norm ./ max(HH3_rev_norm(:))
imshow(HH3_rev_norm);
title('HH3')

%LH2
nexttile([2,2])
LH2=proto_matrix;
LH2(16,48)=1;
LH2_rev=cdf_backward_L(LH2,3);
LH2_rev_norm = LH2_rev - min(LH2_rev(:));
LH2_rev_norm = LH2_rev_norm ./ max(LH2_rev_norm(:));
imshow(LH2_rev_norm);
title('LH2')

%HH2
nexttile([2,2])
HH2=proto_matrix;
HH2(24,24)=1;
HH2_rev=cdf_backward_L(HH2,3);
HH2_rev_norm = HH2_rev - min(HH2_rev(:));
HH2_rev_norm = HH2_rev_norm ./ max(HH2_rev_norm(:));
imshow(HH2_rev_norm);
title('HH2')

%LH1
nexttile([4,4])
LH1=proto_matrix;
LH1(48,16)=1;
LH1_rev=cdf_backward_L(LH1,3);
LH1_rev_norm = LH1_rev - min(LH1_rev(:));
LH1_rev_norm = LH1_rev_norm ./ max(LH1_rev_norm(:));
imshow(LH1_rev_norm);
title('LH1')

%HH1
nexttile([4,4])
HH1=proto_matrix;
HH1(48,48)=1;
HH1_rev=cdf_backward_L(HH1,3);
HH1_rev_norm = HH1_rev - min(HH1_rev(:));
HH1_rev_norm = HH1_rev_norm ./ max(HH1_rev_norm(:));
imshow(HH1_rev_norm);
title('HH1')


title(t,'cdf basis images')