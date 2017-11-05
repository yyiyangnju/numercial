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
    
    %MGS
    R=zeros(n-1,n-1);         %�����������ξ���
    tic
    for i=1:n-1
        R(i,i)=norm(A(:,i));
        A(:,i)=A(:,i)/R(i,i);   %ֱ������λ��
        R(i,i+1:n-1)=A(:,i)'*A(:,i+1:n-1);  %���м�����������Ԫ��
        A(:,i+1:n-1)=A(:,i+1:n-1)-A(:,i)*R(i,i+1:n-1);    %���¾���A��Ԫ��
    end
    %�ⷽ��Rx=Q'b
    b=A'*b;
    for i=n-1:-1:1
        x(i)=(b(i)-R(i,i+1:n-1)*x(i+1:n-1))/R(i,i);
    end
    t(n-4)=toc;
    error(n-4)=norm(x-xls);
end
figure
plot(error)
