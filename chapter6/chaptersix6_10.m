%生成矩阵A
n=input('请输入矩阵的阶数');
m=55;
t1=linspace(-1,-1,n-1);
t2=linspace(2,2,n);
T=diag(t1,1)+diag(t1,-1)+diag(t2);
I=eye(n);
A=kron(T,I)+kron(I,T);
X=ones(n*n,1);
b=A*X;  %求出了A和b
n1=n*n;



%求J迭代的G，g,B=L+U
D=diag(A);
D1=diag(1./D);
L=D1*(triu(A)-A);
U=D1*(tril(A)-A);
G=L+U;
g=D1*b;

%求B的最大最小特征值
lamda=eig(G)';
l2=max(lamda);
l1=min(lamda);

%求v、e
v=2/(2-l2-l1);
e=(2-l1-l2)/(l2-l1);


%进行chebishyv半迭代
Remain=ones(1,2);  %记录残量
WC=ones(1,2);  %记录误差
i=0;  %数组内部标识
times=0;  %记录迭代次数

eps=1e-6;  %收敛标准
x0=zeros(n1,1);  %初始值1
x1=G*x0+g;     %初始值2
x=zeros(n1,1);  %最新解
p=zeros(1,2);
p(1)=2;
for k=1:m
     p(k+1)=1/(1-p(k)/4*e*e);
end
while norm(x-X,inf)>=eps
    for k=1:m
        x=p(k+1)*(v*(G*x1+g)+(1-v)*x1)+(1-p(k+1))*x0;
        x0=x1;
        x1=x;
        i=i+1;
        wc=norm(x-X,inf);  
        Remain(i)=norm(b-A*x,inf);  %记录残量
        WC(i)=wc;  %记录相对误差
        if wc<eps
            break
        end
    end
    times=times+k;
    x0=x;
    x1=G*x0+g;
end

figure(1)
subplot(1,2,1);
title('残差下降曲线')
semilogy(Remain,'*'); ylabel('lne^||b-A*x||'); xlabel('iteration times');
subplot(1,2,2);
title('误差下降曲线')
semilogy(WC,'*');ylabel('ln||x-X||');xlabel('iteration times');

                 


