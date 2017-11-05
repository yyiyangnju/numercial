%Á·Ï°6.22
A=[1e40 1e29 1e19;1e29 1e20 1e9;1e19 1e9 1];
l=[1e40,9.9e19,9.81818e-1]';
[lamdamin]=recircleJacobi_control1(A)
lamda1=eig(A);
error1=abs(lamdamin-9.81818e-1);
error2=norm(lamda1-ones(3,1)*9.81818e-1);