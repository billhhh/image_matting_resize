% For further assistance please contact the editor ------------------------
% -------------------------------------------------------------------------
%  Editted by : Bill Wang -------------------------------------------------
%  Email : 371570273@qq.com  ----------------------------------------------
%  All rights are reserved ! ----------------------------------------------
% -------------------------------------------------------------------------

% load image
I = imread('Doll.png') ; 
Trimap = imread('Trimap.png'); 

figure(1),imshow(I);
tempImg = Downsize_avr(I);
figure(2),imshow(tempImg);
%figure(3),imshow(Upsize(tempImg));
%imwrite(subimage1,strcat('F:\jinwei\pictureextacted\',[num2str(k),'1.bmp']));
%imwrite(Upsize(tempImg),'.\res_training_lowres\test.png');

for i = 1:5
    imwrite(Upsize(tempImg),strcat('.\res_training_lowres\','test',[num2str(i),'.png']));
end