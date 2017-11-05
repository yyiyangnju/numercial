function [Q,U] = MGS(A)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
%��ϰ6.13 MGS����

n=size(A,1);
m=size(A,2);
%MGS
r=zeros(m,m);  %�����Ǿ���
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

