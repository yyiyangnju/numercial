n=100;
%n=101;

 %构造迭代矩阵
 t1=linspace(-1,-1,n-1);
 t2=linspace(2,2,n);
 T=diag(t1,1)+diag(t1,-1)+diag(t2);
 T1=T-diag(ones(n,1)*2)+diag(ones(n,1)*0.001);
 
 %初始向量
 v0=ones(n,1);
 
  %标准特征值
 l=zeros(n,1);
 for i=1:n
     l(i)=2*(1-cos(i*pi/(n+1)));
 end
 l0=abs(l-2);
 [lm,k]=min(l0); %最大的标准特征值
 lm=l(k);
 
 %标准特征向量
 vector0=zeros(n,1);
 for i=1:n
     vector0(i)=sin(i*k*pi/(n+1));
 end
 vector0=sqrt(2/(n+1))*vector0;
 
 %进行反幂法计算
 [lamda,vector,error1,error2,b,U]=repowermethod(v0,T1,lm,vector0);
 
 error1
 error2
