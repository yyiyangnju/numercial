%���ɾ���A
n=input('���������Ľ���');
t1=linspace(-1,-1,n-1);
t2=linspace(2,2,n);
T=diag(t1,1)+diag(t1,-1)+diag(t2);
I=eye(n);
A=kron(T,I)+kron(I,T);
X=ones(n*n,1);
b=A*X;  %�����A��b
R=ones(2,1); %������¼
l=ones(2,1);  %��ʵ����¼
n1=n*n;  %����A�Ľ���

%������ɳ�����w
h=1/(2*(1+n));
u=1-2*(sin(pi*h))*(sin(pi*h));  %����B���װ뾶
w=2/(1+sqrt(1-u*u))

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
    l(k)=norm(x-X,inf);
    R(k)=norm(A*x-b,inf);
    x0=x;
end
k;
x;
figure
subplot(1,2,1)  
semilogy(R,'*')
xlabel('��������'); ylabel('lne^k');
title('�����½�����(�������ͣ����׼��');

subplot(1,2,2)
semilogy(l,'*')
xlabel('��������');ylabel('ln||x-x0||');
title('����½�����(�������ͣ����׼��')



        
        