function fun=final_shape_fun(theta)
% global d1ob1
% global d1ob2
% global d2ob1
% global d2ob2
% global d3ob1
% global d3ob2
global target;
l=10;
k=[theta(1)/l, theta(2)/l, theta(3)/l; l, l, l];
z=theta(4);
[T1_cc,T2_cc,T3c_cc,tip] = construct_tdcr_cc(k, z);
arc1=[T1_cc(:,13),T1_cc(:,14)];
arc2=[T2_cc(:,13),T2_cc(:,14)];
arc3=[T3c_cc(:,13),T3c_cc(:,14)];
% for i=1:50
%     d1ob1(i)=norm(arc1(i,:)-ob1);
%     d1ob2(i)=norm(arc1(i,:)-ob2);
%     d2ob1(i)=norm(arc2(i,:)-ob1);
%     d2ob2(i)=norm(arc2(i,:)-ob2);
%     d3ob1(i)=norm(arc3(i,:)-ob1);
%     d3ob2(i)=norm(arc3(i,:)-ob2);
% end
% 
% d1ob1=d1ob1';
% d1ob2=d1ob2';
% d2ob1=d2ob1';
% d2ob2=d2ob2';
% d3ob1=d3ob1';
% d3ob2=d3ob2';
% d_mean=mean(norm(d1ob1)+norm(d1ob2)+norm(d2ob1)+norm(d2ob2)+norm(d3ob1)+norm(d3ob2));


%disp(tip(1))
% disp((tip(1)-target(1))^2+(tip(2)-target(2))^2);
% fun=(tip(1)-target(1))^2+(tip(2)-target(2))^2
norm(tip-target)
fun=norm(tip-target)+norm(([theta(1) theta(2) theta(3)]))+0.00001/(theta(1)*theta(2)*theta(3));
%fun=[10*norm(tip-target);0.00001*norm(([theta(1) theta(2) theta(3)]));0.00001/(theta(1)*theta(2)*theta(3))];
