function [cc, ceq]=final_shape_con(theta)
l=10;
k=[theta(1)/l, theta(2)/l, theta(3)/l; l, l, l];
z=theta(4);
[T1_cc,T2_cc,T3c_cc,tip] = construct_tdcr_cc(k, z);
tip1=[T1_cc(:,13),T1_cc(:,14)];
tip2=[T2_cc(:,13),T2_cc(:,14)];
tip3=[T3c_cc(:,13),T3c_cc(:,14)];
%% tube env
ob1=[105, 0];
ob2=[-95,85];
ob3=[80,230];
a=ob1-tip1;
b=ob1-tip2;
c=ob1-tip3;
d=ob2-tip1;
e=ob2-tip2;
f=ob2-tip3;
g=ob3-tip1;
h=ob3-tip2;
i=ob3-tip3;
cc=[100-(a(:,1).^2+a(:,2).^2).^0.5;100-(b(:,1).^2+b(:,2).^2).^0.5;100-(c(:,1).^2+c(:,2).^2).^0.5;100-(d(:,1).^2+d(:,2).^2).^0.5;100-(e(:,1).^2+e(:,2).^2).^0.5;100-(f(:,1).^2+f(:,2).^2).^0.5
     100-(g(:,1).^2+g(:,2).^2).^0.5;100-(h(:,1).^2+h(:,2).^2).^0.5;100-(i(:,1).^2+i(:,2).^2).^0.5];
%% circle env
% ob1=[-15,70];
% ob2=[0,80];
% ob3=[15,70];
% a=ob1-tip1;
% b=ob1-tip2;
% c=ob1-tip3;
% d=ob2-tip1;
% e=ob2-tip2;
% f=ob2-tip3;
% g=ob3-tip1;
% h=ob3-tip2;
% i=ob3-tip3;
% cc=[6-(a(:,1).^2+a(:,2).^2).^0.5;6-(b(:,1).^2+b(:,2).^2).^0.5;6-(c(:,1).^2+c(:,2).^2).^0.5;6-(d(:,1).^2+d(:,2).^2).^0.5;6-(e(:,1).^2+e(:,2).^2).^0.5;6-(f(:,1).^2+f(:,2).^2).^0.5
%     6-(g(:,1).^2+g(:,2).^2).^0.5;6-(h(:,1).^2+h(:,2).^2).^0.5;6-(i(:,1).^2+i(:,2).^2).^0.5];
%% rectangle
% ob1=[30, 35, 0, 30];
% ob2=[70, 75, 20, 50];
% d_12_ob1=abs(ob1(2)-ob1(1));
% d_34_ob1=abs(ob1(4)-ob1(3));
% d_12_ob2=abs(ob2(2)-ob2(1));
% d_34_ob2=abs(ob2(4)-ob2(3));
% a=abs(ob1(1)-tip1(:,1)); %d1 first segment to ob1
% b=abs(ob1(2)-tip1(:,1)); %d2
% c=abs(ob1(3)-tip1(:,2)); %d3
% d=abs(ob1(4)-tip1(:,2)); %d4
% e=abs(ob1(1)-tip2(:,1)); %d1 second segment to ob1
% f=abs(ob1(2)-tip2(:,1)); %d2
% g=abs(ob1(3)-tip2(:,2)); %d3
% h=abs(ob1(4)-tip2(:,2)); %d4
% ii=abs(ob1(1)-tip3(:,1));%d1 third segment to ob1
% j=abs(ob1(2)-tip3(:,1)); %d2
% k=abs(ob1(3)-tip3(:,2)); %d3
% l=abs(ob1(4)-tip3(:,2)); %d4
% 
% a2=abs(ob2(1)-tip1(:,1)); %d1 first segment to ob2
% b2=abs(ob2(2)-tip1(:,1)); %d2
% c2=abs(ob2(3)-tip1(:,2)); %d3
% d2=abs(ob2(4)-tip1(:,2)); %d4
% e2=abs(ob2(1)-tip2(:,1)); %d1 second segment to ob2
% f2=abs(ob2(2)-tip2(:,1)); %d2
% g2=abs(ob2(3)-tip2(:,2)); %d3
% h2=abs(ob2(4)-tip2(:,2)); %d4
% ii2=abs(ob2(1)-tip3(:,1));%d1 third segment to ob2
% j2=abs(ob2(2)-tip3(:,1)); %d2
% k2=abs(ob2(3)-tip3(:,2)); %d3
% l2=abs(ob2(4)-tip3(:,2)); %d4
% 
% cc=[d_12_ob1+d_34_ob1-(a+b+c+d)+0.1; d_12_ob1+d_34_ob1-(e+f+g+h)+0.1; d_12_ob1+d_34_ob1-(ii+j+k+l)+0.1;
%     d_12_ob2+d_34_ob2-(a2+b2+c2+d2)+0.1; d_12_ob2+d_34_ob2-(e2+f2+g2+h2)+0.1; d_12_ob2+d_34_ob2-(ii2+j2+k2+l2)+0.1];
% disp(cc);
ceq=[];
