function [SumY,R]=compute(matrixA,F)
global Para1;
global cont;
temp=size(F);temp=temp(2);
Para1.iterTimes=110;
matrixA1=abs(matrixA);

Para1.V_e=exp(-Para1.alpha_f)+cont;
kf=exp(-Para1.alpha_f);
Kf=Get_Kf(kf,temp+2);
Z=Get_Z(Para1.lambda,temp+2);
Ke=(Kf*Z).*F*Para1.V_e^(-1);
Para1.alpha_e=-log(Ke(1,1));
[SumY,R] = PA_PCNN(matrixA1,Para1);
end