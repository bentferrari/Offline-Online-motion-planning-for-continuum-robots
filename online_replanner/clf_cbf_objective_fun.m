function fun=clf_cbf_objective_fun(x)
global d_k
fun=(x-d_k)*(x-d_k)';
