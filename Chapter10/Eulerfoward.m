%Euler���߷�
T=1;
h=0.1;
n=T/h;
k=1;
y=zeros(2,1);
t=zeros(2,1);
t(1)=0;
y(1)=0;
for i=1:n
    t(i+1)=i*0.1;
   
end
for j=1:length(t)-1
    y(j+1)=y(j)+h*f1(t(j),y(j));
end

 s=dsolve('Du=1-2*x*u/(1+x^2)','u(0)=0','x');
 y1=subs(s,t)
 e=abs(y1-y);
figure

 ezplot(s,t)

 
 hold on
 plot(t,y)
 
 legend('real','Euler')
 
 figure
 plot(e)
 %����ȡ0.1 0.01 0.001 
 %����ȡ 1 10 100
 %�����������£�����½��Ƚ�
 