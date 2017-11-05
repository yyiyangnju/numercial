 n=100;
 %n=100
 %构造迭代矩阵
 t1=linspace(-1,-1,n-1);
 t2=linspace(2,2,n);
 T=diag(t1,1)+diag(t1,-1)+diag(t2);
 
 %初始向量
 v0=ones(n,1);
 v0(n-2:n)=0;
 
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
 vector0=sqrt(2/(n+1))*vector0;
 
 %进行幂法计算
 %[lamda1,v1,error1,times1]=Rayleigh(v0,T,lm,vector0);
 [lamda2,v2,error2,times2]=Atiken(v0,T,lm,vector0);
 %[lamda3,v3,error3,times3]=powermethod(v0,T,lm,vector0);
 

 

  