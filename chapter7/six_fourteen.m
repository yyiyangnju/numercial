%6.14
n=80
C=zeros(80)
c=1;
for i=1:80
    c=c/2
    C(i,i)=c;
end
u=rand(80,1);
U1=eye(80)-2*u*u';
v=rand(80,1);
V1=eye(80)-2*v*v';
A=U1*C*V1;
T=A;
d1=diag(C);

%CGS
U=zeros(n);  %生成上三角矩阵U
U(1,1)=norm(A(:,1),2);
A(:,1)=A(:,1)/U(1,1);

for j=2:n 
    p=0;
    for k=1:j-1
        U(k,j)=A(:,k)'*A(:,j);
        p=p+U(k,j)*A(:,k);
    end
    U(j,j)=norm(A(:,j)-p,2);
    A(:,j)=(A(:,j)-p)/U(j,j);
end
Q=A;
d2=diag(U);

%MGS
A=T;
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
U=r;
d3=diag(U);

figure
semilogy(d1,'+')
%xlabel(''); 
ylabel('对角线值');
%title('');

hold on
semilogy(d2,'o')


hold on
semilogy(d3,'*')
legend('原矩阵','CGS','MGS')
grid on


    