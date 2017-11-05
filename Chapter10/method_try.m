%实现每一种方法
f=@f2;
T=3;
h=0.1;
E=[0.01 0.1 -0.01 -0.1];
y0=2;
t(1)=0;
n=T/h;
for i=1:n
    t(i+1)=i*h;
end

for i=1:4
    [error1,y1]=Eular(f,T,h,y0+E(i));
    [error2,y2]=trapezium(f,T,h,y0+E(i));
    [error3,y3]=RK3(f,T,h,y0+E(i));
    [error4,y4]=RK4(f,T,h,y0+E(i));
    [error5,y5]=Adams(f,T,h,y0+E(i));
    figure
    plot(t,y1,'*-');
    hold on
    plot(t,y2,'o-');
    hold on
    plot(t,y3,'v-');
     hold on
    plot(t,y4,'x-');
     hold on
    plot(t,y5,'s-');
    
    syms v(x);
    s1=dsolve(diff(v)==f2(x,v),'v(0)=y0','x');  %解真值
    s=subs(s1,'y0',y0+E(i));
    hold on
    ezplot(s,t)
    
    legend('Euler','梯形法','RK3','RK4','Adams','real')
    title(['ep=',num2str(E(i)),'近似值比较'])
    
    figure
    plot(t,error1,'*-');
     hold on
      plot(t,error2,'o-');
      hold on
      plot(t,error3,'v-');
      hold on
       plot(t,error4,'x-');
       hold on
      plot(t,error5,'s-');
      legend('Euler','梯形法','RK3','RK4','Adams')
      title(['ep=',num2str(E(i)),'误差比较'])
end

%end
%plot(log(H),log(e),'*')
%hold on
%p=polyfit(log(H),log(e),1);
%s=poly2sym(p);
%ezplot(s);

 
 % [error1,y1]=Eular(f,T,h,y0);
 %[error2,y2]=trapezium(f,T,h,y0);
%[error3,y3]=RK3(f,T,h,y0);
%[error4,y4]=RK4(f,T,h,y0);
%[error5,y5]=Adams(f,T,h,y0);

%考虑ep大于零小于零