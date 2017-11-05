%���ɾ���A
n=input('���������Ľ���');
m=55;
t1=linspace(-1,-1,n-1);
t2=linspace(2,2,n);
T=diag(t1,1)+diag(t1,-1)+diag(t2);
I=eye(n);
A=kron(T,I)+kron(I,T);
X=ones(n*n,1);
b=A*X;  %�����A��b
n1=n*n;



%��J������G��g,B=L+U
D=diag(A);
D1=diag(1./D);
L=D1*(triu(A)-A);
U=D1*(tril(A)-A);
G=L+U;
g=D1*b;

%��B�������С����ֵ
lamda=eig(G)';
l2=max(lamda);
l1=min(lamda);

%��v��e
v=2/(2-l2-l1);
e=(2-l1-l2)/(l2-l1);


%����chebishyv�����
Remain=ones(1,2);  %��¼����
WC=ones(1,2);  %��¼���
i=0;  %�����ڲ���ʶ
times=0;  %��¼��������

eps=1e-6;  %������׼
x0=zeros(n1,1);  %��ʼֵ1
x1=G*x0+g;     %��ʼֵ2
x=zeros(n1,1);  %���½�
p=zeros(1,2);
p(1)=2;
for k=1:m
     p(k+1)=1/(1-p(k)/4*e*e);
end
while norm(x-X,inf)>=eps
    for k=1:m
        x=p(k+1)*(v*(G*x1+g)+(1-v)*x1)+(1-p(k+1))*x0;
        x0=x1;
        x1=x;
        i=i+1;
        wc=norm(x-X,inf);  
        Remain(i)=norm(b-A*x,inf);  %��¼����
        WC(i)=wc;  %��¼������
        if wc<eps
            break
        end
    end
    times=times+k;
    x0=x;
    x1=G*x0+g;
end

figure(1)
subplot(1,2,1);
title('�в��½�����')
semilogy(Remain,'*'); ylabel('lne^||b-A*x||'); xlabel('iteration times');
subplot(1,2,2);
title('����½�����')
semilogy(WC,'*');ylabel('ln||x-X||');xlabel('iteration times');

                 


