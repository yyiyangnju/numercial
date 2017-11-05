function [lamda,l,error,k] =recircleJacobi_control(A)
%������ֵ��ѭ��jacobi
%���ڸ÷�����eps������Ƶ�̫��
n=size(A,1);
eps=1e-6;

 %��׼����ֵ,�����T
 l=zeros(n,1);
 for i=1:n
     l(i)=2*(1-cos(i*pi/(n+1)));
 end

%ѭ����Jacobi�㷨
lam=zeros(n,1);
k=1;
error=zeros(2,1);

E=norm(A-diag(diag(A)),'fro');
sigma=E/n;
while max(max(abs(A-diag(diag(A)))))>eps
   
   for i=1:n
       for j=i+1:n
           if abs(A(i,j))<sigma
              
               continue
           end
           b=(A(i,i)-A(j,j))/(2*A(i,j));
           if b==0
              c=sqrt(2)/2;
              s=sign(A(i,j))*c;
           else
              t=1/(b+sign(b)*sqrt(1+b^2));
              c=1/sqrt(1+t^2);
              s=t*c;
           end
        
           A([i,j],1:end)=[c s;-s,c]*A([i,j],1:end);
           A(1:end,[i,j])=A(1:end,[i,j])*[c -s;s,c];
          %��¼���
          
       end
   end 
    error(k)=norm(sort(diag(A))-l);
           p=diag(A);
           lamdaf(k)=p(1);
           lamdal(k)=p(n);
           k=k+1; 
   sigma=sigma/n;
end
    

lamda=diag(A);
figure(1)
semilogy(error,'o-');
title('��ֵѭ��Jacobi����½�����');
xlabel('��������');
ylabel('�Խ���Ԫ������ʵ����ֵ�ľ���');

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

