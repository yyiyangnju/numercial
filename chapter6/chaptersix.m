times=ones(2,1);
order=ones(2,1);
L=ones(2,1);
eps=1e-6;  %�ٽ�����
%���ɾ���A
    t1=linspace(-1,-1,n-1);
    t2=linspace(2,2,n);
    T=diag(t1,1)+diag(t1,-1)+diag(t2);
    I=eye(n);
    A=kron(T,I)+kron(I,T);
    X=ones(n*n,1);
    b=A*X;  %�����A��b
    
   
 
    %�������J����
    x0=zeros(n*n,1);%��ʼ����
    m=1000000;     %����������
    k=1;
    D=diag(A);
    while k<=m
          r=b-A*x0;
          x=(r+D.*x0)./D;
          if norm(x-X,inf)<eps  %����׼��
             break;      
          end
          x0=x;
          k=k+1;
    end
    %x
    %l=norm(x-x0,1)
    L(n)=norm(x-X,1);
  

%figure
%subplot(1,2,1);
%semilogy(R); ylabel('lne^k'); xlabel('iteration times');
%figure(2)
%subplot(1,2,2);
%semilogy(cha);ylabel('ln||x-x0||');xlabel('iteration times');

end


