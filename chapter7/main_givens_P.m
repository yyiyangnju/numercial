t=zeros(1,26);
error=zeros(1,26);
for n=5:30
    A=diag(ones(n-1,1)*2,0)+diag(ones(n-2,1)*(-1),-1)+diag(ones(n-2,1)*(-1),1);
    B=zeros(1,n-1);
    B(n-1)=-1;
    A=[A;B];
    b=(1:n)/n;
    b(1)=b(1)+1;
    b(n-1)=b(n-1)+1;
    b(n)=0;
    b=b';
    xls=ones(n-1,1);
    x=zeros(n-1,1);
    
    %Givens
    tic
    G=zeros(2);
    A=[A,b];
    for i=1:n-1
        if (A(i+1,i))~=0
            if abs(A(i+1,i))>=abs(A(i,i))
                t=A(i,i)/A(i+1,i);
                G(1,2)=1/sqrt(1+t^2);
                G(1,1)=t*G(1,2);
            else t=A(i+1,i)/A(i,i);
                G(1,1)=1/sqrt(1+t^2);
                G(1,2)=t*G(1,1);
            end
            G(2,1)=-G(1,2);
            G(2,2)=G(1,1);
            A(i:1+i,i:n)=G*A(i:1+i,i:n);
        end
    end
end