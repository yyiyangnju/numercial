%���ɾ���A

i=1; %��¼������ָ�� 
times=zeros(2,1);  %��¼��������
order=zeros(2,1);   %��¼������� 
eps=1e-6;
for n=4:2:100
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
    
    i=i+1;
    order(i)=n;
    times(i)=k;
end
figure
plot(order,times,'*')
xlabel('�������')
ylabel('��������')
title('CG�������������������Ĺ�ϵ')


    
    
    
    


