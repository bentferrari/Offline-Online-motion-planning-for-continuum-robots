function fun=myfun_insertion(theta)
global target_shape_x
global target_shape_y
global i
global z
l=10; 
%% optimization of the i_th point to the 150 point shape to the target shape
k=[theta(1)/l, theta(2)/l, theta(3)/l; l, l, l];
[T1_cc,T2_cc,T3c_cc,tip] = construct_tdcr_cc(k, z);
%% Current shape
shape=[T1_cc;T2_cc;T3c_cc];
shape=[shape(150-i+1:150,13),shape(150-i+1:150,14)]; 
%% Target shape
target_shape=[target_shape_x, target_shape_y];

if i>1
    vector=[shape(i,1)-shape(i-1,1), shape(i,2)-shape(i-1,2)];
    target_vector=[target_shape(i,1)-target_shape(i-1,1), target_shape(i,2)-target_shape(i-1,2)];
else
    vector=[shape(i,1)-shape(i,1), shape(i,2)-shape(i,2)];
    target_vector=[target_shape(i,1)-target_shape(i,1), target_shape(i,2)-target_shape(i,2)];
end
%% Cost function
norm(shape-target_shape);
fun=norm(shape-target_shape)+20*norm(vector-target_vector);
