%6.13
%householder��
%�������������⣬����ָ��Ϊm����ָ��forѭ����1:r(n)
n=input('order');
A=randn(n);
T=A;
%U=zeros(n);  %���������Ǿ���U
H=eye(n);   %��ʼ��H
a=zeros(1,n);
L=zeros(1,n);%��¼ÿһ�еĳ���
B=zeros(1,n);
for i=1:n
    L(i)=norm(A(:,i),2);  %���ÿһ�еĳ���
end

for i=1:n  %��������n
    x=A(i:end,i);
    sigma=sqrt(L(i)^2-A(1:i-1,i)'*A(1:i-1,i)); %���г��ȼ�ȥԭ������
    a(i)=-sign(x(1))*sigma;   %��¼ÿһ�εİ�����ֵ
    e=zeros(n-i+1,1);  %�ӵ�i��Ԫ�ؿ�ʼ������
    e(1)=1;  
    u=x-a(i)*e;
    %A(i:end,i)=u;
    B(i)=0.5*(u'*u); %��¼ÿһ�ε�bֵ
    Hh=eye(n-i+1)-(1/B(i))*(u*u');
   %H1=eye(n);
    %H1(i:end,i:end)=Hh; %������householder����
    A(i:end,i:end)=Hh*A(i:end,i:end); %�����任�����Ƶ�A��һ����
    A(i:end,i)=u;
    
end
    
    %����ָ�Q
    
   Q=eye(n);
    for i=n:(-1):1
        Q(i:end,i:end)=Q(i:end,i:end)-1/B(i)*A(i:end,i)*A(i:end,i)'*Q(i:end,i:end);
    end
Q;
U=diag(a)+(A-tril(A))
norm(T-Q*U)
norm(Q'*Q-eye(n))

    
    
    
