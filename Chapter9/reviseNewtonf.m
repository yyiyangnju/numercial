function [y,i] =reviseNewtonf(x,m)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
x0=x;
d=df3(x0);
for i=1:m
    
    x1=x0-d\f3(x0);
    x0=x1;
end
y=x0;
