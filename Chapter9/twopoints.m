%两点序列牛顿法
x0=[0,0]';
x1=[2.9,0.7]';
dx=zeros(2,1);
tol=1e-5;
%x0=[0,1];
%if f3(x0)<tol
    %error('初值为解')
%end
%第一次迭代x1
  %  [L,U]=Crout(df3(x0));
  %  y=-f3(x0);
  %  %解LU(dx)=y(二阶的不需要循环)
  %  x(1)=y(1)/L(1,1);
  %  x(2)=(y(2)-x(1)*L(2,1))/L(2,2);
  %  dx(2)=x(2)/U(2,2);
  %  dx(1)=(x(1)-dx(2)*U(1,2))/U(1,1);
  %  x1=x0+dx;
    
for i=1:200
    x2=x1-twopointsJf(x0,x1)\f3(x1)
    e3(i)=norm(x1-x2,1);
    if e3(i)<tol
        break
    end
    x0=x1;
    x1=x2;
end
if i<200
    x1
else
    error('method failed')
end
   
figure
semilogy(e3,'*-')


%如果初值的x1由牛顿法得到，则很快就可以逼近
%如果任取x1为初值，则需要一段收敛过程