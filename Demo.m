% load image and trimap 
I = imread('Doll.png') ; 
Trimap = imread('Trimap.png');

% call ComprehensiveSamplingMatting .
EstimatedAlpha = ComprehensiveSamplingMatting(I, Trimap) ; 
figure(1),imshow(EstimatedAlpha);

%Downsize and upsize test
IDsz = Downsize(I);
TrimapDsz = Downsize(Trimap);

EstimatedAlphaDsz = ComprehensiveSamplingMatting(IDsz, TrimapDsz) ;
EstimatedAlphaDsz = Upsize(EstimatedAlphaDsz);
figure(2),imshow(EstimatedAlphaDsz);
