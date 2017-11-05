%���ɾ���A
n=input('���������Ľ���');

    t1=linspace(-1,-1,n-1);
    t2=linspace(2,2,n);
    T=diag(t1,1)+diag(t1,-1)+diag(t2);
    I=eye(n);
    A=kron(T,I)+kron(I,T);
    X=ones(n*n,1);
    b=A*X;  %�����A��b
    n1=n*n;

    %���й���б��������
    x0=zeros(n1,1);
    eps=1e-6;
    k=1;
    x=x0;
    r=A*x-b;
    p=-r;
    d0=r'*r;
   for k=2:n1
        q=A*p;
        a=d0/(p'*q);
        x=x+a*p;
        r=r+a*q;
        d1=r'*r;
        bb=d1/d0;
        d0=d1;
        p=-r+bb*p;
        if d1<=eps
            break
        end
   end
  times1=k
    
%������ɳ�����w
h=1/(2*(1+n));
u=1-2*(sin(pi*h))*(sin(pi*h));  %����B���װ뾶
w=2/(1+sqrt(1-u*u));

%SOR����
x=ones(2,1); %���½�
x0=zeros(n1,1);   %��ʼ����
eps=1e-6;    %�ٽ�����
m=100000;     %����������
for k=1:m
    for i=1:n1
        x(i)=(1-w)*x0(i)+w*(b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n1)*x0(i+1:n1))/A(i,i);
    end
    if norm(x-x0,inf)<eps
        break
    end
    x0=x;
end
times2=k
   
