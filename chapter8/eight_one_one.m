 n=100;
 %n=100
 %�����������
 t1=linspace(-1,-1,n-1);
 t2=linspace(2,2,n);
 T=diag(t1,1)+diag(t1,-1)+diag(t2);
 
 %��ʼ����
 v0=ones(n,1);
 v0(n-2:n)=0;
 
 %��׼����ֵ
 l=zeros(n,1);
 for i=1:n
     l(i)=2*(1-cos(i*pi/(n+1)));
 end
 [lm,k]=max(l); %���ı�׼����ֵ
 
 %��׼��������
 vector0=zeros(n,1);
 for i=1:n
     vector0(i)=sin(i*k*pi/(n+1));
 end
 vector0=sqrt(2/(n+1))*vector0;
 
 %�����ݷ�����
 %[lamda1,v1,error1,times1]=Rayleigh(v0,T,lm,vector0);
 [lamda2,v2,error2,times2]=Atiken(v0,T,lm,vector0);
 %[lamda3,v3,error3,times3]=powermethod(v0,T,lm,vector0);
 

 

  