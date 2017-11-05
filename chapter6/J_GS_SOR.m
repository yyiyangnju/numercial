%生成矩阵A
%n=input('请输入矩阵的阶数'); 
    T1=zeros(2,1);
    T2=zeros(2,1);
    T3=zeros(2,1);
    order=zeros(2,1);
    eps=1e-6;    %临界条件
    j=0;

for n=2:2:40  
    j=j+1;
    t1=linspace(-1,-1,n-1);
    t2=linspace(2,2,n);
    T=diag(t1,1)+diag(t1,-1)+diag(t2);
    I=eye(n);
    A=kron(T,I)+kron(I,T);
    X=ones(n*n,1);
    b=A*X;  %求出了A和b
    n1=n*n;  %矩阵A的阶数
   
 
    %求最佳松弛因子w
    h=1/(2*(1+n));
    u=1-2*(sin(pi*h))*(sin(pi*h));  %矩阵B的谱半径
    w=2/(1+sqrt(1-u*u));

    %SOR迭代
    x=ones(2,1); %最新解
    x0=zeros(n1,1);   %初始向量

    m=100000;     %最大迭代次数
    for k=1:m
        for i=1:n1
            x(i)=(1-w)*x0(i)+w*(b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n1)*x0(i+1:n1))/A(i,i);
        end
        if norm(x-x0,inf)<eps
           break
        end
        x0=x;
    end
    T1(j)=k;


    %下面进行J迭代
    x0=zeros(n*n,1);%初始向量
    m=1000000;     %最大迭代次数
    k=1;
    D=diag(A);
    while k<=m
          r=b-A*x0;
          x=(r+D.*x0)./D;
          if norm(x-x0,inf)<eps  %残量准则
             break;      
          end
          x0=x;
          k=k+1;
    end
    T2(j)=k;
    
    %下面进行GS迭代
    x0=zeros(n1,1);   %初始向量
    eps=1e-6;    %临界条件
    m=100000;     %最大迭代次数
    D=diag(A);
    x=ones(2,1);    %近似解保存的矩阵 
    for k=1:m
       
        x(1)=(b(1)-A(1,2:n1)*x0(2:end))/A(1,1);
        for i=2:n1-1
            x(i)=(b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n1)*x0(i+1:n1))/A(i,i);
        end
        x(n1)=(b(n1)-A(n1,1:n1-1)*x(1:n1-1))/A(n1,n1);
        if norm(A*x-b,1)<eps
           break
        end
        x0=x;
    end
    T3(j)=k;
    order(j)=n1;
end
order1=1./order;
figure
plot(order1,T1,'*')
xlabel('矩阵阶数倒数'); ylabel('迭代次数');
title('三种方法的矩阵阶数倒数与迭代次数的关系');

hold on
plot(order1,T2,'*')


hold on
plot(order1,T3,'*')
legend('SOR','J','GS')
grid on




%subplot(1,3,1)  
%semilogy(R1,'*')
%xlabel('迭代次数'); ylabel('lne^k');
%title('残量下降曲线(相邻误差停机标准）');

%subplot(1,3,2)
%semilogy(R2,'*')
%xlabel('迭代次数');ylabel('ln||x-x0||');
%title('误差下降曲线(相邻误差停机标准）')


