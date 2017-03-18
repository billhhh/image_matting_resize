% For further assistance please contact the editor ------------------------
% -------------------------------------------------------------------------
%  Editted by : Bill Wang -------------------------------------------------
%  Email : 371570273@qq.com  ----------------------------------------------
%  All rights are reserved ! ----------------------------------------------
% -------------------------------------------------------------------------

%write into file
fid=fopen('time_res.txt','a');
    
for i = 8:27

    % Get name prefix
    if i<10
        name_prefix = strcat('GT0',num2str(i));
    else
        name_prefix = strcat('GT',num2str(i));
    end
    
    % load image and trimap
    path = strcat('.\input_training_lowres\',name_prefix,'.png');
    fprintf('Now reading: %s...\n',path);
    I = imread(path);
    path = strcat('.\trimap_training_lowres\Trimap1\',name_prefix,'.png');
    fprintf('Now reading: %s...\n',path);
    Trimap = imread(path);
    
    % call ComprehensiveSamplingMatting .
    %tic;
    t1=clock;
    EstimatedAlpha = ComprehensiveSamplingMatting(I, Trimap) ; 
    %toc;
    t2=clock;
    time = etime(t2,t1);
    fprintf(fid,'%s_Org: %fs ',name_prefix,time);
    %figure(1),imshow(EstimatedAlpha);
    path = strcat('.\res_training_lowres\',name_prefix,'_Org.png');
    fprintf('Now writing: %s...\n',path);
    imwrite(EstimatedAlpha,path);

    %Downsize and upsize test
    %tic;
    t1=clock;
    IDsz = Downsize(I);
    TrimapDsz = Downsize(Trimap);

    EstimatedAlphaDsz = ComprehensiveSamplingMatting(IDsz, TrimapDsz) ;
    EstimatedAlphaDsz = Upsize(I,EstimatedAlphaDsz);
    %toc;
    t2=clock;
    time = etime(t2,t1);
    fprintf(fid,'%s_Dsz: %fs ',name_prefix,time);
    %figure(2),imshow(EstimatedAlphaDsz);
    path = strcat('.\res_training_lowres\',name_prefix,'_Dsz.png');
    fprintf('Now writing: %s...\n',path);
    imwrite(EstimatedAlphaDsz,path);

    %Avr downsize and upsize test
    %tic;
    t1=clock;
    IDsz_avr = Downsize_avr(I);
    TrimapDsz_avr = Downsize(Trimap);

    EstimatedAlphaDsz_avr = ComprehensiveSamplingMatting(IDsz_avr, TrimapDsz_avr) ;
    EstimatedAlphaDsz_avr = Upsize(I,EstimatedAlphaDsz_avr);
    %toc;
    t2=clock;
    time = etime(t2,t1);
    fprintf(fid,'%s_Dsz_avr: %fs\n',name_prefix,time);
    %figure(3),imshow(EstimatedAlphaDsz);
    path = strcat('.\res_training_lowres\',name_prefix,'_Dsz_avr.png');
    fprintf('Now writing: %s...\n',path);
    imwrite(EstimatedAlphaDsz_avr,path);
end

fclose(fid);
