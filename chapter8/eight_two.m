n=100;
%n=101;

 %�����������
 t1=linspace(-1,-1,n-1);
 t2=linspace(2,2,n);
 T=diag(t1,1)+diag(t1,-1)+diag(t2);
 T1=T-diag(ones(n,1)*2)+diag(ones(n,1)*0.001);
 
 %��ʼ����
 v0=ones(n,1);
 
  %��׼����ֵ
 l=zeros(n,1);
 for i=1:n
     l(i)=2*(1-cos(i*pi/(n+1)));
 end
 l0=abs(l-2);
 [lm,k]=min(l0); %���ı�׼����ֵ
 lm=l(k);
 
 %��׼��������
 vector0=zeros(n,1);
 for i=1:n
     vector0(i)=sin(i*k*pi/(n+1));
 end
 vector0=sqrt(2/(n+1))*vector0;
 
 %���з��ݷ�����
 [lamda,vector,error1,error2,b,U]=repowermethod(v0,T1,lm,vector0);
 
 error1
 error2
