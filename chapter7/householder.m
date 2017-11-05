%6.13
%householder：
%若是列满秩问题，令行指标为m，列指标for循环中1:r(n)
n=input('order');
A=randn(n);
T=A;
%U=zeros(n);  %生成上三角矩阵U
H=eye(n);   %初始化H
a=zeros(1,n);
L=zeros(1,n);%记录每一列的长度
B=zeros(1,n);
for i=1:n
    L(i)=norm(A(:,i),2);  %算出每一列的长度
end

for i=1:n  %矩阵满秩n
    x=A(i:end,i);
    sigma=sqrt(L(i)^2-A(1:i-1,i)'*A(1:i-1,i)); %已有长度减去原来长度
    a(i)=-sign(x(1))*sigma;   %记录每一次的阿尔法值
    e=zeros(n-i+1,1);  %从地i个元素开始的向量
    e(1)=1;  
    u=x-a(i)*e;
    %A(i:end,i)=u;
    B(i)=0.5*(u'*u); %记录每一次的b值
    Hh=eye(n-i+1)-(1/B(i))*(u*u');
   %H1=eye(n);
    %H1(i:end,i:end)=Hh; %生成了householder矩阵
    A(i:end,i:end)=Hh*A(i:end,i:end); %经过变换后重制的A的一部分
    A(i:end,i)=u;
    
end
    
    %下面恢复Q
    
   Q=eye(n);
    for i=n:(-1):1
        Q(i:end,i:end)=Q(i:end,i:end)-1/B(i)*A(i:end,i)*A(i:end,i)'*Q(i:end,i:end);
    end
Q;
U=diag(a)+(A-tril(A))
norm(T-Q*U)
norm(Q'*Q-eye(n))

    
    
    
