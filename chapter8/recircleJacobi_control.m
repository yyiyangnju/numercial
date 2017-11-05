function [lamda,l,error,k] =recircleJacobi_control(A)
%带有阈值的循环jacobi
%对于该方法，eps不用设计的太大
n=size(A,1);
eps=1e-6;

 %标准特征值,针对于T
 l=zeros(n,1);
 for i=1:n
     l(i)=2*(1-cos(i*pi/(n+1)));
 end

%循环的Jacobi算法
lam=zeros(n,1);
k=1;
error=zeros(2,1);

E=norm(A-diag(diag(A)),'fro');
sigma=E/n;
while max(max(abs(A-diag(diag(A)))))>eps
   
   for i=1:n
       for j=i+1:n
           if abs(A(i,j))<sigma
              
               continue
           end
           b=(A(i,i)-A(j,j))/(2*A(i,j));
           if b==0
              c=sqrt(2)/2;
              s=sign(A(i,j))*c;
           else
              t=1/(b+sign(b)*sqrt(1+b^2));
              c=1/sqrt(1+t^2);
              s=t*c;
           end
        
           A([i,j],1:end)=[c s;-s,c]*A([i,j],1:end);
           A(1:end,[i,j])=A(1:end,[i,j])*[c -s;s,c];
          %记录误差
          
       end
   end 
    error(k)=norm(sort(diag(A))-l);
           p=diag(A);
           lamdaf(k)=p(1);
           lamdal(k)=p(n);
           k=k+1; 
   sigma=sigma/n;
end
    

lamda=diag(A);
figure(1)
semilogy(error,'o-');
title('阈值循环Jacobi误差下降曲线');
xlabel('迭代次数');
ylabel('对角线元素与真实特征值的距离');

figure(2)
plot(lamdaf,'*');
title('对角线第一个值变化');
xlabel('迭代次数');
ylabel('对角线第一个值');

figure(3)
plot(lamdal,'*');
title('对角线最后一个值变化');
xlabel('迭代次数');
ylabel('对角线最后一个值');



end

