clear;
clc;
%% Global variables
global d_k
global k
global k0
global k_last
global i
global z
global ob1
global tip_final
%% Initialization of the target and obstacles
target=[23 8];
ob1=[-2, 15];
ob2=[5, 22];
ob3=[8,10];
phi=0:pi/20:2*pi;
xob1=ob1(1)+2*cos(phi);
yob1=ob1(2)+2*sin(phi);
xob2=ob2(1)+2*cos(phi);
yob2=ob2(2)+2*sin(phi);
xob3=ob3(1)+2*cos(phi);
yob3=ob3(2)+2*sin(phi);
z=-30;
err_list=[];
l=10;
%% Pre-planned offline motions from \offline_planner\insertion_planning\insertion_planner.m
k_list=csvread('myplannertest2_15_07.csv')/l; % k=theta/l
k_list=flip(k_list); % Reverse the offline backward motion planning results.
k_list=smoothdata(k_list,'gaussian',20); % Smooth the offline planned curvature.
k_final=k_list(150,:);
k_final=[k_final(1), k_final(2), k_final(3);l, l, l];
[T1,T2,T3,tip_final] = construct_tdcr_cc(k_final, 0);
d_k_list=diff(k_list);% Curvature changes per step.
k0=k_list(1,:);
%% Main loop
for i=1:length(d_k_list)
    %% Moving obstacle1
    ob1=[-2+0.03*i, 15];
    xob1=ob1(1)+2*cos(phi);
    yob1=ob1(2)+2*sin(phi);
%     %% Moving obstacle3
%     ob3=[5,22-0.03*i];
%     xob3=ob3(1)+2*cos(phi);
%     yob3=ob3(2)+2*sin(phi);
    %% Give the last step curvature when i==1
    if i==1
        k_last=k0;
    end
    %% CLF-CBF-QP optimization conditions
    lb=[-0.04, -0.04, -0.04];
    ub=[0.04, 0.04, 0.04];
    A = [];
    b = [];
    Aeq = [];
    beq = [];  
    d_k=d_k_list(i,:); % Curvature changes per step.
    x0=d_k;
    %% CLF-CBF-QP Optimization
    fun=@clf_cbf_objective_fun; % Cost function: min||u_s-u_r||
    nonlcon=@clf_cbf_mycon; % CLF-CBF Conditions
    [x,fval,exitflag,output,population,scores] = fmincon(fun,x0,[],[],[],[],lb,ub,nonlcon); 
    d_ks=x; % Safety-critical curvature changes.
    k=k_last+d_ks;
    k_last=k;
    %% Update positions and construct the latest robot's shape
    var_cc = [k;l, l, l];
    z=-30+0.2*(i-1);
    [T1_cc,T2_cc,T3c_cc, tip] = construct_tdcr_cc(var_cc, z);
    %% Plot robot
    plot_tdcr_cc(T1_cc,T2_cc,T3c_cc);
    hold on
    %% Plot obstacles
    plot(xob1,yob1)
    fill(xob1, yob1,[0.7 0.7 0.7]);
    hold on
    plot(xob3,yob3)
    fill(xob3, yob3,[0.7 0.7 0.7]);
    xlim([-18,40]);
    ylim([-30,30]);
    grid on
    hold on
    drawnow;
    clf; 
end
plot(err_list);
