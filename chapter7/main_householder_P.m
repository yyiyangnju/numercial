t=zeros(1,26);
error=zeros(1,26);
for n=5:30
    A=diag(ones(n-1,1)*2,0)+diag(ones(n-2,1)*(-1),-1)+diag(ones(n-2,1)*(-1),1);
    B=zeros(1,n-1);
    B(n-1)=-1;
    A=[A;B];
    f=(1:n)/n;
    f(1)=f(1)+1;
    f(n-1)=f(n-1)+1;
    f(n)=0;
    f=f';
    xls=ones(n-1,1);
    x=zeros(n-1,1);
    
    %Householder
    tic
    A=[A,f];
    for i=1:n-1
        %首个分量非零
        alpha=-sign(A(i,i))*norm(A(i:n,i));
        b=alpha*alpha-alpha*A(i,i);
        A(i,i)=A(i,i)-alpha;
        %秩修正运算
        A(i:n,i+1:n)=A(i:n,i+1:n)-A(i:n,i)*(A(i:n,i)'*A(i:n,i+1:n))/b;
        A(i,i)=alpha;
    end
    %求最小二乘解
    for i=n-1:-1:1
        x(i)=(A(i,n)-A(i,i+1:n-1)*x(i+1:n-1))/A(i,i);
    end
    t(n-4)=toc;
    error(n-4)=norm(x-xls);
end






