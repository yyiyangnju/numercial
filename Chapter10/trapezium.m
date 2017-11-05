function [y] =trapezium(f,T,h,y0)
%���η�
%������ʱ��ڵ�Ľ���ֵ
n=T/h;
t=zeros(1,2);
y=zeros(2,2);  %��¼����ֵ
t(1)=0;
y(:,1)=y0;
for i=1:n
    t(i+1)=i*h;
end

for j=1:n
    u0=y(:,j)+h.*f(t(j),y(:,j));
    y(:,j+1)=y(:,j)+(h/2).*(f(t(j),y(:,j))+f(t(:,j+1),u0));
end
%syms v(x);
 %s1=dsolve(diff(v)==f(x,v),'v(0)=y0','x');  %����ֵ
 %s=subs(s1,'y0',y0);
 %y1=subs(s,t); %��t��Ϊ�Ա���������ֵ
 %e=abs(y1-y);  %���
%figure
%ezplot(s,t)
 
 
% hold on
% plot(t,y,'*')
 
 %legend('real','���η�')
 
 %figure
 %plot(e,'*-')

end

