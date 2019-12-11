function Init(matrixA)
global Para1
global S21
matrixA1=abs(matrixA);
S21=max(max(matrixA1));
S11=graythresh(matrixA1);
Para1.lambda=(S21/S11-1.0)/6;
global cont;
cont=S21/S11;
end