function [L,U] =Crout(A)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
 %crout·Ö½â
 n=size(A,1);
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
end

