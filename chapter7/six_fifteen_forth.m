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
     
     A(:,m)=b;
     %givens
     tic
     for i=1:n
         for j=m-1:(-1):i
             if A(j+1,i)~=0
                if abs(A(j+1,i))>=abs(A(j,i))
                    t=A(j,i)/A(j+1,i);
                    s=1/sqrt(1+t^2);
                    c=s*t;
                   
                else
                    t=A(j+1,i)/A(j,i);
                    c=1/sqrt(1+t*t);
                    s=c*t;
                   
                end
             else
                  c=1;
                  s=0;
                 
             end
             G=[c s;-s c];
             A(j:j+1,:)=G*A(j:j+1,:);
            
         end
     end
     x=zeros(n,1);
     x(n)=A(n,m)/A(n,n);
     for i=n-1:(-1):1
         x(i)=(A(i,m)-A(i,i+1:n)*x(i+1:n))/A(i,i);
     end
     time4(m-4)=toc;
     wucha4(m-4)=norm(x-x0,2);
   
end
%figure
%plot([5:30],wucha4,'r-*')
        
     
     
     
     
     
     
     
     
     
     
     