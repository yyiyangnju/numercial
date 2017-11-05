 n=input('请输入矩阵的阶数');
m=5;
t1=linspace(-1,-1,n-1);%生成A
    t2=linspace(2,2,n);
    T=diag(t1,1)+diag(t1,-1)+diag(t2);
    I=eye(n);
    A=kron(T,I)+kron(I,T);
    X=ones(n*n,1);
    b=A*X;  %求出了A和b
    n1=n*n;
   x0=zeros(n1,1);

%求J迭代的G，g,B=L+U
%D=diag(A);
%D1=diag(1./D);
%L=D1*(triu(A)-A);
%U=D1*(tril(A)-A);
%G=L+U;
%g=D1*b;

%求B的最大最小特征值
%lamda=eig(G)';
%lam_max=max(lamda);
%lam_min=min(lamda);


TT=zeros(m+1);
TT(1,1)=1;
TT(2,2)=1;
for k=3:m+1
    tt=[0,TT(k-1,1:m)];
    TT(k,:)=2*tt-TT(k-2,:);
end
TT_real=TT;
for j=2:m+1
    for k=1:m+1
        t=polyval(fliplr(TT(j,:)),2/(lam_max-lam_min));
        if k==1
            TT_real(j,k)=TT(j,k)/t;
        else
            TT_real(j,k)=TT(j,k)*(2/(lam_max-lam_min))^(k-1)/t;
        end
    end
end
xx=zeros(size(A,1),m+1);
xx(:,1)=x0;
D=diag(diag(A));
C=A-D;
U=-inv(D)*triu(C);
L=-inv(D)*tril(C);
B=U+L;
g=inv(D)*b;
for k=2:m+1
    xx(:,k)=B*xx(:,k-1)+g;
end
y=xx;
y(:,2:end)=0;
for j=2:m+1
    for k=1:j
        y(:,j)=y(:,j)+TT_real(j,k)*xx(:,k);
    end
end
x=y(:,m+1);
kkk=1:m+1;
y1=kkk;
y2=kkk;
for k=1:m+1
    y1(k)=norm(xx(:,k)-X,2);
    y2(k)=norm(A*xx(:,k)-b,2);
end
subplot(1,2,1);
semilogy(y1,'*');
subplot(1,2,2);
semilogy(kkk,y2,'*');



