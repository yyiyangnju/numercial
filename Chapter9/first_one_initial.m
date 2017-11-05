%判断收敛到不同点的初值的区间位置
%6.23
%精确解为2、3
%取区间[-10,9]
k1=1;
k2=1;
h=0.0001;
for j=1:1000
    p=19*rand(1)-10;
    x0=p;
    tol=1e-8;

    x1=1;
    for i=1:200
        x1=x0-f1(x0)/((f1(x0+h)-f1(x0))/h);
        if abs(x1-x0)<1e-6
            break
        end
        
        x0=x1;
    end



    if i<200
       if abs(x1-2)<1e-4
           a(k1)=p;
           k1=k1+1;
       else
           b(k2)=p;
           k2=k2+1;
       end
    else
        error('not convergent')
    end
end

figure(1)
scatter(a,[1:length(a)],'r')

hold on
scatter(b,1:length(b),'y')
title('割线法不同收敛点的初始值位置')
legend('收敛到2','收敛到-3')
