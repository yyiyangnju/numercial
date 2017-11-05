%割线法解6.23
x0=-10;
h=0.0001;
for i=1:200
    x1=x0-f1(x0)/((f1(x0+h)-f1(x0))/h);
    %if abs(x1-x0)<1e-6
        %break
    %end
    l(i)=abs(x1+3)/abs(x0+3)^1.4;  %############
    x0=x1;
end


figure
plot(l,'*')
title('割线法收敛阶数判断图：-3')
xlabel('迭代次数')