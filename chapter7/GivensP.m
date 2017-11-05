%Gives·Ö½â
n=100;
A=hilb(n);
D=hilb(n);
I=eye(n);
%Givens
tic
G=zeros(2);
for i=1:n-1
    for j=n-1:-1:i
        g=eye(n);
        if (A(j+1,i))~=0
            if abs(A(j+1,i))>=abs(A(j,i))
                t=A(j,i)/A(j+1,i);
                G(1,2)=1/sqrt(1+t^2);
                G(1,1)=t*G(1,2);
            else t=A(j+1,i)/A(j,i);
                G(1,1)=1/sqrt(1+t^2);
                G(1,2)=t*G(1,1);
            end
            G(2,1)=-G(1,2);
            G(2,2)=G(1,1);
%             G
            A(j:j+1,i:n)=G*A(j:j+1,i:n);
            g=eye(n);
            g(j,j)=G(1,1);
            g(j,j+1)=G(1,2);
            g(j+1,j)=G(2,1);
            g(j+1,j+1)=G(2,2);
            I=I*g';
        end
    end
end
toc
% I
%Îó²î
norm(D-I*A)
norm(I'*I-eye(n))
