%6.24Newton法
x0=[2,4]';
dx=zeros(2,1);
tol=1e-6;
%x0=[0,1];
%if f3(x0)<tol
    %error('初值为解')
%end
for i=1:1000
    [L,U]=Crout(df3(x0));
    y=-f3(x0);
    %解LU(dx)=y(二阶的不需要循环)
    x(1)=y(1)/L(1,1);
    x(2)=(y(2)-x(1)*L(2,1))/L(2,2);
    dx(2)=x(2)/U(2,2);
    dx(1)=(x(1)-dx(2)*U(1,2))/U(1,1);
    x1=x0+dx;
    e(i)=norm(f3(x1));
    if e(i)<tol
        break
    end
    x0=x1;
end
if i<1000
    x1
else
    error('not convergence')
end
    figure
    semilogy(e,'*-');