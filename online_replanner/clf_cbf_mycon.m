function [cc, ceq]=clf_cbf_mycon(x)
%x is the safe motion
global k
global k_last
global z
global ob1 % Here we only consider one moving obstacle for simplicity
global tip_final
l=10;
alpha=0.2; % CBF coefficient 
alpha1=0.999; % CLF coefficient (as large as possible)
k=k_last+x;
z_last=z-l/150;
curvature_last=[k_last(1), k_last(2), k_last(3);l, l, l];
curvature=[k(1), k(2), k(3); l, l, l];
[T1_cc_last,T2_cc_last,T3_cc_last,tip_last] = construct_tdcr_cc(curvature_last, z_last);
err_last=sqrt((tip_last(1)-tip_final(1))^2+(tip_last(2)-tip_final(2))^2);
[T1_cc,T2_cc,T3_cc,tip] = construct_tdcr_cc(curvature, z);
err_now=sqrt((tip(1)-tip_final(1))^2+(tip(2)-tip_final(2))^2);
delta_err=err_now-err_last;
%% Last step critical points
critical_1_last=[T1_cc_last(1,13),T1_cc_last(1,14)]; %%%% critical points on the first segment
critical_2_last=[T1_cc_last(25,13),T1_cc_last(25,14)];
critical_3_last=[T1_cc_last(50,13),T1_cc_last(50,14)]; 
critical_4_last=[T2_cc_last(1,13),T2_cc_last(1,14)]; %%%% critical points on the second segment
critical_5_last=[T2_cc_last(25,13),T2_cc_last(25,14)];
critical_6_last=[T2_cc_last(50,13),T2_cc_last(50,14)];
critical_7_last=[T3_cc_last(1,13),T3_cc_last(1,14)]; %%%% critical points on the third segment
critical_8_last=[T3_cc_last(25,13),T3_cc_last(25,14)];
critical_9_last=[T3_cc_last(50,13),T3_cc_last(50,14)];
%% Current step critical points
critical_1=[T1_cc(1,13),T1_cc(1,14)]; %%%% critical points on the first segment
critical_2=[T1_cc(25,13),T1_cc(25,14)];
critical_3=[T1_cc(50,13),T1_cc(50,14)]; 
critical_4=[T2_cc(1,13),T2_cc(1,14)]; %%%% critical points on the second segment
critical_5=[T2_cc(25,13),T2_cc(25,14)];
critical_6=[T2_cc(50,13),T2_cc(50,14)];
critical_7=[T3_cc(1,13),T3_cc(1,14)]; %%%% critical points on the third segment
critical_8=[T3_cc(25,13),T3_cc(25,14)];
critical_9=[T3_cc(50,13),T3_cc(50,14)];

%% Distance between OBs and last-step critical points
a1=ob1-critical_1_last;
a1=(a1(:,1).^2+a1(:,2).^2).^0.5;
b1=ob1-critical_2_last;
b1=(b1(:,1).^2+b1(:,2).^2).^0.5;
c1=ob1-critical_3_last;
c1=(c1(:,1).^2+c1(:,2).^2).^0.5;
d1=ob1-critical_4_last;
d1=(d1(:,1).^2+d1(:,2).^2).^0.5;
e1=ob1-critical_5_last;
e1=(e1(:,1).^2+e1(:,2).^2).^0.5;
f1=ob1-critical_6_last;
f1=(f1(:,1).^2+f1(:,2).^2).^0.5;
h1=ob1-critical_7_last;
h1=(h1(:,1).^2+h1(:,2).^2).^0.5;
j1=ob1-critical_8_last;
j1=(j1(:,1).^2+j1(:,2).^2).^0.5;
l1=ob1-critical_9_last;
l1=(l1(:,1).^2+l1(:,2).^2).^0.5;
%% Distance between OBs and current critical points
a=ob1-critical_1;
a=(a(:,1).^2+a(:,2).^2).^0.5;
b=ob1-critical_2;
b=(b(:,1).^2+b(:,2).^2).^0.5;
c=ob1-critical_3;
c=(c(:,1).^2+c(:,2).^2).^0.5;
d=ob1-critical_4;
d=(d(:,1).^2+d(:,2).^2).^0.5;
e=ob1-critical_5;
e=(e(:,1).^2+e(:,2).^2).^0.5;
f=ob1-critical_6;
f=(f(:,1).^2+f(:,2).^2).^0.5;
h=ob1-critical_7;
h=(h(:,1).^2+h(:,2).^2).^0.5;
j=ob1-critical_8;
j=(j(:,1).^2+j(:,2).^2).^0.5;
l=ob1-critical_9;
l=(l(:,1).^2+l(:,2).^2).^0.5;
cc=[a1-a-alpha*(a1-3);b1-b-alpha*(b1-3);c1-c-alpha*(c1-3);
    d1-d-alpha*(d1-3);e1-e-alpha*(e1-3);f1-f-alpha*(f1-3);
    h1-h-alpha*(h-3);j1-j-alpha*(j1-3);l1-l-alpha*(l1-3);err_now-alpha1*err_last];
disp(cc);
ceq=[];
