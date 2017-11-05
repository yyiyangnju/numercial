%生成矩阵A
n=input('请输入矩阵的阶数');
t1=linspace(-1,-1,n-1);
t2=linspace(2,2,n);
T=diag(t1,1)+diag(t1,-1)+diag(t2);
I=eye(n);
A=kron(T,I)+kron(I,T);
X=ones(n*n,1);
b=A*X;  %求出了A和b
R=ones(2,1); %残量记录
l=ones(2,1);  %真实误差记录
n1=n*n;  %矩阵A的阶数

%求最佳松弛因子w
h=1/(2*(1+n));
u=1-2*(sin(pi*h))*(sin(pi*h));  %矩阵B的谱半径
w=2/(1+sqrt(1-u*u))

%SOR迭代
x=ones(2,1); %最新解
x0=zeros(n1,1);   %初始向量
eps=1e-6;    %临界条件
m=100000;     %最大迭代次数
for k=1:m
    for i=1:n1
        x(i)=(1-w)*x0(i)+w*(b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n1)*x0(i+1:n1))/A(i,i);
    end
    if norm(x-x0,inf)<eps
        break
    end
    l(k)=norm(x-X,inf);
    R(k)=norm(A*x-b,inf);
    x0=x;
end
k;
x;
figure
subplot(1,2,1)  
semilogy(R,'*')
xlabel('迭代次数'); ylabel('lne^k');
title('残量下降曲线(相邻误差停机标准）');

subplot(1,2,2)
semilogy(l,'*')
xlabel('迭代次数');ylabel('ln||x-x0||');
title('误差下降曲线(相邻误差停机标准）')



        
        