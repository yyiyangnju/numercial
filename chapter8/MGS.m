function [Q,U] = MGS(A)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
%练习6.13 MGS方法

n=size(A,1);
m=size(A,2);
%MGS
r=zeros(m,m);  %上三角矩阵
for k=1:m-1
    r(k,k)=norm(A(:,k),2);
    A(:,k)=A(:,k)/r(k,k);
    for j=(k+1):m
        r(k,j)=A(:,k)'*A(:,j);
        A(:,j)=A(:,j)-r(k,j)*A(:,k);
    end
end
r(m,m)=norm(A(:,m),2);
A(:,m)=A(:,m)/r(m,m);
Q=A;
U=r;


end

