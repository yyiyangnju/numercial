%生成矩阵A
n=input('请输入矩阵的阶数');
%m=input('请输入黑箱内部的迭代次数');
t1=linspace(-1,-1,n-1);
t2=linspace(2,2,n);
T=diag(t1,1)+diag(t1,-1)+diag(t2);
I=eye(n);
A=kron(T,I)+kron(I,T);
X=ones(n*n,1);
b=A*X;  %求出了A和b
n1=n*n;

%求A的最大最小特征值
l=ones(1,2);
for j=1:n
    l(j)=4*sin(pi*j/(2*(n+1)))*sin(pi*j/(2*(n+1)));
end
l1=2*min(l);
l2=2*max(l);

Times=zeros(2,1);
order=zeros(2,1);
j=0;

for m=1:50
   %进行richardson迭代
    eps=1e-6;  %收敛标准
    x0=ones(n1,1);  %初始值
    x=zeros(n1,1);  %最新解
    times=0;  %记录迭代次数
    %Remain=ones(1,2);  %记录残量
    %WC=ones(1,2);  %记录误差
    %i=0;  %数组内部标识


    t=ones(1,m); 
     for k=1:m
         t(k)=1/(((l2-l1)/2)*cos((2*k-1)*pi/(2*m))+(l1+l2)/2);  %计算各迭代参数
     end
     %黑箱
     while norm(x-x0)>eps
        for k=1:m
             x0=x;
             x=x0+t(k)*(b-A*x0); 
             i=i+1;
             wc=norm(x-x0,inf);  
             %Remain(i)=norm(b-A*x,inf);  %记录残量
             %WC(i)=wc;  %记录相对误差
             if wc<eps
                 break
             end
        end
        times=times+k;
     end
     j=j+1;
     Times(j)=times
     order(j)=m;
end
figure
%subplot(1,2,1);
%semilogy(Remain,'*'); ylabel('lne^||b-A*x||'); xlabel('iteration times');
%subplot(1,2,2);
%semilogy(WC,'*');ylabel('ln||x-x0||');xlabel('iteration times');
plot(Times,'--*')
title('循环指标m与迭代次数的关系')
xlabel('循环指标m的值')
ylabel('迭代次数')
         
    
    
    
    
    



