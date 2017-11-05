TimesJ1=zeros(2,1);
TimesJ2=zeros(2,1);
TimesJ3=zeros(2,1);
TimesGS1=zeros(2,1);
TimesGS2=zeros(2,1);
TimesGS3=zeros(2,1);
j=0;
order=zeros(2,1);
lJ1=ones(2,1);  %J真实误差记录
lJ2=ones(2,1); 
lJ3=ones(2,1); 
lGS1=ones(2,1);  %GS真实误差记录
lGS2=ones(2,1);
lGS3=ones(2,1);
for n=4:2:10
    j=j+1;
%生成矩阵A
    t1=linspace(-1,-1,n-1);
    t2=linspace(2,2,n);
    T=diag(t1,1)+diag(t1,-1)+diag(t2);
    I=eye(n);
    A=kron(T,I)+kron(I,T);
    X=ones(n*n,1);
    b=A*X;  %求出了A和b
    n1=n*n;
   
  %下面进行J迭代（残量）
    x0=zeros(n*n,1);%初始向量
    m=1000000;     %最大迭代次数
    k=1;
    D=diag(A);
    while k<=m
          r=b-A*x0;
          x=(r+D.*x0)./D;
          if norm(A*x-b,inf)<eps  %残量准则
             break;      
          end
          x0=x;
          k=k+1;
    end
    TimesJ1(j)=k;
    lJ1(j)=norm(x-X,inf);
    
    %下面进行J迭代（相邻误差）
    x0=zeros(n*n,1);%初始向量
    m=1000000;     %最大迭代次数
    k=1;
    D=diag(A);
    while k<=m
          r=b-A*x0;
          x=(r+D.*x0)./D;
          if norm(x-x0,inf)<eps 
             break;      
          end
          x0=x;
          k=k+1;
    end
    TimesJ2(j)=k;
    lJ2(j)=norm(x-X,inf);
    
    
     %下面进行J迭代（后验误差）
    x0=zeros(n*n,1);%初始向量
    x1=zeros(n1,1);
    m=1000000;     %最大迭代次数
    k=1;
    D=diag(A);
    while k<=m
          r=b-A*x0;
          x=(r+D.*x0)./D;
          if k==1
              continue
          end
          delta1=norm(x-x1,inf);
          delta0=norm(x1-x0,inf);
          if (delta1*delta1/delta0)<eps
             break;      
          end
          x0=x1;
          x1=x;
          k=k+1;
    end
    TimesJ3(j)=k;
    lJ3(j)=norm(x-X,inf);
    
    %下面进行GS迭代(残量）
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
        if norm(A*x-b,inf)<eps  %残量准则
           break
        end
        x0=x;
    end
    TimesGS1(j)=k;
    lGS1(j)=norm(x-X,inf);
    
    
     %下面进行GS迭代(相邻误差）
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
        if norm(x-x0,inf)<eps  %残量准则
           break
        end
        x0=x;
    end
    TimesGS2(j)=k;
    lGS2(j)=norm(x-X,inf);
    
    
     %下面进行GS迭代(后验误差）
    x0=zeros(n1,1);   %初始向量
    x1=zeros(n1,1);
    eps=1e-6;    %临界条件
    m=100000;     %最大迭代次数
    D=diag(A);
    x=ones(2,1);    %近似解保存的矩阵 
    for k=1:m
       
        x(1)=(b(1)-A(1,2:n1)*x1(2:end))/A(1,1);
        for i=2:n1-1
            x(i)=(b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n1)*x1(i+1:n1))/A(i,i);
        end
        x(n1)=(b(n1)-A(n1,1:n1-1)*x(1:n1-1))/A(n1,n1);
        delta1=norm(x-x1,inf);
        delta0=norm(x1-x0,inf);
        if k==1
            continue
        end
        if (delta1*delta1/delta0)<eps
           break
        end
        x0=x1;
        x1=x;
    end
    TimesGS3(j)=k;
    lGS3(j)=norm(x-X,inf);
    order(j)=n1;
end


figure(1)
semilogy(order,TimesJ1,'*')
xlabel('矩阵阶数'); ylabel('迭代次数');
title('Jacobi方法不同停机标准的迭代次数的比较');

hold on
semilogy(order,TimesJ2,'*')

hold on
semilogy(order,TimesJ3,'*')

legend('残量','相邻误差','后验误差')
grid on

figure(2)
semilogy(order,lJ1,'*')
xlabel('矩阵阶数'); ylabel('真实误差');
title('Jacobi方法不同停机标准真实误差的比较');

hold on
semilogy(order,lJ2,'*')

hold on
semilogy(order,lJ3,'*')


legend('残量','相邻误差','后验误差')
grid on


figure(3)
semilogy(order,TimesGS1,'*')
xlabel('矩阵阶数'); ylabel('迭代次数');
title('Gauss-Seidel方法不同停机标准的迭代次数的比较');

hold on
semilogy(order,TimesGS2,'*')

hold on
semilogy(order,TimesGS3,'*')

legend('残量','相邻误差','后验误差')
grid on

figure(4)
semilogy(order,lGS1,'*')
xlabel('矩阵阶数'); ylabel('真实误差');
title('Gauss-Seidel方法不同停机标准真实误差的比较');

hold on
semilogy(order,lGS2,'*')

hold on
semilogy(order,lGS3,'*')


legend('残量','相邻误差','后验误差')
grid on









