function[SumY,R]=PA_PCNN(matrix,Para)

iteration_times=Para.iterTimes;
alpha_f=Para.alpha_f;
alpha_e=Para.alpha_e ;
lambda=Para.lambda;
V_E=Para.V_e;

% Initialize the PA-PCNN model
[p,q]=size(matrix);
F=abs(matrix);

I=uint8(F*255);

U=zeros(p,q);
Y=zeros(p,q);
T=zeros(p,q);
E=zeros(p,q);

% synaptic weights.
W=[0.5 1 0.5;1 0 1;0.5 1 0.5];

for n=1:iteration_times
    K = conv2(Y,W,'same');
    Y0=Y;
    U = exp(-alpha_f) * U + F .* (1 + lambda * K);
    Y = im2double( U > E );
    E = exp(-alpha_e) * E + V_E * Y;
    Y1=10*Y+K;
    T = T + Y;
    SumY(1,n)=sum(sum(Y));
end
R = 1-T/(iteration_times/2);
figure;imagesc(R)
end