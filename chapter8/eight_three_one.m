%用幂法求解第二主特征值及其特征向量
n=101;
 %n=100
 %构造迭代矩阵
 t1=linspace(-1,-1,n-1);
 t2=linspace(2,2,n);
 A=diag(t1,1)+diag(t1,-1)+diag(t2);
 
 %初始向量
 v0=ones(n,1);
 
 %标准特征值
 l=zeros(n,1);
 for i=1:n
     l(i)=2*(1-cos(i*pi/(n+1)));
 end
 [lm,k]=max(l); %最大的标准特征值
 
 %标准特征向量
 vector0=zeros(n,1);
 for i=1:n
     vector0(i)=sin(i*k*pi/(n+1));
 end
 x1=sqrt(2/(n+1))*vector0;
 
 %求S1，householder矩阵
 t=sqrt(x1'*x1);
 e1=zeros(n,1);
 e1(1)=1;
 b=t*(t-e1'*x1);
 u=x1-t*e1;
 p=(1/b)*A*u;
 q=((1/b)*u'*A)';
 beta=(1/b)*u'*p;
 A2=A-p*u'-u*q'+beta*u*u';
 B=A2(2:end,2:end);
 v0=ones(n-1,1);
 [lamda2,vector2,error,times]=powermethod(v0,B,l(n-1),0);
 a=(A2(1,2:end)*vector2)/(lamda2-lm);
 z2=zeros(n,1);
 z2(1)=a;
 z2(2:end)=vector2;
 x2=z2-(1/b)*u*(u'*z2);
 
 
 times
 
 
 
 

