function [y] =Eular(f,T,h,y0)
%Euler折线法
%T为区间长度，从0开始
%h为步长
%y0为初始值
%输出误差，每个时间点的近似值
n=T/h;

y=zeros(2,2);  %记录每一个时间点的近似值
t=zeros(1,2);  %记录每一步的时间点
t(1)=0;  
y(:,1)=y0
for i=1:n
    t(i+1)=i*h;
   
end

for j=1:length(t)-1
    y(:,j+1)=y(:,j)+h.*f(t(j),y(:,j));  %这里y都是列向量
end

 %syms v(x);
 %s1=dsolve(diff(v)==f(x,v),'v(0)=y0','x');  %解真值
 %s=subs(s1,'y0',y0);
 %'Du=1-2*x*u/(1+x^2)'
 %y1=subs(s,t); %将t作为自变量带入求值
 %e=abs(y1-y);  %误差
%figure
%ezplot(s,t)
 
 
 %hold on
 %plot(t,y,'*-')
 
 %legend('real','Euler')
 
% figure
%plot(e,'*-')
 %步长取0.1 0.01 0.001 
 %区间取 1 10 100
 %整体误差情况下，误差下降比较

end

