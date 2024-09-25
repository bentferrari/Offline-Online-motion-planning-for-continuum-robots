clear;
clc;
%% Here is the derived configuration from \final_configuration_planning\shape_optimization.m
l=10; % Length of one segment.
configuration=[0.011928	0.47105	-0.098172]; % Configuration from the shape_optimization.m
var_cc = [configuration/l; l, l, l]; % list for construction of the continuum robot.
[T1_cc,T2_cc,T3c_cc, tip] = construct_tdcr_cc(var_cc, 0); %% 13 and 14 columns in T3c_cc are the x,z position
%% Define the target shape
final_shape=[T1_cc;T2_cc;T3c_cc];
final_shape_x=final_shape(:,13);
final_shape_y=final_shape(:,14);
final_shape=[final_shape_x, final_shape_y];
%% Optimization initialization
lb=[-pi/2, -pi/2, -pi/2];
ub=[pi/2, pi/2, pi/2];
A = [];
b = [];
Aeq = [];
beq = [];  
x_list=[];
global target_shape_x
global target_shape_y
global i
global z
%% Main file
for i =1:150
    z=-30+0.2*(i-1);
    target_shape_x=final_shape_x(1:i);
    target_shape_y=final_shape_y(1:i);
    fun=@myfun_insertion;
    [x,fval,exitflag,output,population,scores] = ga(fun,3,[],[],[],[],lb,ub); % Genetic algorithm for nonconvex optimization
    x_list=[x_list;x];
    lb=[x(1)-pi/15, x(2)-pi/15, x(3)-pi/15];
    ub=[x(1)+pi/15, x(2)+pi/15, x(3)+pi/15];
    disp(i)
end
csvwrite('insertion_list.csv',x_list)
