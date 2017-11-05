function [lamda,l,error,i,vector] = oldJaccobi(A)  %vector为特征向量矩阵
 n=size(A,1);
 eps=1e-8;
 %标准特征值,针对于T
 l=zeros(n,1);
 for i=1:n
     l(i)=2*(1-cos(i*pi/(n+1)));
 end
V0=eye(n); %初始特征矩阵
%经典的Jacobi算法
lamda=zeros(n,1);
i=1;
error=zeros(2,1);
%选主元
B=A-diag(diag(A));
[a,d]=max(abs(B));
[a1,d1]=max(a);
 %最大元
while  abs(A(d(d1),d1))>eps*sqrt(A(d(d1),d(d1))*A(d1,d1))
    b=(A(d(d1),d(d1))-A(d1,d1))/(2*A(d(d1),d1));
    if b>1.7e154
        t=sign(b)/(2*b);
         c=1/sqrt(t^2+1);
           s=c*t;
    else if b==0
            c=sqrt(2)/2;
            s=sign(A(d(d1),d1))*c;
        else
           t=1/((b+sign(b)*sqrt(b^2+1)));
           c=1/sqrt(t^2+1);
           s=c*t;
        end
    end
  
   A([d(d1),d1],1:end)=[c s;-s,c]*A([d(d1),d1],1:end);
   A(1:end,[d(d1),d1])=A(1:end,[d(d1),d1])*[c -s;s,c];
   V0(:,[d(d1),d1])=V0(:,[d(d1),d1])*[c -s;s,c];
   %记录误差
    error(i)=norm(sort(diag(A))-l);
    p=diag(A);
    lamdaf(i)=p(1);
    lamdal(i)=p(n);
    i=i+1; 
    
    %选主元 
    B=A-diag(diag(A));
    [a,d]=max(abs(B));
    [a1,d1]=max(a);
    %A(d(d1),d1);  %最大元
   
end
vector=V0;
lamda=diag(A);
figure(1)
semilogy(error,'o-');
title('古典Jacobi误差下降曲线');
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

