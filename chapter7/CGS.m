%6.13
n=input('order');
A=hilb(n)
T=A;


%CGS�㷨
U=zeros(n);  %���������Ǿ���U
U(1,1)=norm(A(:,1),2);
A(:,1)=A(:,1)/U(1,1);

for j=2:n 
    p=0;
    for k=1:j-1
        U(k,j)=A(:,k)'*A(:,j);
        p=p+U(k,j)*A(:,k);
    end
    U(j,j)=norm(A(:,j)-p,2);
    A(:,j)=(A(:,j)-p)/U(j,j);
end
Q=A   %������
U   %��������
norm(Q'*Q-eye(n))

    