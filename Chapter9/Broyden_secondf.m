%Broyden
tol=1e-6;
%x0=[-0.15,1.4]';
x0=[2,4]';
I=eye(2);

A=df3(x0);
v=f3(x0);
H=inv(A);
s=-H*v;  %delta x 
x0=x0+s;
for i=1:1000
    w=v;
    v=f3(x0);
    y=v-w;
    d=H*y;
    p=s'*d;
    %if p==0
        %error('method failed')
    %end
    H=H+((s-d)*s'*H)/p;
    s=-H*v;
    x0=x0+s;
    e1(i)=norm(s);
    e(i)=norm(f3(x0));
    B=inv(H);
    a(i)=B(1,1);
    %e0(i)=norm(v)
    l(i)=norm(df3(x0)*H-I,'fro');  %判断是否收敛到Jacobi矩阵
    %if e1(i)<tol
     %   break
    %end
end
%if i<1000
    %x0
%else
    %error('method failed')
%end

  figure
    semilogy(l,'*-');
%两个解（0,3）和（3,0）
%都收敛