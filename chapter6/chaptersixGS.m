n=input('���������Ľ���');
 %l=ones(2,1);  %��ʵ����¼
 %order=ones(2,1); %������¼
 %times1=ones(2,1); %����������¼
 
 %������
%for n=1:2:81
    t1=linspace(-1,-1,n-1);
    t2=linspace(2,2,n);
    T=diag(t1,1)+diag(t1,-1)+diag(t2);
    I=eye(n);
    A=kron(T,I)+kron(I,T);
    X=ones(n*n,1);
    b=A*X;  %�����A��b
                                          %R=ones(2,1); %������¼
    n1=n*n;
    %order(n)=n1;
    
    
    %�������GS����
    x0=zeros(n1,1);   %��ʼ����
    eps=1e-6;    %�ٽ�����
    m=100000;     %����������
    D=diag(A);
    x=ones(2,1);    %���ƽⱣ��ľ��� 
    for k=1:m
        %R(k)=norm(b-A*x0,1);
        x(1)=(b(1)-A(1,2:n1)*x0(2:end))/A(1,1);
        for i=2:n1-1
            x(i)=(b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n1)*x0(i+1:n1))/A(i,i);
        end
        x(n1)=(b(n1)-A(n1,1:n1-1)*x(1:n1-1))/A(n1,n1);
        if norm(A*x-b,1)<eps
           break
        end
        
        x0=x;
    end
    %�������
    
    %l(k)=norm(x-X,1);%�㷨ֹͣʱ����ʵ���
    %times1(n)=k;
%end
    

x
k
%figure
%subplot(1,2,1)  
%semilogy(R)
%xlabel('��������'); ylabel('lne^k');
%title('�����½�����(����ͣ����׼��');

%subplot(1,2,2)
%semilogy(l)
%xlabel('��������');ylabel('ln||x-x0||');
%title('����½�����(����ͣ����׼��')



        