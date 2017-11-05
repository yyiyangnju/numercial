%Gives·Ö½â
n=input('order')
A=hilb(n);
D=A;
rho=0;
%Givens
tic
G=zeros(2);
for i=1:n-1
    for j=n-1:-1:i
%         g=eye(n);
        if (A(j+1,i))~=0
            if abs(A(j+1,i))>=abs(A(j,i))
                t=A(j,i)/A(j+1,i);
                s=1/sqrt(1+t^2);
                c=t*s;
                rho=2*sign(s)/c;
            else t=A(j+1,i)/A(j,i);
                c=1/sqrt(1+t^2);
                s=t*c;
               rho=sign(c)*s/2;
            end
            G=[c,s;-s,c];
            A(j:j+1,i:n)=G*A(j:j+1,i:n);
            A(j+1,i)=rho;
        else A(j+1,i)=1 
        end
    end
end
toc



%»Ö¸´Q
Q=eye(n);
for i=n-1:-1:1
    for j=i+1:n
        if abs(A(j,i))==1
            c=1;
            s=0;
        else if abs(A(j,i))<1  
                s=2*A(j,i);
                c=sqrt(1-s^2);
            else c=2/A(j,i);
                s=sqrt(1-c^2);
            end
        end
        Q(j-1:j,:)=[c,-s;s,c]*Q(j-1:j,:);
    end
end

%»Ö¸´R
R=triu(A);
%Îó²î
norm(D-Q*R)
norm(Q'*Q-eye(n))


