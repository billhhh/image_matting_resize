% For further assistance please contact the editor ------------------------
% -------------------------------------------------------------------------
%  Editted by : Bill Wang -------------------------------------------------
%  Email : 371570273@qq.com  ----------------------------------------------
%  All rights are reserved ! ----------------------------------------------
% -------------------------------------------------------------------------

for i = 1:27

    % Get name prefix
    if i<10
        name_prefix = strcat('GT0',num2str(i));
    else
        name_prefix = strcat('GT',num2str(i));
    end
    
    % load image and trimap
    path = strcat('.\input_training_lowres\',name_prefix,'.png');
    fprintf('Now reading: %s...',path);
    I = imread(path);
    path = strcat('.\trimap_training_lowres\Trimap1\',name_prefix,'.png');
    fprintf('Now reading: %s...',path);
    Trimap = imread(path);

    % call ComprehensiveSamplingMatting .
    EstimatedAlpha = ComprehensiveSamplingMatting(I, Trimap) ; 
    %figure(1),imshow(EstimatedAlpha);
    path = strcat('.\res_training_lowres\',name_prefix,'_Org.png');
    fprintf('Now writing: %s...',path);
    imwrite(EstimatedAlpha,path);

    %Downsize and upsize test
    IDsz = Downsize(I);
    TrimapDsz = Downsize(Trimap);

    EstimatedAlphaDsz = ComprehensiveSamplingMatting(IDsz, TrimapDsz) ;
    EstimatedAlphaDsz = Upsize(EstimatedAlphaDsz);
    %figure(2),imshow(EstimatedAlphaDsz);
    path = strcat('.\res_training_lowres\',name_prefix,'_Dsz.png');
    fprintf('Now writing: %s...',path);
    imwrite(EstimatedAlphaDsz,path);

    %Avr downsize and upsize test
    IDsz_avr = Downsize_avr(I);
    TrimapDsz_avr = Downsize(Trimap);

    EstimatedAlphaDsz_avr = ComprehensiveSamplingMatting(IDsz_avr, TrimapDsz_avr) ;
    EstimatedAlphaDsz_avr = Upsize(EstimatedAlphaDsz_avr);
    %figure(3),imshow(EstimatedAlphaDsz);
    path = strcat('.\res_training_lowres\',name_prefix,'_Dsz_avr.png');
    fprintf('Now writing: %s...',path);
    imwrite(EstimatedAlphaDsz_avr,path);
end
