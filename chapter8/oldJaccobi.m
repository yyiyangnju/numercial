function [lamda,l,error,i,vector] = oldJaccobi(A)  %vectorΪ������������
 n=size(A,1);
 eps=1e-8;
 %��׼����ֵ,�����T
 l=zeros(n,1);
 for i=1:n
     l(i)=2*(1-cos(i*pi/(n+1)));
 end
V0=eye(n); %��ʼ��������
%�����Jacobi�㷨
lamda=zeros(n,1);
i=1;
error=zeros(2,1);
%ѡ��Ԫ
B=A-diag(diag(A));
[a,d]=max(abs(B));
[a1,d1]=max(a);
 %���Ԫ
while  abs(A(d(d1),d1))>eps*sqrt(A(d(d1),d(d1))*A(d1,d1))
    b=(A(d(d1),d(d1))-A(d1,d1))/(2*A(d(d1),d1));
    if b>1.7e154
        t=sign(b)/(2*b);
         c=1/sqrt(t^2+1);
           s=c*t;
    else if b==0
            c=sqrt(2)/2;
            s=sign(A(d(d1),d1))*c;
        else
           t=1/((b+sign(b)*sqrt(b^2+1)));
           c=1/sqrt(t^2+1);
           s=c*t;
        end
    end
  
   A([d(d1),d1],1:end)=[c s;-s,c]*A([d(d1),d1],1:end);
   A(1:end,[d(d1),d1])=A(1:end,[d(d1),d1])*[c -s;s,c];
   V0(:,[d(d1),d1])=V0(:,[d(d1),d1])*[c -s;s,c];
   %��¼���
    error(i)=norm(sort(diag(A))-l);
    p=diag(A);
    lamdaf(i)=p(1);
    lamdal(i)=p(n);
    i=i+1; 
    
    %ѡ��Ԫ 
    B=A-diag(diag(A));
    [a,d]=max(abs(B));
    [a1,d1]=max(a);
    %A(d(d1),d1);  %���Ԫ
   
end
vector=V0;
lamda=diag(A);
figure(1)
semilogy(error,'o-');
title('�ŵ�Jacobi����½�����');
xlabel('��������');
ylabel('�Խ���Ԫ������ʵ����ֵ�ľ���')

figure(2)
plot(lamdaf,'*');
title('�Խ��ߵ�һ��ֵ�仯');
xlabel('��������');
ylabel('�Խ��ߵ�һ��ֵ');

figure(3)
plot(lamdal,'*');
title('�Խ������һ��ֵ�仯');
xlabel('��������');
ylabel('�Խ������һ��ֵ');



end

