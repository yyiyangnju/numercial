%反幂法求最靠近2的特征值
 %目标矩阵：T-2I 三对角元素分别存放在d,a,c中
n=101;
% T=diag(ones(n,1)*2)+diag(ones(n-1,1)*(-1),1)+diag(ones(n-1,1)*(-1),-1);
d=ones(n)*0.00001;
a=ones(n-1)*(-1);
c=ones(n-1)*(-1);
%对矩阵进行LU分解/三对角 L=diag(p,a) U=diag(1,q)
p=zeros(n);
q=zeros(n-1)  ;
p(1)=d(1);
q(1)=c(1)/d(1);
for k=2:n-1
    p(k)=d(k)-a(k)*q(k-1);
    q(k)=c(k)/p(k);
end
p(n)=d(n)-a(n)*q(n-1);    
%初始向量
v=ones(n,1);
i=1;%大循环指标
place(1)=101; %返回最大值位置
lamda(1)=1;

for k=1:1000
    i=i+1;
    %线性方程组求解
    v(1)=v(1)/d(1);
    for j=2:n
        v(j)=(v(j)-a(j)*v(j-1))/p(j);
    end
    for j=n-1:-1:1
        v(j)=v(j)-q(j)*v(j+1);
    end     
   %求最大模的首个分量
    maxi(i-1)=v(1);
    for j=2:n
        if abs(maxi(i-1))<abs(v(j))
            maxi(i-1)=v(j);
        end
    end
%     maxi;
    lamda(i-1)=(2-0.00001+1/maxi(i-1));
    place(i-1)=j;
    v=v/maxi(i-1);

end

figure(3)
plot(maxi,'.')
title('最大模的首个分量')
figure(4)
plot(abs(maxi(100:end)))
title('最大模的首个分量的绝对值')

figure(6)
plot(place,'.')
title('最大模的位置')
figure(7)
plot(lamda,'.')
