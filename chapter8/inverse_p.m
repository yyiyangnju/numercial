%���ݷ������2������ֵ
 %Ŀ�����T-2I ���Խ�Ԫ�طֱ�����d,a,c��
n=101;
% T=diag(ones(n,1)*2)+diag(ones(n-1,1)*(-1),1)+diag(ones(n-1,1)*(-1),-1);
d=ones(n)*0.00001;
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
i=1;%��ѭ��ָ��
place(1)=101; %�������ֵλ��
lamda(1)=1;

for k=1:1000
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
    maxi(i-1)=v(1);
    for j=2:n
        if abs(maxi(i-1))<abs(v(j))
            maxi(i-1)=v(j);
        end
    end
%     maxi;
    lamda(i-1)=(2-0.00001+1/maxi(i-1));
    place(i-1)=j;
    v=v/maxi(i-1);

end

figure(3)
plot(maxi,'.')
title('���ģ���׸�����')
figure(4)
plot(abs(maxi(100:end)))
title('���ģ���׸������ľ���ֵ')

figure(6)
plot(place,'.')
title('���ģ��λ��')
figure(7)
plot(lamda,'.')
