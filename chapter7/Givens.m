%6.13
%givens
n=input('order');
A=randn(n);
%U=zeros(n);  %生成上三角矩阵U
H=eye(n);   %初始化H
I=eye(n);
for j=1:(n-1)
    x=A(j:end,j);
    G1=eye(n-j+1);
    for k=length(x):(-1):2
        if x(k)==0
            continue
        
        else if(abs(x(k))<abs(x(k-1)))
               t=x(k)/x(k-1);
               c=1/sqrt(1+t*t);
               s=c*t;
            else
               t=x(k-1)/x(k);
               s=1/sqrt(1+t*t);
               c=s*t;
            end
        end
    
        G2=eye(n-j+1);
        G2(k-1:k,k-1:k)=[c s;-s c]
        G1=G2*G1
    end
    G=I;
    G(j:end,j:end)=G1;
    A=G*A;
    H=G*H;
end
Q=H
U=A


        
        
        
