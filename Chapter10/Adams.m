function [y] =Adams(f,T,h,y0)
%������ʱ��ڵ�Ľ���ֵ
n=T/h;
t=zeros(1,2);
y=zeros(2,2);  %��¼����ֵ
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
 %s1=dsolve(diff(v)==f(x,v),'v(0)=y0','x');  %����ֵ
 %s=subs(s1,'y0',y0);
 %y1=subs(s,t); %��t��Ϊ�Ա���������ֵ
 %e=abs(y1-y);  %���
%figure
%ezplot(s,t)
 
 
 %hold on
 %plot(t,y,'*')
 
 %legend('real','���η�')
 
 %figure
% plot(e,'*-')


end

