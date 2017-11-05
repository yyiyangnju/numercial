for m=5:30
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

    %U=zeros(n);  %生成上三角矩阵U
    tic
    H=eye(m);   %初始化H
    a=zeros(1,n);
    L=zeros(1,n);%记录每一列的长度
    B=zeros(1,n);  %记录b的值
    A(:,m)=b;
    for i=1:n
        L(i)=norm(A(:,i),2);  %算出每一列的长度
    end

    for i=1:n  %矩阵列满秩n
        x=A(i:end,i);
        sigma=sqrt(L(i)*L(i)-A(1:i-1,i)'*A(1:i-1,i)); %已有长度减去原来长度
        a(i)=-sign(x(1))*sigma;  
       
        e=zeros(m-i+1,1);  %从地i个元素开始的向量
        e(1)=1;  
        u=x-a(i)*e;
        B(i)=0.5*(u'*u); %记录每一次的b值
        Hh=eye(m-i+1)-(1/B(i))*(u*u');
        A(i:end,i:end)=Hh*A(i:end,i:end); %经过变换后重制的A的一部分
    end
    x(n)=A(n,m)/A(n,n);
    for i=n-1:(-1):1
        x(i)=(A(i,m)-A(i,i+1:n)*x(i+1:n))/A(i,i);
    end
    x   
    time3(m-4)=toc;
    wucha3(m-4)=norm(x-x0,2);
 
end
%figure
%plot([5:30],wucha3,'*')
  