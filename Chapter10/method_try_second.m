T=1000;
h=[0.1 0.01 0.001 0.0001];
y0=[31;79];
f=@f3;
figure
for i=1:4
    y1=Eular(f,T,h(i),y0);
   % y2=trapezium(f,T,h(i),y0);
    %y3=RK3(f,T,h(i),y0);
    %y4=RK4(f,T,h(i),y0);
    %y5=Adams(f,T,h(i),y0);
    %figure
    %subplot(2,3,1);
    subplot(2,2,i);
    plot(y1(1,:),y1(2,:))
    title(['h=',num2str(h(i))]);
    % subplot(2,3,2);
    %plot(y2(1,:),y2(2,:))
    %title('梯形法');
     %subplot(2,3,3);
    %plot(y3(1,:),y3(2,:))
    %title('RK3');
    % subplot(2,3,4);
    %plot(y4(1,:),y4(2,:))
    %title('RK4');
    % subplot(2,3,5);
    %plot(y5(1,:),y5(2,:))
    %title('Adams');
    
   % syms p q
    %subplot(2,3,6);
    %ezplot(exp(-0.01*(p-y0(1)))*((p/y0(1))^0.25)-exp(0.01*(q-y0(2)))*((q/y0(2))^(-1)),[0,40],[60,140]);
    %title('real')
    %suptitle(['h=',num2str(h(i))]);
end


%变步长试试
%求不出显示解，无法判断误差