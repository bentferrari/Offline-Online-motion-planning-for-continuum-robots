clear;
close all;
clc;
%% Initialize target and obstacles
target=[11 26];
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
l=10;
%% Initialize the motions generated by insertion_planner.m
x_list=csvread('myplannertest2_15_07.csv')/l; %k=theta/l
x_list=flip(x_list); % Reverse the motion list due to the backward motion planner
x_list=smoothdata(x_list,'gaussian',20);
%% Main loop
for i=10:150
    var_cc = [x_list(i,:);l, l, l];
    z=-30+0.2*i;
    % Construct the robot shape with var_cc, using 50 points along each segment
    [T1_cc,T2_cc,T3c_cc, tip]=construct_tdcr_cc(var_cc, z);
    %% Plot the robot
    hold on
    plot_tdcr_cc(T1_cc,T2_cc,T3c_cc);
    %% Plot obstacles
    hold on;
    plot(xob1,yob1)
    fill(xob1, yob1,[0.7 0.7 0.7]);
    hold on;
    plot(xob2,yob2)
    fill(xob2, yob2,[0.7 0.7 0.7]);
    hold on;
    plot(xob3,yob3)
    fill(xob3, yob3,[0.7 0.7 0.7]);
    xlim([-15,45]);
    ylim([-50,50]);
    grid on
    drawnow;
    %clf;
end