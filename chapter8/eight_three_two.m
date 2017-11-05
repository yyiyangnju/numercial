%子空间迭代法
n=100;
tol=1e-6;
k=1;
 %n=100 
 
 %标准特征值
 l=zeros(n,1);
 for i=1:n
     l(i)=2*(1-cos(i*pi/(n+1)));
 end
l0=l(n-1:n);

 %构造迭代矩阵
 t1=linspace(-1,-1,n-1);
 t2=linspace(2,2,n);
 A=diag(t1,1)+diag(t1,-1)+diag(t2);
 
 lamda0=zeros(2,1);
%取两列直交阵
v1=rand([n,1]);
v2=rand([n,1]);
V0=[v1,v2];
[V,~]=MGS(V0);

U=A*V;
B=V'*U;
[lamda,~,~,~,W]=oldJaccobi(B);
%l=sort(abs(lamda));  %从小到大排列特征值得绝对值   
[V,~]=MGS(U*W);

while norm(lamda-lamda0,inf)>tol
    lamda0=lamda;
    U=A*V;
    B=V'*U;
    [lamda,~,~,~,W]=oldJaccobi(B);
    %l=sort(abs(lamda));  %从小到大排列特征值得绝对值，不知道有啥用
    [V,~]=MGS(U*W);
    l1=sort(abs(lamda));
    error(k)=abs(l0(1)-l1(1));  
    k=k+1;
end

figure
semilogy(error,'*')
title('第二主特征值误差变化')


  %A的前两个特征值得额近似值


    
    




