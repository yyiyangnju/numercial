
tol=1e-6;
%生成矩阵T
n=5;
t1=linspace(-1,-1,n-1);
t2=linspace(2,2,n);
T=diag(t1,1)+diag(t1,-1)+diag(t2);

x0=ones(5,1);
x0(3)=0;
lamda0=x0'*T*x0;
z0=zeros(6,1);
z0(1:n)=x0;
z0(n+1)=lamda0;
for i=1:200
    z1=z0-df4(z0(1:5),z0(6),T)\f4(z0(1:5),z0(6),T);
    e(i)=norm(z1-z0);
    if e(i)<tol
        break
    end
    z0=z1;
end
if i<200
    z1
else
    error('method failed')
end

%%取不同的初始向量，收敛到不同的特征值
%%x0=-10*ones(5,1);
%%x0(1)=0;时求出的特征值时3

%%x0=0.3*ones(5,1);
%%x0(3)=0;求出0.2679

%%x0=0.1*ones(5,1);
%%x0(3)=0; 求出2

%%x0=ones(5,1);
%%x0(3)=0; 求出3.7321

%%x0=sqrt(2)*ones(5,1);
%%x0(2)=-1;
%%x0(3)=0;

figure 
semilogy(e,'*-')