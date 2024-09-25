global target;
%% Target setting
target=[10,25];
%% Four elements in the solution. x=[theta_1, theta_2, theta_3, z].
lb=[-pi/2, -pi/2, -pi/2, -20];
ub=[pi/2, pi/2, pi/2, 20];
A = [];
b = [];
Aeq = [];
beq = []; 
%% Cost function
fun=@final_shape_fun;
%% Constraint
nonlcon=@final_shape_con;
%% Optimization procedure
[x,fval,exitflag,output,population,scores] = ga(fun,4,[],[],[],[],lb,ub,nonlcon);
