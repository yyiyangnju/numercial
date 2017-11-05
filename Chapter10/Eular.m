function [y] =Eular(f,T,h,y0)
%Euler���߷�
%TΪ���䳤�ȣ���0��ʼ
%hΪ����
%y0Ϊ��ʼֵ
%�����ÿ��ʱ���Ľ���ֵ
n=T/h;

y=zeros(2,2);  %��¼ÿһ��ʱ���Ľ���ֵ
t=zeros(1,2);  %��¼ÿһ����ʱ���
t(1)=0;  
y(:,1)=y0
for i=1:n
    t(i+1)=i*h;
   
end

for j=1:length(t)-1
    y(:,j+1)=y(:,j)+h.*f(t(j),y(:,j));  %����y����������
end

 %syms v(x);
 %s1=dsolve(diff(v)==f(x,v),'v(0)=y0','x');  %����ֵ
 %s=subs(s1,'y0',y0);
 %'Du=1-2*x*u/(1+x^2)'
 %y1=subs(s,t); %��t��Ϊ�Ա���������ֵ
 %e=abs(y1-y);  %���
%figure
%ezplot(s,t)
 
 
 %hold on
 %plot(t,y,'*-')
 
 %legend('real','Euler')
 
% figure
%plot(e,'*-')
 %����ȡ0.1 0.01 0.001 
 %����ȡ 1 10 100
 %�����������£�����½��Ƚ�

end

