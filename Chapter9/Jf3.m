function [J] =Jf3(x,h)
%������̱ƽ�����
e1=[1,0]';
e2=[0,1]';
y1=f3(x+h*e1);
y2=f3(x+h*e2);
z1=f3(x);
J(1,1)=(y1(1)-z1(1))/h;
J(1,2)=(y2(1)-z1(1))/h;
J(2,1)=(y1(2)-z1(2))/h;
J(2,2)=(y2(2)-z1(2))/h;

end

