%��ϰ6.13 MGS����
%���ɾ���A
%n=input('order');
n=50;
A=hilb(n)


%MGS
Q=zeros(n,1);
r=zeros(n,1);  %�����Ǿ���
for k=1:n-1
    r(k,k)=norm(A(:,k),2);
    A(:,k)=A(:,k)/r(k,k);
    for j=(k+1):n
        r(k,j)=A(:,k)'*A(:,j);
        A(:,j)=A(:,j)-r(k,j)*A(:,k);
    end
end
r(n,n)=norm(A(:,n),2);
A(:,n)=A(:,n)/r(n,n);
Q=A;
U=r;
