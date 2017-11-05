function [lamda,l,error,k] = recircleJacobi(A)
%ѭ��jacobi����
 n=size(A,1);
 eps=1e-8;
 %��׼����ֵ,�����T
 l=zeros(n,1);
 for i=1:n
     l(i)=2*(1-cos(i*pi/(n+1)));
 end

%ѭ����Jacobi�㷨
lamda=zeros(n,1);
k=1;
error=zeros(2,1);

while max(max(abs(A-diag(diag(A)))))>eps
    for i=1:n-1
        for j=i+1:n
            b=(A(i,i)-A(j,j))/(2*A(i,j));
            if b==0
                c=sqrt(2)/2;
                s=sign(A(i,j))*c;
            else
                t=1/(b+sign(b)*sqrt(1+b^2));
                c=1/sqrt(1+t^2);
                s=t*c;
            end
             A([i,j],:)=[c s;-s,c]*A([i,j],:);
             A(:,[i,j])=A(:,[i,j])*[c -s;s,c];
           
           % k=k+1;
        end
    end
   error(k)=norm(sort(diag(A))-l); 
   %��¼���
           
            p=diag(A);
            lamdaf(k)=p(1);
            lamdal(k)=p(n);
   k=k+1;
end
lamda=diag(A);
figure(1)
semilogy(error,'o-');
title('ѭ��Jacobi����½�����');
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

