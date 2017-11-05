
%练习6.15 MGS方法
%生成矩阵A
m=input('请输入矩阵的行数');%m>n
n=m-1;
t1=-ones(1,n-1);
t2=2*ones(1,n);
T=diag(t1,1)+diag(t1,-1)+diag(t2);
T(m,1:m-2)=0;
T(m,m-1)=-1;
A=T;
%生成b
b=zeros(m,1);
for i=2:(m-2)
    b(i)=i/m;
end
b(1)=1+1/m;
b(m-1)=1+(m-1)/m;
b(m)=0;

%MGS
Q=zeros(m,1);
r=zeros(m,1);
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
Q=A(:,1:n)
r
 
        
        
    
    

















