%6.23
%精确解为2、3
tol=1e-8;
x0=900;

for i=1:100
    x1=x0-(f1(x0)*df1(x0))/(df1(x0)*df1(x0)-f1(x0)*ddf1(x0));
    df1(x0);
    if abs(2-x1)<tol         %采用相邻误差
      break
   end
    l(i)=abs(x1-2)/abs(x0-2);
    x0=x1;
    e(i)=abs(2-x0);
    
end

figure
semilogy(e,'*-');
xlabel('迭代次数')


%figure
%plot(l,'*')
%title('收敛阶数判断图:-3')

if i<20000
    x1
else
    error('not convergent')
end

%在这里是全局收敛
%为什么只收敛到2

%初值取得不同会收敛到不同的根
%求-3的近似值时，对l(i)进行修改，可发现是超线性收敛，对l(i)分母做修改，收敛到0.4，为二阶收敛
%求2的近似值时，对l(i)进行修改，收敛到1，可发现是一阶收敛
%通过迭代次数可以明显发现，求-3时要快的多