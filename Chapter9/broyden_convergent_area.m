%Broyden
tol=1e-6;
%x0=[-0.15,1.4]';
I=eye(2);
j=1;
m=1;
for k=1:1000
    x0=[4*randn(1)-2,4*rand(1)-1]';   %局部收敛性质
    t0=x0;
    A=df2(x0);
    v=f2(x0);
    H=inv(A);
    s=-H*v;  %delta x 
    x0=x0+s;
    for i=1:1000
        w=v;
        v=f2(x0);
        y=v-w;
        d=H*y;
        p=s'*d;
        if p==0
           error('method failed')
        end
        H=H+((s-d)*s'*H)/p;
        s=-H*v;
        x0=x0+s;
        e(i)=norm(s);
        B=inv(H);
        a(i)=B(1,1);
       %e0(i)=norm(v)
       %l(i)=norm(df2(x0)*H-I,'fro');  %判断是否收敛到Jacobi矩阵
       if e(i)<tol
          break
       end
    end
    if i<1000
       if norm(x0-[0,1]')<tol
           X(:,j)=t0
           j=j+1;
       else
           X1(:,m)=t0;
           m=m+1;
       end
    end
end

figure(1)
scatter(X(1,:),X(2,:),'r')

hold on
scatter(X1(1,:),X1(2,:),'g')
title('割线法不同收敛点的初始值位置')
legend('收敛','不收敛')

