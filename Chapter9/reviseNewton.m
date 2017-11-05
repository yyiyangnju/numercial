%修正Newton
tol=1e-5;
x=zeros(2,2); 
e1=zeros(2,1);
for m=1:4
    x0=[5,1]';
  
    for i=1:1000
        [x1,j]=reviseNewtonf(x0,m);
        x1
        e1(m,i)=norm(x1-x0);
        if e1(m,i)<tol
            break
        end
        x0=x1;
    end
    if i<1000
        x(:,m)=x1
        figure
        semilogy(e1(m,:),'*-')
      
    else
        continue
    end
end
  
%%[2,1]为初值时为什么不行
