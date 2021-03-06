function [m,vector,error,i] = Rayleigh(v,A,lamda0,vector0)
%幂法的Rayleigh商加速
vector=zeros(size(A,1),1); %特征向量；
 error=zeros(1,3);%记录真实误差变化
 distance=zeros(1,3);
 t=1; %记录每一次的误差
 i=1; %指标
 vector=v;
 while t>1e-6
     u=A*vector;
     [a,d]=max(abs(u));
     m=u(d);
     vector=u/m;
     M=(vector'*A*vector)/(vector'*vector);
     t=abs(M-lamda0);  %真实误差
     error(i)=t;  
     distance(i)=norm((vector/norm(vector))*(vector/norm(vector))'-(vector0/norm(vector0))*(vector0/norm(vector0))');  %计算距离之前要先把每一个单位化
     i=i+1;
 end
 
 figure(1)
 semilogy(error,'o-')
 title('特征值误差变化');
 xlabel('迭代次数');
 ylabel('误差')
 
 figure(2)
 semilogy(distance,'o')
 title('特征子空间距离变化')
 xlabel('迭代次数')
 ylabel('子空间距离')



end

