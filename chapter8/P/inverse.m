function maxii=inverse(lamda,n)
d=ones(n)*2-lamda;
a=ones(n-1)*(-1);
c=ones(n-1)*(-1);
%�Ծ������LU�ֽ�/���Խ� L=diag(p,a) U=diag(1,q)
p=zeros(n);
q=zeros(n-1)  ;
p(1)=d(1);
q(1)=c(1)/d(1);
for k=2:n-1
    p(k)=d(k)-a(k)*q(k-1);
    q(k)=c(k)/p(k);
end
p(n)=d(n)-a(n)*q(n-1);    
%��ʼ����
v=ones(n,1);
i=2;%��ѭ��ָ��
maxi(1)=0;
maxi(2)=lamda;
while abs(maxi(i)-maxi(i-1))>1e-6
    i=i+1;
    %���Է��������
    v(1)=v(1)/d(1);
    for j=2:n
        v(j)=(v(j)-a(j)*v(j-1))/p(j);
    end
    for j=n-1:-1:1
        v(j)=v(j)-q(j)*v(j+1);
    end     
   %�����ģ���׸�����
    maxi(i)=v(1);
    for j=2:n
        if abs(maxi(i))<abs(v(j))
            maxi(i)=v(j);
        end
    end
%     maxi;
    v=v/maxi(i);
end
maxii=maxi(i);
end


% figure(3)
% plot(maxi,'.')
% title('���ģ���׸�����')
% figure(4)
% plot(abs(maxi(100:end)))
% title('���ģ���׸������ľ���ֵ')
% 
% figure(6)
% plot(place,'.')
% title('���ģ��λ��')
% figure(7)
% plot(lamda,'.')
% title('���2������ֵ')

        
    
