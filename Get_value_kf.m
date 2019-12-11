function [Best_score,Best_pos]=Get_value_kf(temp)

SearchAgents_no=30; % Number of search agents
switch temp 
    case 2  
        Function_name='F1'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)
    case 3
        Function_name='F2'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)
end

Max_iteration=1000; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Best_score,Best_pos,cg_curve]=SCA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

figure('Position',[284   214   660   290])
%Draw search space
subplot(1,2,1);
func_plot(Function_name);
title('Test function')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])
grid off

%Draw objective space
subplot(1,2,2);
semilogy(cg_curve,'Color','b')
title('Convergence curve')
xlabel('Iteration');
ylabel('Best flame (score) obtained so far');

axis tight
grid off
box on
legend('SCA')

display(['The best solution obtained by SCA is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by SCA is : ', num2str(Best_score)]);

   