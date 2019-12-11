%  Sine Cosine Algorithm (SCA)  
%
%  Source codes demo version 1.0                                                                      
%                                                                                                     
%  Developed in MATLAB R2011b(7.13)                                                                   
%                                                                                                     
%  Author and programmer: Seyedali Mirjalili                                                          
%                                                                                                     
%         e-Mail: ali.mirjalili@gmail.com                                                             
%                 seyedali.mirjalili@griffithuni.edu.au                                               
%                                                                                                     
%       Homepage: http://www.alimirjalili.com                                                         
%                                                                                                     
%  Main paper:                                                                                        
%  S. Mirjalili, SCA: A Sine Cosine Algorithm for solving optimization problems
%  Knowledge-Based Systems, DOI: http://dx.doi.org/10.1016/j.knosys.2015.12.022

% This function containts full information and implementations of the benchmark 
% functions in Table 1, Table 2, and other test functins from the literature 

% lb is the lower bound: lb=[lb_1,lb_2,...,lb_d]
% up is the uppper bound: ub=[ub_1,ub_2,...,ub_d]
% dim is the number of variables (dimension of the problem)

function [lb,ub,dim,fobj] = Get_Functions_details(F)


switch F 
    case 'F1'
        fobj = @F1;
        lb=0;
        ub=1;
        dim=1; 
        
    case 'F2'
        fobj = @F2;
        lb=0;
        ub=2.7;
        dim=1;     

end

end

% F1

function o = F1(kf)
global F;
global Para1;
global cont;
global S21
E1=(kf.^2+6*kf*Para1.lambda+kf+1);
E1_1=(S21.*E1.*kf+S21.*(1+6.*Para1.lambda))/(kf+cont)-1;
E2=(kf.^3+kf.^2+6*kf.^2.*Para1.lambda+kf+1).*(kf+cont);
E2_1=(kf.^3+kf.^2+6*kf.^2.*Para1.lambda+kf+1)/(kf+cont).*F(1,2);
o=abs((E2/(E1.^2)-F(1,1).^2/F(1,2)))+abs(E1_1/E2_1-1);
end
% F2

function o = F2(kf)
global F;
global Para1;
global cont;
E1=(kf.^2+6*kf*Para1.lambda+kf+1);
E2=(kf.^3+kf.^2+6*kf.^2.*Para1.lambda+kf+1).*(kf+cont);
E3=(kf.^4+kf.^3+6*kf.^3.*Para1.lambda+kf.^2+kf+1).*(kf+cont).^2;

o=abs((E2/(E1.^2)-F(1,1).^2/F(1,2)))+abs((E3/(E1.^3)-F(1,1).^3/F(1,3)));
end
