function [J] =df4(x,lamda,T)
%����f4��jacobi����
n=size(T,1);
J=zeros(n+1);
for i=1:n
    J(i,1:n)=T(i,:);
    J(i,i)=T(i,i)-lamda;
    J(i,n+1)=-x(i);
    J(n+1,i)=2*x(i);
end

end

