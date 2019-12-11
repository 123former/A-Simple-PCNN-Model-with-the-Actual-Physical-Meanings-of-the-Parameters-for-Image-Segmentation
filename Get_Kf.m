function Kf=Get_Kf(kf,Num)
Temp=zeros(1,Num);
for i=Num:-1:1
    Temp(1,i)=kf^(Num-i);
end
Kf=Temp;
end