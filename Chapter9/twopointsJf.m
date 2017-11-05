function [A] =twopointsJf(x0,x1)
%两点序列法的差分矩阵
n=length(x0);
h=zeros(2,1);
e=zeros(n,1);
A=zeros(n);
for i=1:n
    E=e;
    E(i)=1;
    h(i)=x0(i)-x1(i);
    A(:,i)=(f3(x1+h(i)*E)-f3(x1))./h(i);
end
end

