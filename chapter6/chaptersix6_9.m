%���ɾ���A
n=input('���������Ľ���');
%m=input('����������ڲ��ĵ�������');
t1=linspace(-1,-1,n-1);
t2=linspace(2,2,n);
T=diag(t1,1)+diag(t1,-1)+diag(t2);
I=eye(n);
A=kron(T,I)+kron(I,T);
X=ones(n*n,1);
b=A*X;  %�����A��b
n1=n*n;

%��A�������С����ֵ
l=ones(1,2);
for j=1:n
    l(j)=4*sin(pi*j/(2*(n+1)))*sin(pi*j/(2*(n+1)));
end
l1=2*min(l);
l2=2*max(l);

Times=zeros(2,1);
order=zeros(2,1);
j=0;

for m=1:50
   %����richardson����
    eps=1e-6;  %������׼
    x0=ones(n1,1);  %��ʼֵ
    x=zeros(n1,1);  %���½�
    times=0;  %��¼��������
    %Remain=ones(1,2);  %��¼����
    %WC=ones(1,2);  %��¼���
    %i=0;  %�����ڲ���ʶ


    t=ones(1,m); 
     for k=1:m
         t(k)=1/(((l2-l1)/2)*cos((2*k-1)*pi/(2*m))+(l1+l2)/2);  %�������������
     end
     %����
     while norm(x-x0)>eps
        for k=1:m
             x0=x;
             x=x0+t(k)*(b-A*x0); 
             i=i+1;
             wc=norm(x-x0,inf);  
             %Remain(i)=norm(b-A*x,inf);  %��¼����
             %WC(i)=wc;  %��¼������
             if wc<eps
                 break
             end
        end
        times=times+k;
     end
     j=j+1;
     Times(j)=times
     order(j)=m;
end
figure
%subplot(1,2,1);
%semilogy(Remain,'*'); ylabel('lne^||b-A*x||'); xlabel('iteration times');
%subplot(1,2,2);
%semilogy(WC,'*');ylabel('ln||x-x0||');xlabel('iteration times');
plot(Times,'--*')
title('ѭ��ָ��m����������Ĺ�ϵ')
xlabel('ѭ��ָ��m��ֵ')
ylabel('��������')
         
    
    
    
    
    



