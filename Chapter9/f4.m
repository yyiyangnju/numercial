function [y] =f4(x,lamda,T)
%�󷽳�f4��ֵ
%xλ������
n=size(T,1);
y=zeros(n+1,1);
for i=1:n
    y(i)=T(i,:)*x-lamda*x(i);
end
y(n+1)=x'*x-1;

end

