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
tempImg = Downsize(I);
figure(2),imshow(tempImg);
figure(3),imshow(Upsize(tempImg));
