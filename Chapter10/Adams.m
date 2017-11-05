function [y] =Adams(f,T,h,y0)
%传出误差，时间节点的近似值
n=T/h;
t=zeros(1,2);
y=zeros(2,2);  %记录近似值
t(1)=0;
y(:,1)=y0;
for i=1:n
    t(i+1)=i*h;
end
y(:,2)=y(:,1)+h*f(t(1),y(:,1));
y(:,3)=y(:,2)+h*f(t(2),y(:,2));
for j=3:n
   y(:,j+1)=y(:,j)+h/12*(23*f(t(j),y(:,j))-16*f(t(j-1),y(:,j-1))+5*f(t(j-2),y(:,j-2)));
end
%syms v(x);
 %s1=dsolve(diff(v)==f(x,v),'v(0)=y0','x');  %解真值
 %s=subs(s1,'y0',y0);
 %y1=subs(s,t); %将t作为自变量带入求值
 %e=abs(y1-y);  %误差
%figure
%ezplot(s,t)
 
 
 %hold on
 %plot(t,y,'*')
 
 %legend('real','梯形法')
 
 %figure
% plot(e,'*-')


end

