function [lamda,vector,error1,error2,b,U]  = repowermethod(v,A,lamda0,vector0)
%反幂法计算最靠近2的特征值
 n=size(A,1);
 vector=zeros(n,1); %特征向量；
 %error=zeros(1,3);%记录真实误差变化
 %distance=zeros(1,3);
 %t=1; %记录每一次的误差
 i=1; %指标
 vector=v; %任取的L^-1*v0
 u=zeros(n,1);
 u1=zeros(n,1);
 
 %crout分解
 L=zeros(n);
 U=zeros(n);
 A(1,2:end)=A(1,2:end)/A(1,1);
 for k=2:(n-1)
     A(k:end,k)=A(k:end,k)-A(k:end,1:k-1)*A(1:k-1,k);
     A(k,k+1:n)=(A(k,k+1:n)-A(k,1:k-1)*A(1:k-1,k+1:end))/A(k,k);
 end
 A(n,n)=A(n,n)-A(n,1:n-1)*A(1:n-1,n);
 L=tril(A);
 U=A-L+diag(ones(1,n));
     
 
 %反幂法迭代
 u(n)=vector(n)/U(n,n);
 for j=(n-1):(-1):1
     u(j)=vector(j)-U(j,j+1:end)*u(j+1:end);
 end
 b=u;
 [a,d]=max(abs(u));
  m=u(d);
  vector=u/m;
  error1(i)=abs(m-lamda0);
  error2(i)=norm(vector/norm(vector)-vector0/norm(vector0)); %特征向量的误差
  i=i+1
  
  %第一次迭代
   %解L*U1=vector

     u1(1)=vector(1)/L(1,1);
     for j=2:n
         u1(j)=(vector(j)-L(j,1:j-1)*u1(1:j-1))/L(j,j);
     end
     u(n)=u1(n);
     for j=n-1:(-1):1
         u(j)=u1(j)-U(j,j+1:end)*u(j+1:end);
     end
     [a,d]=max(abs(u));
     m=u(d);
     vector=u/m;
     t=abs(m-lamda0);
     error1(i)=t;
     error2(i)=norm(vector/norm(vector)-vector0/norm(vector0)); %特征向量的误差
    lamda=m;

end

