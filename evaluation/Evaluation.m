function [] = Evaluation()
%   此处显示详细说明
clear all;
clc;
result = zeros(27, 3);
for i = 1:27
    if(i<10)
        exact = im2double(rgb2gray(imread(strcat('GT0',num2str(i),'.png'))));
        Org = im2double(imread(strcat('GT0',num2str(i),'_Org.png')));
        Dsz = im2double(imread(strcat('GT0',num2str(i),'_Dsz.png')));
        Dsz_avr = im2double(imread(strcat('GT0',num2str(i),'_Dsz_avr.png')));
        result(i, 1) = sum(sum((Org-exact).*(Org-exact)))/(size(exact, 1)*size(exact, 2));
        result(i, 2) = sum(sum((Dsz-exact).*(Dsz-exact)))/(size(exact, 1)*size(exact, 2));
        result(i, 3) = sum(sum((Dsz_avr-exact).*(Dsz_avr-exact)))/(size(exact, 1)*size(exact, 2));
    else
        exact = im2double(rgb2gray(imread(strcat('GT',num2str(i),'.png'))));
        Org = im2double(imread(strcat('GT',num2str(i),'_Org.png')));
        Dsz = im2double(imread(strcat('GT',num2str(i),'_Dsz.png')));
        Dsz_avr = im2double(imread(strcat('GT',num2str(i),'_Dsz_avr.png')));
        result(i, 1) = sum(sum((Org-exact).*(Org-exact)))/(size(exact, 1)*size(exact, 2));
        result(i, 2) = sum(sum((Dsz-exact).*(Dsz-exact)))/(size(exact, 1)*size(exact, 2));
        result(i, 3) = sum(sum((Dsz_avr-exact).*(Dsz_avr-exact)))/(size(exact, 1)*size(exact, 2));
    end
end
save result.mat result;
end

