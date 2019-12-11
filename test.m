clear all;
close all;
clc;
numsize=6;
global F;
global Para1;
for num=1:numsize
path1= ['image/000',num2str(num),'.bmp'];
result_path = ['result/000',num2str(num),'.bmp'];
A=imread(path1);
img1=double(rgb2gray(A))/255;
Q=graythresh(img1);
F=[0.5 0.04];
temp=size(F);temp=temp(2);
Init(img1);
if temp~=1
    [Best_score,Best_pos]=Get_value_kf(temp); 
    Para1.alpha_f=-log(Best_pos);
else
    stt1=std2(img1);
    Para1.alpha_f=log10(1.0/stt1);
end

[SumY,R]=compute(img1,F);
F=imbinarize(R);
imwrite(F,result_path);
end