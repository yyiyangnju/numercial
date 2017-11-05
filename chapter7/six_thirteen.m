%�������һ�����淽��
n=input('order');
A=randn(n);
T=A;   %����ԭ����
z=1; %�����ڲ�����
ZJ=zeros(1,4);  %��¼ֱ�����
time=zeros(1,4);         %��¼ʱ��
I=eye(n);


%CGS����
U=zeros(n);  %���������Ǿ���U
tic
U(1,1)=norm(A(:,1),2);
A(:,1)=A(:,1)/U(1,1);
delta=zeros(1,4); %����ȶ���

for j=2:n 
    p=0;
    for k=1:j-1
        U(k,j)=A(:,k)'*A(:,j);
        p=p+U(k,j)*A(:,k);
    end
    U(j,j)=norm(A(:,j)-p,2);
   A(:,j)=(A(:,j)-p)/U(j,j);
end
Q=A ;  %������
%U ;  %��������
time(z)=toc;
ZJ(z)=norm(Q'*Q-I,2);
delta(z)=norm(T-Q*U,2);
z=z+1;

%MGS
A=T;
tic
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
time(z)=toc;
U=r;
ZJ(z)=norm(Q'*Q-I,2);
delta(z)=norm(T-Q*U,2);
z=z+1;


%Householder
A=T;
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


U=diag(a)+(A-tril(A));
time(z)=toc;
ZJ(z)=norm(Q'*Q-I);
delta(z)=norm(T-Q*U,2);
z=z+1;


%Givens
A=T;
tic
for i=1:n-1
    for j=n-1:(-1):i
        if A(j+1,i)~=0
            if abs(A(j+1,i))>=abs(A(j,i))
                t=A(j,i)/A(j+1,i);
                s=1/sqrt(1+t^2);
                c=s*t;
                p=2*sign(s)/c;
            else
                t=A(j+1,i)/A(j,i);
                c=1/sqrt(1+t*t);
                s=c*t;
                p=sign(c)*s/2;
            end
        else
            c=1;
            s=0;
            p=1;
        end
        G=[c s;-s c];
        A(j:j+1,i:end)=G*A(j:j+1,i:end);
        A(j+1,i)=p;
    end
end
%�ָ�Q
Q=eye(n);
for i=n-1:(-1):1
    for j=i+1:n
        if abs(A(j,i))==1
            c=0;
            s=1;
        else if abs(A(j,i))<1
                s=2*A(j,i);
                c=sqrt(1-s^2);
            else
                c=2/A(j,i);
                s=sqrt(1-c^2);
            end
        end
        Q(j-1:j,:)=[c -s;s c]*Q(j-1:j,:);
    end
end
Q %Ϊ��������
U=triu(A)
time(z)=toc;
ZJ(z)=norm(Q'*Q-I,2);
delta(z)=norm(T-Q*U,2);


%��ͼ�Ƚ�
%{figure(1)
plot(time,'*')
xlabel('ֱ��������'); ylabel('����ʱ��');
set(gca,'xtick',1:1:4)
set(gca,'ytick',e-16:8)
set(gca,'xticklabel',{'CGS','MGS','Householder','Givens'})
title('��ͬQR�ֽ�����ʱ��');

figure(2)
plot(ZJ,'*')
xlabel('ֱ��������'); ylabel('��I�Ĳ�');
set(gca,'xtick',1:1:4)
set(gca,'xticklabel',{'CGS','MGS','Householder','Givens'})
title('ֱ������������ֱ����');

figure(3)
plot(delta,'*')
xlabel('ֱ��������'); ylabel('��ԭ����Ĳ�');
set(gca,'xtick',1:1:4)
set(gca,'xticklabel',{'CGS','MGS','Householder','Givens'})
title('ֱ��������������ȶ���');
grid on

time
ZJ
delta


















