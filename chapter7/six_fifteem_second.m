for m=5:100
       
    %生成矩阵A
    
     %m=input('请输入矩阵的行数');%m>n
     n=m-1;
     t1=-ones(1,n-1);
     t2=2*ones(1,n);
     T=diag(t1,1)+diag(t1,-1)+diag(t2);
     T(m,1:m-2)=0;
     T(m,m-1)=-1;
     A=T;
     x0=ones(n,1);  %精确解
     %生成b
     b=zeros(m,1);
     for i=2:(m-2)
         b(i)=i/m;
     end
     b(1)=1+1/m;
     b(m-1)=1+(m-1)/m;
     b(m)=0;

    %MGS
    tic
    Q=zeros(n,1);
    r=zeros(n,1);  %上三角矩阵
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
    U=r;
    B=Q'*b;

    x=zeros(n,1);
   % Ux=B
    x(n)=B(n)/U(n,n);
    for i=n-1:(-1):1
        x(i)=(B(i)-U(i,i+1:end)*x(i+1:end))/U(i,i);
    end
    time2(m-4)=toc;
    wucha2(m-4)=norm(x-x0,2);
   
    
end
figure
plot([5:100],wucha2,'-*')


        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
