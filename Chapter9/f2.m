function [y] =f2(x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
y=zeros(2,1);
y(1)=(x(1)+3)*(x(2)^2-7)+18;
y(2)=sin(x(2)*exp(x(1))-1);

end

