%Broyden
tol=1e-6;
x0=[-0.15,1.4]';
I=eye(2);
A=df2(x0);
v=f2(x0);
H=inv(A);
s=-H*v;  %delta x 
x0=x0+s;
for i=1:20
    w=v;
    v=f2(x0);
    y=v-w;
    d=H*y;
    p=s'*d;
   % if p==0
        %error('method failed')
    %end
    H=H+((s-d)*s'*H)/p;
    s=-H*v;
    x0=x0+s;
    e1(i)=norm(s);
    e(i)=norm(f2(x0));
    B=inv(H);
    %a(i)=B(1,1);
    %e0(i)=norm(v)
    l(i)=norm(df2(x0)*H-I,'fro');  %≈–∂œ «∑Ò ’¡≤µΩJacobiæÿ’Û
   % if e1(i)<tol
       % break
   % end
end
%if i<1000
    %x0
%else
    %error('method failed')
%end

 figure
 semilogy(l,'*-')
