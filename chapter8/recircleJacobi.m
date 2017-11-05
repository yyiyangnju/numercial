function [lamda,l,error,k] = recircleJacobi(A)
%循环jacobi方法
 n=size(A,1);
 eps=1e-8;
 %标准特征值,针对于T
 l=zeros(n,1);
 for i=1:n
     l(i)=2*(1-cos(i*pi/(n+1)));
 end

%循环的Jacobi算法
lamda=zeros(n,1);
k=1;
error=zeros(2,1);

while max(max(abs(A-diag(diag(A)))))>eps
    for i=1:n-1
        for j=i+1:n
            b=(A(i,i)-A(j,j))/(2*A(i,j));
            if b==0
                c=sqrt(2)/2;
                s=sign(A(i,j))*c;
            else
                t=1/(b+sign(b)*sqrt(1+b^2));
                c=1/sqrt(1+t^2);
                s=t*c;
            end
             A([i,j],:)=[c s;-s,c]*A([i,j],:);
             A(:,[i,j])=A(:,[i,j])*[c -s;s,c];
           
           % k=k+1;
        end
    end
   error(k)=norm(sort(diag(A))-l); 
   %记录误差
           
            p=diag(A);
            lamdaf(k)=p(1);
            lamdal(k)=p(n);
   k=k+1;
end
lamda=diag(A);
figure(1)
semilogy(error,'o-');
title('循环Jacobi误差下降曲线');
xlabel('迭代次数');
ylabel('对角线元素与真实特征值的距离')

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

