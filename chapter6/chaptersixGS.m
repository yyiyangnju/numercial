n=input('请输入矩阵的阶数');
 %l=ones(2,1);  %真实误差记录
 %order=ones(2,1); %阶数记录
 %times1=ones(2,1); %迭代次数记录
 
 %奇数阶
%for n=1:2:81
    t1=linspace(-1,-1,n-1);
    t2=linspace(2,2,n);
    T=diag(t1,1)+diag(t1,-1)+diag(t2);
    I=eye(n);
    A=kron(T,I)+kron(I,T);
    X=ones(n*n,1);
    b=A*X;  %求出了A和b
                                          %R=ones(2,1); %残量记录
    n1=n*n;
    %order(n)=n1;
    
    
    %下面进行GS迭代
    x0=zeros(n1,1);   %初始向量
    eps=1e-6;    %临界条件
    m=100000;     %最大迭代次数
    D=diag(A);
    x=ones(2,1);    %近似解保存的矩阵 
    for k=1:m
        %R(k)=norm(b-A*x0,1);
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
    %迭代完毕
    
    %l(k)=norm(x-X,1);%算法停止时的真实误差
    %times1(n)=k;
%end
    

x
k
%figure
%subplot(1,2,1)  
%semilogy(R)
%xlabel('迭代次数'); ylabel('lne^k');
%title('残量下降曲线(残量停机标准）');

%subplot(1,2,2)
%semilogy(l)
%xlabel('迭代次数');ylabel('ln||x-x0||');
%title('误差下降曲线(残量停机标准）')



        