%生成矩阵T
n=5;
t1=linspace(-1,-1,n-1);
t2=linspace(2,2,n);
A=diag(t1,1)+diag(t1,-1)+diag(t2);

x0=ones(5,1);
x0(3)=0;
lamda0=x0'*T*x0;
lamda=3.73205080756888;

 error=zeros(1,3);%记录真实误差变化

 t=1; %记录每一次的误差
 i=1; %指标
 vector=x0;
 while t>1e-6
     u=A*vector;
     [a,d]=max(abs(u));
     m=u(d);
     vector=u/m;
     t=abs(m-lamda);  %真实误差
     error(i)=t;  
    %distance(i)=sqrt(1-vector'*vector0/(norm(vector)));%norm((vector/norm(vector))*(vector/norm(vector))'-(vector0/norm(vector0))*(vector0/norm(vector0))');  %计算距离之前要先把每一个单位化
     i=i+1;
 end
 
 figure(1)
 semilogy(error,'*-')
 title('特征值误差变化');
 xlabel('迭代次数');
 ylabel('误差')
 