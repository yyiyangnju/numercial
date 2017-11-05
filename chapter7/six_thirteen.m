%随机构造一个可逆方阵
n=input('order');
A=randn(n);
T=A;   %保存原矩阵
z=1; %矩阵内部计数
ZJ=zeros(1,4);  %记录直角误差
time=zeros(1,4);         %记录时间
I=eye(n);


%CGS方法
U=zeros(n);  %生成上三角矩阵U
tic
U(1,1)=norm(A(:,1),2);
A(:,1)=A(:,1)/U(1,1);
delta=zeros(1,4); %向后稳定性

for j=2:n 
    p=0;
    for k=1:j-1
        U(k,j)=A(:,k)'*A(:,j);
        p=p+U(k,j)*A(:,k);
    end
    U(j,j)=norm(A(:,j)-p,2);
   A(:,j)=(A(:,j)-p)/U(j,j);
end
Q=A ;  %正交阵
%U ;  %上三角阵
time(z)=toc;
ZJ(z)=norm(Q'*Q-I,2);
delta(z)=norm(T-Q*U,2);
z=z+1;

%MGS
A=T;
tic
Q=zeros(n,1);
r=zeros(n,1);  %上三角矩阵
for k=1:n-1
    r(k,k)=norm(A(:,k),2);
    A(:,k)=A(:,k)/r(k,k);
    for j=(k+1):n
        r(k,j)=A(:,k)'*A(:,j);
        A(:,j)=A(:,j)-r(k,j)*A(:,k);
    end
end
r(n,n)=norm(A(:,n),2);
A(:,n)=A(:,n)/r(n,n);
Q=A;
time(z)=toc;
U=r;
ZJ(z)=norm(Q'*Q-I,2);
delta(z)=norm(T-Q*U,2);
z=z+1;


%Householder
A=T;
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


U=diag(a)+(A-tril(A));
time(z)=toc;
ZJ(z)=norm(Q'*Q-I);
delta(z)=norm(T-Q*U,2);
z=z+1;


%Givens
A=T;
tic
for i=1:n-1
    for j=n-1:(-1):i
        if A(j+1,i)~=0
            if abs(A(j+1,i))>=abs(A(j,i))
                t=A(j,i)/A(j+1,i);
                s=1/sqrt(1+t^2);
                c=s*t;
                p=2*sign(s)/c;
            else
                t=A(j+1,i)/A(j,i);
                c=1/sqrt(1+t*t);
                s=c*t;
                p=sign(c)*s/2;
            end
        else
            c=1;
            s=0;
            p=1;
        end
        G=[c s;-s c];
        A(j:j+1,i:end)=G*A(j:j+1,i:end);
        A(j+1,i)=p;
    end
end
%恢复Q
Q=eye(n);
for i=n-1:(-1):1
    for j=i+1:n
        if abs(A(j,i))==1
            c=0;
            s=1;
        else if abs(A(j,i))<1
                s=2*A(j,i);
                c=sqrt(1-s^2);
            else
                c=2/A(j,i);
                s=sqrt(1-c^2);
            end
        end
        Q(j-1:j,:)=[c -s;s c]*Q(j-1:j,:);
    end
end
Q %为正交矩阵
U=triu(A)
time(z)=toc;
ZJ(z)=norm(Q'*Q-I,2);
delta(z)=norm(T-Q*U,2);


%画图比较
%{figure(1)
plot(time,'*')
xlabel('直交化方法'); ylabel('所需时间');
set(gca,'xtick',1:1:4)
set(gca,'ytick',e-16:8)
set(gca,'xticklabel',{'CGS','MGS','Householder','Givens'})
title('不同QR分解所需时间');

figure(2)
plot(ZJ,'*')
xlabel('直交化方法'); ylabel('与I的差');
set(gca,'xtick',1:1:4)
set(gca,'xticklabel',{'CGS','MGS','Householder','Givens'})
title('直交阵列向量的直交性');

figure(3)
plot(delta,'*')
xlabel('直交化方法'); ylabel('与原矩阵的差');
set(gca,'xtick',1:1:4)
set(gca,'xticklabel',{'CGS','MGS','Householder','Givens'})
title('直交化方法的向后稳定性');
grid on

time
ZJ
delta


















