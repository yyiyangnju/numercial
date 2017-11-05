
%练习6.15法方程组
%生成矩阵A
m=input('请输入矩阵的行数');%m>n
n=m-1;
t1=-ones(1,n-1);
t2=2*ones(1,n);
T=diag(t1,1)+diag(t1,-1)+diag(t2);
T(m,1:m-2)=0;
T(m,m-1)=-1;
A=T;
x0=ones(n,1);
%生成b
b=zeros(m,1);
for i=2:(m-2)
    b(i)=i/m;
end
b(1)=1+1/m;
b(m-1)=1+(m-1)/m;
b(m)=0;

%法方程组法
c=zeros(2);
d=zeros(n,1);
for i=1:n
    for j=1:i
        c(i,j)=A(:,i)'*A(:,j);
    end
    d(i)=A(:,i)'*b;
end
%对C做cholesky分解 c=LL^T
c(1,1)=sqrt(c(1,1));
for i=2:n
    c(i,1)=c(i,1)/c(1,1);
end
for j=2:n-1
    c(j,j)=sqrt(c(j,j)-c(j,1:j-1)*c(j,1:j-1)');
    for i=j+1:n
        c(i,j)=(c(i,j)-c(i,1:j-1)*c(j,1:j-1)')/c(j,j);
    end
end
c(n,n)=sqrt(c(n,n)-c(n,1:n-1)*c(n,1:n-1)');
L=tril(c);
y=zeros(n,1);
y(1)=d(1)/L(1,1);
for i=2:n
    y(i)=(d(i)-L(i,1:i-1)*y(1:i-1))/L(i,i);
end
x=zeros(n,1);
L=L';
x(n)=y(n)/L(n,n);
for i=n-1:(-1):1
    x(i)=(y(i)-L(i,i+1:end)*x(i+1:end))/L(i,i);
end
wucha=norm(x-x0,2)

    



    
        

