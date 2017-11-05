function [Df] =df2(x)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
Df(1,1)=x(2)^2-7;
Df(1,2)=2*(x(1)+3)*x(2);
Df(2,1)=x(2)*exp(x(1))*cos(x(2)*exp(x(1))-1);
Df(2,2)=exp(x(1))*cos(x(2)*exp(x(1))-1);

end

