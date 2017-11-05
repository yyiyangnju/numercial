h=0.01;
x0=[0,0]';

tol=1e-5;
for i=1:200
    x1=x0-Jf3(x0,h)\f3(x0);
    e2(i)=norm(x1-x0);
    if e2(i)<tol
        break
    end
    x0=x1;
    h=h*norm(f3(x0));
end
if i<200
    x0
else
    error('method failed')
end
figure
semilogy(e2,'*-')

%初值取[3.5,0.5]时收敛
%判断收敛阈，作图
%约靠近精确解收敛效果越好，作图