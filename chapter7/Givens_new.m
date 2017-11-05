n=input('order');
A=randn(n)
T=A;

for i=1:n-1
    for j=n-1:(-1):i
        if A(j+1,i)~=0
            if abs(A(j+1,i))>=abs(A(j,i))
                t=A(j,i)/A(j+1,i);
                s=1/sqrt(1+t^2);
                c=s*t;
                p=2*sign(s)/c;
            else
                t=A(j+1,i)/A(j,i);
                c=1/sqrt(1+t*t);
                s=c*t;
                p=sign(c)*s/2;
            end
        else
            c=1;
            s=0;
            p=1;
        end
        G=[c s;-s c];
        A(j:j+1,i:end)=G*A(j:j+1,i:end);
        A(j+1,i)=p;
    end
end
%»Ö¸´Q
Q=eye(n);
for i=n-1:(-1):1
    for j=i+1:n
        if abs(A(j,i))==1
            c=0;
            s=1;
        else if abs(A(j,i))<1
                s=2*A(j,i);
                c=sqrt(1-s^2);
            else
                c=2/A(j,i);
                s=sqrt(1-c^2);
            end
        end
        Q(j-1:j,:)=[c -s;s c]*Q(j-1:j,:);
    end
end
Q %ÎªÕý½»¾ØÕó
U=triu(A) 
norm(T-Q*U)
    























            
        