function [lamdamin] =recircleJacobi_control1(A)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
n=size(A,1);
eps=1e-6; %精度最多是这个
k=1;

%循环阈值的Jacobi算法
lamda=zeros(n,1);
E=norm(A-diag(diag(A)),'fro');
sigma=E/n;
while abs(min(diag(A))-9.81818e-1)>eps
   
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
           mine(k)=min(diag(A))
          k=k+1;
       end
   end
   sigma=sigma/n;
end
    

lamdamin=min(diag(A));
figure
plot(mine,'*')
title('对角线最小值的变化')

end

