 n=101
 %n=100
 %�����������
 t1=linspace(-1,-1,n-1);
 t2=linspace(2,2,n);
 T=diag(t1,1)+diag(t1,-1)+diag(t2);
 
 
 
%����Jacobi����
[lamda,lamda0,error,times]=recircleJacobi_control(T);
%[lamda,lamda0,error,times]=recircleJacobi(T);
%[lamda,lamda0,error,times]=oldJaccobi(T);
 