function [Df] =df3(x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Df(1,1)=1;
Df(1,2)=1;
Df(2,1)=2*x(1);
Df(2,2)=2*x(2);
end

