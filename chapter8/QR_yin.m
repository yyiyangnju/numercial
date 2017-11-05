function [T] =QR_yin(A)
n=size(A,1);
%¼ÆËãwilkinsonÎ»ÒÆ
delta=(A(n-1,n-1)-A(n,n))/2;
t=A(n,n)+delta-sign(delta)*sqrt(delta^2+A(n-1,n)^2);
x=A(1,1)-t;
y=A(2,1);
for k=1:(n-1)
    if y==0
        c=1;
        s=0;
    else if abs(y)>abs(x)
            t=x/y;
            s=1/sqrt(1+t^2);
            c=t*s;
        else
            t=y/x;
            c=1/sqrt(1+t^2);
            s=t*c;
        end
    end
    A(k:k+1,:)=[c,s;-s,c]*A(k:k+1,:);
    A(:,k:k+1)=A(:,k:k+1)*[c,-s;s,c];
    if k<(n-1)
        x=A(k+1,k);
        y=A(k+2,k);
    end
    T=A;
end
    



end

