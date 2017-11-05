%���ɾ���A
n=input('���������Ľ���');
t1=linspace(-1,-1,n-1);
t2=linspace(2,2,n);
T=diag(t1,1)+diag(t1,-1)+diag(t2);
I=eye(n);
A=kron(T,I)+kron(I,T);
X=ones(n*n,1);
b=A*X;  %�����A��b

SORtimes=ones(2,2);  %��һ�е���������¼���ڶ���w��ֵ��¼

n1=n*n;  %����A�Ľ���

for j=1:200
     %������ɳ�����w
     w=2*rand(1);
     SORtimes(2,j)=w;
     
     %SOR
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
     SORtimes(1,j)=k;  %��¼��������
end
                  
figure
semilogy(SORtimes(2,:),SORtimes(1,:),'*')


     

%figure
%subplot(1,2,1)  
%semilogy(R,'*')
%xlabel('��������'); ylabel('lne^k');
%title('�����½�����(�������ͣ����׼��');

%subplot(1,2,2)
%semilogy(l,'*')
%xlabel('��������');ylabel('ln||x-x0||');
%title('����½�����(�������ͣ����׼��')



        