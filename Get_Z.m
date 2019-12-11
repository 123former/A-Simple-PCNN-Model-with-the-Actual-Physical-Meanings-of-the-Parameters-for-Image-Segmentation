function Z=Get_Z(la,Num)
high=Num;
wide=Num-2;
Temp1=zeros(high,wide);
Temp2=zeros(high,wide);
for i=1:high
    for j=1:wide
        if (j<=wide-i)
           Temp1(i,j) =0;
        else
            Temp1(i,j) =1;
        end
    end
end
for i=1:high
    for j=1:wide
        if (i~=1&&i~=high&&i+j==high)
            Temp2(i,j) =6*la;
        else
            Temp2(i,j) =0;
        end
    end
end
Temp=Temp1+Temp2;
Z=Temp;
end